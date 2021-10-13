<%-- 
    Document   : registro_usuario
    Created on : 4/10/2021, 09:23:31 PM
    Author     : jctor
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registro_de_Usuario</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous">
    </script>
    <link rel="stylesheet" href="assets/css/registro_usuario.css">
    <script src="assets/javascript/validar_registro.js"></script>
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Itim&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Truculenta:wght@400;500&display=swap" rel="stylesheet">
</head>
<body style = "background-color: #A0E7E5;">
    <header class="header">
        <div class="container logo-nav-container"> 
        <img src="assets/imagenes/LOGO.png" width="250" height="85" class = "logo"/>
        <nav class = "navigation">
        <ul> 
        <li><a href="index.jsp"> LOGIN </a></li>
        </ul>
        </nav>
        </div>
        </header>
    
    

        <main class="main">

<form name = "form1" action="SignUpController" method="POST" class="form-register" enctype="multipart/form-data" onsubmit="return validar();" >
<h2 class="form_titulo"> Crea tu cuenta</h2>
<div class="contenedor-inputs">
<input type="text" id="Nombre" name="Nombre" placeholder="Nombre(s)" class="input-48" >
<div id="mensaje1" class="errores">Formato de nombre incorrecto</div>

<input type="text" id = "Apellido" name="Apellido" placeholder="Apellido(s)" class="input-48" >
<div id="mensaje2" class="errores" >Formato de apellido incorrecto</div>

<p class="input-48">Fecha de Nacimiento</p>
<input type="date" id="fecha_nacimiento" min='1900-01-01' max = '2000-01-01' value='2000-01-01' name="fechadenacimiento" class="input-48" >

<p class="input-foto-text">Foto de Perfil</p>
<img alt= "FotoUsuario" id="FotografiadePerfil" class="fotoperfil"> 
<input id="FotoUsuario" type="file"  name="Fotografia" placeholder="Foto de perfil" class="input-foto" required>

<input type="email" id = "Email" name="Correo" placeholder="Correo" class="input-100" >
<div id="mensaje6" class="errores" >Formato de correo incorrecto</div>

<input type="text" id="Usuario" name="Usuario" placeholder="Usuario" class="input-48" >
<div id="mensaje3" class="errores" >Formato de usuario incorrecto</div>

<input type="password" id="contra" name="Contrasenia" placeholder="Contraseña" class="input-cont" >
<input type="password" id="confContra" name="Conf-Contrasenia" placeholder="Confirmar Contraseña" class="input-cont" >
<div id="mensaje4" class="errores" >Formato de contraseña incorrecto</div>
<div id="mensaje5" class="errores" >Contraseña no coincide</div>

<input type="submit"id="enviar" value="Crear cuenta" class="Boton_enviar" onclick=" return validar()" >
<p class="form_link">¿Ya tienes una cuenta?<a href="index.jsp"> Ingresa aquí</a></p>

</div>
</form>
        </main>

        <footer class= "footer">
            <div class= "container">
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
          var usuarioTxt = document.getElementById('Usuario').value;
           var contraTxt = $("#contra").val();
          var confContraTxt = $("#confContra").val();
          var emailTxt = document.getElementById('Email').value;

if(!(nombreTxt.match(letters)) || (nombreTxt.match(spacesName))){

$("#mensaje1").fadeIn();
}else{
$("#mensaje1").fadeOut();}


if(!(apellidoTxt.match(letters)) || (apellidoTxt.match(spacesName)) ){
  $("#mensaje2").css("margin-top",75);
  $("#mensaje2").fadeIn();
}else{
  $("#mensaje2").fadeOut();
}

if(!(usuarioTxt.match(spaces)) || usuarioTxt === ""){
    $("#mensaje3").css("margin-top",340);
  $("#mensaje3").fadeIn();
}else{
  $("#mensaje3").fadeOut();
}

if( $("#contra").val().length<8){
    $("#mensaje4").css("margin-top",406);
  $("#mensaje4").fadeIn();
}else{
  $("#mensaje4").fadeOut();
}

if( contraTxt!=confContraTxt){
    $("#mensaje5").css("margin-top",446);
  $("#mensaje5").fadeIn();
}else{
  $("#mensaje5").fadeOut();
}

if( !(emailTxt.match(email))){
    $("#mensaje6").css("margin-top",272);
  $("#mensaje6").fadeIn();
}else{
  $("#mensaje6").fadeOut();
}




});

      

      

      

        </script>
</body>
    
    
</html>
