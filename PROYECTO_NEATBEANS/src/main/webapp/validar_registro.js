function validar(){
           
        var letters = /^[A-Za-zÁÉÍÓÚáéíóúñÑ ]+$/g;
        var spaces = /^\S*$/;
          var nombreTxt = document.getElementById('Nombre').value; 
          var apellidoTxt = document.getElementById('Apellido').value;
          var usuarioTxt = document.getElementById('Usuario').value;
           var contraTxt = $("#contra").val();
          var confContraTxt = $("#confContra").val();
          
          if(!(nombreTxt.match(letters))){
              return false;
          }
        
          else if(!(apellidoTxt.match(letters))){
              return false;
          }

         else if(!(usuarioTxt.match(spaces))){
              return false;
          }
          else if( $("#contra").val().length<8){
            return false;

          }
          else if(contraTxt!=confContraTxt){
              return false;
          }

    

      }



