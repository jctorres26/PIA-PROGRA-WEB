function validar(){
           
        var letters = /^[A-Za-zÁÉÍÓÚáéíóúñÑ ]+$/g;
        var spaces = /^\S*$/;
        var spacesName = /\s\s/;
        var email = /^\w+@[a-zA-Z_]+?\.[a-zA-Z]{2,3}$/;
          var expPassword = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$#!%*?&])[A-Za-z\d@$#!%*?&]{8,}$/;

          var nombreTxt = document.getElementById('Nombre').value; 
          var apellidoTxt = document.getElementById('Apellido').value;
          var usuarioTxt = document.getElementById('Usuario').value;
           var contraTxt = $("#contra").val();
          var confContraTxt = $("#confContra").val();
          var emailTxt = document.getElementById('Email').value;
          
          if(!(nombreTxt.match(letters)) || (apellidoTxt.match(spacesName)) ){
              return false;
          }
        
          else if(!(apellidoTxt.match(letters)) || (apellidoTxt.match(spacesName))){
              return false;
          }

         else if(!(usuarioTxt.match(spaces))){
              return false;
          }
          else if( !(contraTxt.match(expPassword))){
            return false;

          }
          else if(contraTxt!==confContraTxt){
              return false;
          }
         else if( !(emailTxt.match(email))){
                return false;
         }

    

      }



