<%-- 
    Document   : index
    Created on : 4/10/2021, 06:47:38 PM
    Author     : jctor
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  
      <head>
        <title>LOGIN</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="assets/css/login.css">
        <script src="assets/javascript/validar_login.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.0/jquery.validate.min.js"></script>
        <script language="javascript" type="text/javascript" src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.10.0/jquery.validate.min.js"></script>
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Truculenta:wght@400;500&display=swap" rel="stylesheet">



    </head>
    <body style="background-color: #A0E7E5;">
        <header class="header">
            <nav class="nav">
                <img src="assets/imagenes/LOGO.png" width="250" height="90" >
                <ul class="nav_barra">
                    <li class="nav_barra_item"> <a href="registro_usuario.jsp" class="nav_barra_link"> Sign up </a> </li>
                </ul>
            </nav>
        </header>
        <main class="main">
            <section class="login_usuario">
                <h3>Iniciar sesion en NoteBank</h3>
                <h4>¡Bienvenido!</h4>
                <form class="form-login"   id="MyForm">
                <input class="controls" type="text" name="usuario_login" id="usuario_login" placeholder="Nombre de usuario" ><!-- comment -->
                <div id="mensajeusuarioFALTA" class="errores">Favor de ingresar usuario</div>
                <div id="mensajeusuarioLONGITUD" class="errores">Se necesita min 3 y max 20 caractes</div>
                <div id="mensajeusuarioTIPO" class="errores">Caracteres no validos</div>
                
                <br>
                <br>
                <input class="controls" type="password" name="contrasenia_login" id="contrasenia_login" placeholder="Contraseña" >
                 <div id="mensajecontraseñaFALTA" class="errores">Favor de ingresar contraseña</div>
                  <div id="mensajecontraseñaLONGITUD" class="errores">La contraseña debe de tener 8 caracteres</div>
                   <div id="mensajecontraseñaTIPO" class="errores">Caracteres no validos</div>
               
                <input class="boton" id="btnenviar" type="button" value="Ingresar">
                </form>
                <p>
                    ¿No estas registrado aun?
                    <a href="registro_usuario.jsp" class="link_registrarse"> Registrate aqui </a>
                </p>
            </section>
            
            
        </main>
         <footer class= "footer">
            <div class= "container-footer">
                <nav class="row">
                    <!-- LOGO -->
                    <a href="#" class="logotipo">
                        <img src="assets/imagenes/LOGO.png" width="250" height="90" alt ="Logo marca" class="img-logo mr-2">
                    </a>
                    <!-- MENU1 --> 
                    <ul class="Info">
                        <li class="font-weight-bold text-uppercase">Contacto</li>
                        <li >Contacto</li>
                    </ul>
                    <!-- MENU2 --> 
                    <ul class="Catego">
                        <li class="font-weight-bold text-uppercase">Contacto</li>
                        <li >Contacto</li>
                    </ul>
                </nav>
            </div>
        </footer>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        

        <script type="text/javascript">
        $(document).ready(function() {
    $("#btnenviar").click(function () {
        var usuario = $("#usuario_login").val();
        var contrasenia = $("#contrasenia_login").val();
        var expresion= /^[a-zA-Z0-9\_\-]{4,16}$/;
        
       
             
          if(usuario === ""){
            $("#mensajeusuarioFALTA").fadeIn();
          
          }else{
              
              $("#mensajeusuarioFALTA").fadeOut();
            
          }
          
          if (contrasenia===""){
              $("#mensajecontraseñaFALTA").fadeIn();
            
             
          }else{
              $("#mensajecontraseñaFALTA").fadeOut();
             
          }
            
              
          if(usuario !="" && contrasenia !=""){
          
      
             $.ajax({
           async    :  true,
           type     : "POST",
           data: {usuario_login: usuario, contrasenia_login: contrasenia},
            dataType: "json",
           url      : "LogInController",
           success: function(data) {
               
                if(data.exist == false){
           alert("Usuario o contraseña incorrecta");
            
       }else if(data.exist==true){
          window.location='dashboard.jsp'
           
       }
        }
});
    }
        
         
        
    });
});
        </script>
        
    </body>
    
</html>
