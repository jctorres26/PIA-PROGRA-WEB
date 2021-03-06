var totalnotas = 0;
var cantidadMostrar = 10;
var indiceposi = 0;
var pages = 0;




function cargarPaginacion( indice, cantidad){
        $.ajax({
            data: {indice: indice, cantidad: cantidad}, 
            type: "POST",
            dataType: "json",
            url: "GetNotas"
        }).done(function(data, textEstado, jqXHR){
            console.log(data);
            var str = "";
            
            data.notas.forEach( function(valor, indice) {
                str+='<form class="containerDASHBOARD" action="EditNoteController?idNota='+valor.idNota+' " method="POST"> <div class="alinearB"> <input type="submit" class="BotonE" value="..."></div> <h4>┬íNotebank!</h4> <input type="hidden" name="idNota" value="'+valor.idNota+'"> <p>'+valor.descripcion+' </p>  </form>';
                   
});
            
            $("#NOTAS").html(str);
            
        }).fail(function(jqXHR, textEstado){
            console.log("la solicitud regreso un error: " + textEstado);
        });
    
}

 $.ajax({
            async: false,
            type: "GET",
            dataType: "json",
            url: "GetNotasTotal"
        }).done(function(data, textEstado, jqXHR){
            console.log(data);
            if(data.respuesta == true){
                   console.log(data);
                   
                   totalnotas = data.cantidad;
                   var str = '<ul class="listaP"><li class="page-item" id="Previous"><a class="page-link" href="#">Previous</a></li>';
       
                   pages = Math.ceil( totalnotas / cantidadMostrar );
                   for(let i = 1; i < pages; i++){
                       str += '<li class="page-item-indice" indice="'+ i +'"><a class="page-link" href="#">'+ i +'</a></li>';
                   }
                  
                    str += '<li class="page-item" id="Next"><a class="page-link" href="#">Next</a></li></ul>';
                    
                    $("#PAGINAS").html(str);
                    cargarPaginacion(0, cantidadMostrar);
            }else{
                alert("No existen notas a mostrar");
            }
            
        }).fail(function(jqXHR, textEstado){
            console.log("la solicitud regreso un error: " + textEstado);
        });
        
        
$(document).ready(function(){

    $(".indice").click(function(){
      $(".page-item").removeClass("active");
     $(this).addClass("active");
    indiceposi = $(this).attr("indice");
     cargarPaginacion( (indiceposi * cantidadMostrar), cantidadMostrar);
    });

 $("#Previous").click(function(){
      $(".page-item").removeClass("active");
 
     if(indiceposi > 0){
    indiceposi--;
       $(".page-item:nth-child(" + indiceposi + ")").addClass("active");
     cargarPaginacion( (indiceposi * cantidadMostrar), cantidadMostrar);
     }
    });
    
     $("#Next").click(function(){
      $(".page-item").removeClass("active");

       if(indiceposi < pages){
         indiceposi++;
             $(".page-item:nth-child(" + indiceposi + ")").addClass("active");
     cargarPaginacion( (indiceposi * cantidadMostrar), cantidadMostrar);
     }
    });
});