function validar(){
           
        var letters = /^[A-Za-zÁÉÍÓÚáéíóúñÑ ]+$/g;
        var spaces = /^\S*$/;
        var spacesName = /\s\s/;
        var email = /^\w+@[a-zA-Z_]+?\.[a-zA-Z]{2,3}$/;

          var nombreTxt = document.getElementById('Nombre').value; 
          var apellidoTxt = document.getElementById('Apellido').value;
           var contraTxt = $("#contra").val();
          var emailTxt = document.getElementById('correo').value;
          
          if(!(nombreTxt.match(letters)) || (apellidoTxt.match(spacesName)) ){
              return false;
          }
        
          else if(!(apellidoTxt.match(letters)) || (apellidoTxt.match(spacesName))){
              return false;
          }

         
          else if( $("#contra").val().length<8){
            return false;

          }
         else if( !(emailTxt.match(email))){
                return false;
         }

    

      }
