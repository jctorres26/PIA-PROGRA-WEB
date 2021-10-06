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
        <link rel="stylesheet" href="login.css">
        <script src="validar_login.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.0/jquery.validate.min.js"></script>
        <script language="javascript" type="text/javascript" src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.10.0/jquery.validate.min.js"></script>
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Truculenta:wght@400;500&display=swap" rel="stylesheet">



    </head>
    <body style="background-color: #A0E7E5;">
        <header class="header">
            <nav class="nav">
                <img src="LOGO.png" width="250" height="90" >
                <ul class="nav_barra">
                    <li class="nav_barra_item"> <a href="registro_usuario.jsp" class="nav_barra_link"> Sign up </a> </li>
                </ul>
            </nav>
        </header>
        <main class="main">
            <section class="login_usuario">
                <h3>Iniciar sesion en NoteBank</h3>
                <h4>¡Bienvenido!</h4>
                <form class="form-login" action="LogInController" method="POST" onsubmit="return validar();" >
                <input class="controls" type="text" name="usuario_login" id="usuario_login" placeholder="Nombre de usuario" ><!-- comment -->
                <div id="mensajeusuarioFALTA" class="errores">Favor de ingresar usuario</div>
                <div id="mensajeusuarioLONGITUD" class="errores">Se necesita min 3 y max 20 caractes</div>
                <div id="mensajeusuarioTIPO" class="errores">Caracteres no validos</div>
                
                <br>
                <br>
                <input class="controls" type="password" name="contrasenia_login" id="contraseña_login" placeholder="Contraseña" >
                 <div id="mensajecontraseñaFALTA" class="errores">Favor de ingresar contraseña</div>
                  <div id="mensajecontraseñaLONGITUD" class="errores">La contraseña debe de tener 8 caracteres</div>
                   <div id="mensajecontraseñaTIPO" class="errores">Caracteres no validos</div>
               
                <input class="boton" id="btnenviar" type="submit" value="Ingresar">
                </form>
                <p>
                    ¿No estas registrado aun?
                    <a href="registro_usuario.jsp" class="link_registrarse"> Registrate aqui </a>
                </p>
            </section>
            
            
        </main>
        <footer class="footer">
            <div class="container">
                <nav class="nav_footer">
                    <img src="LOGO.png" width="250" height="90" >
                    <ul class="nav_barra_f">
                        <li class="nav_barra_item_f"> Contactanos: Notebank@gmail.com  Telefono: 8120052167</li>
                        
                    </ul>
                </nav>
            </div>
        </footer>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        

        <script type="text/javascript">
        $(document).ready(function() {
    $("#btnenviar").click(function () {
        var usuario = $("#usuario_login").val();
        var contraseña = $("#contraseña_login").val();
        var expresion= /^[a-zA-Z0-9\_\-]{4,16}$/;
        
       
             
          if(usuario === ""){
            $("#mensajeusuarioFALTA").fadeIn();
            $("#mensajeusuarioTIPO").fadeOut();
             
          }else{
              
              $("#mensajeusuarioFALTA").fadeOut();
              $("#mensajeusuarioTIPO").fadeOut();
               if (usuario.length>21 || usuario.length<4){
              $("#mensajeusuarioLONGITUD").fadeIn();
              
          }else{
              $("#mensajeusuarioLONGITUD").fadeOut();
              if (!expresion.test(usuario)){
                  $("#mensajeusuarioTIPO").fadeIn();
              }
              
          }
            
          }
          if (contraseña===""){
              $("#mensajecontraseñaFALTA").fadeIn();
              $("#mensajecontraseñaTIPO").fadeOut();
             
          }else{
              $("#mensajecontraseñaFALTA").fadeOut();
              $("#mensajecontraseñaTIPO").fadeOut();
              if(contraseña.length !== 8){
                  $("#mensajecontraseñaLONGITUD").fadeIn();
              }else{
                  $("#mensajecontraseñaLONGITUD").fadeOut();
                  if (!expresion.test(contraseña)){
                  $("#mensajecontraseñaTIPO").fadeIn();
              }
              }
          }
          
          
             
             
        
        
         
        
    });
});
        </script>
        
    </body>
    
</html>