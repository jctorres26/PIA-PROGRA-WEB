<%-- 
    Document   : perfil
    Created on : 13/10/2021, 04:51:54 PM
    Author     : ALEXANDRA
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
 
 session = request.getSession();

 %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="assets/css/perfil.css">
        <link href="https://fonts.googleapis.com/css2?family=Truculenta:wght@400;500&display=swap" rel="stylesheet">
        <link href="css/style.css" rel="stylesheet" />
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous">
    </script>
        <script src="assets/javascript/validar_perfil.js"></script>
        <title>Perfil</title>
    </head>
    <body style="background-color: #A0E7E5;" >
        <!-- BARRA NAVEGACION -->
        <header class="header">
            <nav class="nav">
                <img src="assets/imagenes/LOGO.png" width="250" height="90" >
                <!-- BUSCADOR -->

                <ul class="nav_barra">
                    <!--  <li class="nav_barra_item"> <a href="dashboard.jsp" class="nav_barra_link"> DASHBOARD </a> </li> -->

                    <form  action="SimpleSearchController?username=<%= session.getAttribute("Username")%>" method="POST" ;" >
                        <li class="nav_barra_item"> 
                            <input type="text" name="search" placeholder= "Busca tu nota" class="Barra_busqueda" autocomplete="off">
                            <input class="btn_buscar" id="btnenviar" type="submit" value="Buscar">
                        </li>

                    </form>

                    <li class="nav_barra_item"> <a href="dashboard.jsp" class="nav_barra_link"> DASHBOARD </a> 
                        <ul class="subbarra">
                            <li class="subnivel"> <a href="crear_nota.jsp" > CREAR NOTA </a> </li>
                            <li class="subnivel"> <a href="busqueda_avanzada.jsp" > BUSQUEDA AV. </a> </li>

                        </ul>
                    </li>

                    <li class="nav_barra_item"> <a href="perfil.jsp" class="nav_barra_link"> <img src="<%= session.getAttribute("ImagenPerfil") %>" width="100" height="90" align="left"><%= session.getAttribute("Username")%> </a> </li>
                    <li class="nav_barra_item"> <a href="LogOffController" class="nav_barra_link"> LOG OUT </a> </li>

                </ul>

            </nav>
        </header>
        
        <!-- DATOS PERFIL -->
        
        <!-- MAIN CLASS -->
        

            <form class="PERFIL" name="Editar_perfil" action="ProfileController" method="POST" enctype="multipart/form-data" onsubmit="return validar();" > 
                <h3>  ¡Hola <%=session.getAttribute("Username")%> ! </h3>
                <input type="hidden" name ="usuario" value="<%=session.getAttribute("Username")%>">
                <img class="img2" id="FotografiadePerfil" name="fotografia"  src="<%= session.getAttribute("ImagenPerfil") %>" width="150" height="140" >
                <div id="divPLACEHOLDER">
                   
                <input  id="FotoUsuario" type="file"  name="Fotografia" placeholder="Foto de perfil" class="input-foto" >
              <p id="texto">   Cambiar foto</p>
                </div>
                
                 <!-- NOMBRES -->
                 <div id="mensaje1" class="errores">Formato de nombre incorrecto</div>
                 <div id="mensaje2" class="errores" >Formato de apellido incorrecto</div>
                 <div id="mensaje6" class="errores" >Formato del  correo   incorrecto</div>
                 <div id="mensaje4" class="errores" >Formato de contraseña incorrecto</div>
                <div class="row">
                    <div class="col-25">
                        <label for="Nombre">Nombre(s)</label>
                    </div>
                    <div class="col-75">
                        <input class="input2" type="text" id="Nombre" name="Nombre" value="<%=session.getAttribute("Nombre")%>">
                        
                    </div>
                </div>
                 <!-- APELLIDOS -->
                <div class="row">
                    <div class="col-25">
                        <label for="Apellido">Apellidos(s)</label>
                    </div>
                    <div class="col-75">
                        <input class="input2" type="text" id="Apellido" name="Apellido" value="<%=session.getAttribute("Apellido")%>">
                    </div>
                </div>
                 <!-- CORREO -->
                <div class="row">
                    <div class="col-25">
                        <label for="correo">Correo Eletronico</label>
                    </div>
                    <div class="col-75">
                        <input class="input2" type="text" id="correo" name="correo" value="<%=session.getAttribute("Correo")%>" >
                    </div>
                </div>
                 <!-- FECHA NACIMIENTO -->
                <div class="row">
                    <div class="col-25">
                        <label for="fecha">Fecha Nacimiento</label>
                    </div>
                    <div class="col-75">
                        <input class="fechita" type="date" min='1900-01-01' max = '2000-01-01' value='<%=session.getAttribute("FechaNac")%>' id="fecha_nacimiento" name="fecha" value="" >
                    </div>
                </div>
                  <!-- EDAD -->
                 <div class="row">
                    <div class="col-25">
                        <label for="Edad">Edad</label>
                    </div>
                    <div class="col-75">
                        <input class="input2" type="text" id="Edad" name="Edad" value="" disabled>
                    </div>
                </div>
                  
                   <!-- CONTRASEÑA -->
                 <div class="row">
                    <div class="col-25">
                        <label for="contra">Contraseña</label>
                    </div>
                    <div class="col-75">
                        <input class="input2" type="text" id="contra" name="contra" value="<%=session.getAttribute("Contra")%>" >
                    </div>
                </div>
                    <p id="demo" name="demo"></p>
                   
               <input type="submit"id="enviar" value="Actualizar" class="Boton_actualizar" onclick=" return validar()" >


            </form> 

        
        
        <!-- FOOTER -->
        <footer class= "footer">
            <div class= "container-footer">
                <nav class="row">
                    <!-- LOGO -->
                    <a href="#" class="logotipo">
                        <img src="assets/imagenes/LOGO.png" width="250" height="90" alt ="Logo marca" class="img-logo mr-2">
                    </a>
                    <!-- MENU1 --> 
                    <ul class="Info">
                        <li class="font-weight-bold text-uppercase">Alexandra Stephanie Flores Reynoso</li>
                     <li >1841591</li>
                    </ul>
                    <!-- MENU2 --> 
                    <ul class="Catego">
                        <li class="font-weight-bold text-uppercase">José Carlos Torres Coronado</li>
                    <li >1803586</li>
                    </ul>
                </nav>
            </div>
        </footer>
        
        
         <script> 
        $('document').ready(function(){ 
        function readImage(input){
        if(input.files && input.files[0]){
        var reader = new FileReader();
        reader.onload = function(e) {
        $('#FotografiadePerfil').attr('src', e.target.result);}
        reader.readAsDataURL(input.files[0]);
    }
}
$('#FotoUsuario').change(function(){
    readImage(this);
});
});

window.onload = function validacionDTP(){
  var today = new Date();
var dd = today.getDate();
var mm = today.getMonth() + 1; 
var yyyy = today.getFullYear();

if (dd < 10) {
   dd = '0' + dd;
}

if (mm < 10) {
   mm = '0' + mm;
} 
    
today = yyyy + '-' + mm + '-' + dd;
document.getElementById("fecha_nacimiento").setAttribute("max", today);
}
        

         
          $("#enviar").click(function () {

            var letters = /^[A-Za-zÁÉÍÓÚáéíóúñÑ ]+$/g;
       var spaces = /^\S*$/;
        var spacesName = /\s\s/;
        var email = /^\w+@[a-zA-Z_]+?\.[a-zA-Z]{2,3}$/;

          var nombreTxt = document.getElementById('Nombre').value; 
          var apellidoTxt = document.getElementById('Apellido').value;
           var contraTxt = $("#contra").val();
          var emailTxt = document.getElementById('correo').value;

if(!(nombreTxt.match(letters)) || (nombreTxt.match(spacesName))){

$("#mensaje1").fadeIn();
}else{
$("#mensaje1").fadeOut();}


if(!(apellidoTxt.match(letters)) || (apellidoTxt.match(spacesName)) ){
  $("#mensaje2").css("margin-top",67);
  $("#mensaje2").fadeIn();
}else{
  $("#mensaje2").fadeOut();
}



if( $("#contra").val().length<8){
    $("#mensaje4").css("margin-top",275);
  $("#mensaje4").fadeIn();
}else{
  $("#mensaje4").fadeOut();
}



if( !(emailTxt.match(email))){
    $("#mensaje6").css("margin-top",115);
  $("#mensaje6").fadeIn();
}else{
  $("#mensaje6").fadeOut();
}




});

      $(function(){
            $('#fecha').on('change', calcularEdad);
        });
        
        function calcularEdad() {
            
            fecha = $(this).val();
            var hoy = new Date();
            var cumpleanos = new Date(fecha);
            var edad = hoy.getFullYear() - cumpleanos.getFullYear();
            var m = hoy.getMonth() - cumpleanos.getMonth();

            if (m < 0 || (m === 0 && hoy.getDate() < cumpleanos.getDate())) {
                edad--;
            }
            $('#Edad').val(edad);
        }
      $(document).ready(function (){
 
    var hoy = new Date();
            var fecha1='<%=session.getAttribute("FechaNac")%>';
            var cumpleanos = new Date(fecha1);
            var edad = hoy.getFullYear() - cumpleanos.getFullYear();
            var m = hoy.getMonth() - cumpleanos.getMonth();

            if (m < 0 || (m === 0 && hoy.getDate() < cumpleanos.getDate())) {
                edad--;
            }
            $('#Edad').val(edad);
 
});
        </script>
        
    </body>
</html>

