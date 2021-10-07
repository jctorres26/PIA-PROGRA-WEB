<%-- 
    Document   : busqueda_avanzada
    Created on : 6/10/2021, 01:40:04 AM
    Author     : jctor
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    
     <head>
        <title>Busqueda Avanzada</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="assets/css/busqueda_avanzada.css">
        <link href="https://fonts.googleapis.com/css2?family=Truculenta:wght@400;500&display=swap" rel="stylesheet">
    </head>
    <body style="background-color: #A0E7E5;">
         <!-- BARRA DE NAVEGACION -->
        <header class="header">
            <nav class="nav">
                <img src="assets/imagenes/LOGO.png" width="250" height="90" >
                <!-- BUSCADOR -->

                <ul class="nav_barra">
                    <!--  <li class="nav_barra_item"> <a href="dashboard.jsp" class="nav_barra_link"> DASHBOARD </a> </li> -->

                    <form  action="busqueda_avanzada.jsp" method="POST" ;" >
                        <li class="nav_barra_item"> 
                            <input type="text" name="search" placeholder= "Busca tu nota" class="Barra_busqueda" autocomplete="off">
                            <input class="btn_buscar" id="btnenviar" type="submit" value="Buscar">
                        </li>

                    </form>

                    <li class="nav_barra_item"> <a href="dashboard.jsp" class="nav_barra_link"> DASHBOARD </a> 
                        <ul class="subbarra">
                            <li class="subnivel"> <a href="crear_nota.jsp" > CREAR NOTA </a> </li>
                            <li class="subnivel"> <a href="#" > BUSQUEDA AV. </a> </li>

                        </ul>
                    </li>

                    <li class="nav_barra_item"> <a href="registro_usuario.jsp" class="nav_barra_link"> <img src="assets/imagenes/foto.png" width="100" height="90" align="left">Perfil de usuario </a> </li>
                    <li class="nav_barra_item"> <a href="registro_usuario.jsp" class="nav_barra_link"> LOG OUT </a> </li>

                </ul>

            </nav>
        </header>
         
          <!-- MAIN CLASS -->
        <main class="main">
           
        <form name = "busquedaavd" action="" method="post" class="form-register"  >
            <h2 > Busqueda Avanzada de Notebank </h2>
            <div class="contenedor-inputs">
               
                <input type="text" id="Busqueda_contenido" name="Busqueda_contenido" placeholder="Contenido de la nota" class="inputs_diseño" >
                <p class="titulos">Fechas </p>
                <input type="date" id="fecha1"  name="fecha1" class="inputs_diseño" >
                <input type="date" id="fecha2"  name="fecha2" class="inputs_diseño" >
              
                <input type="submit" id="enviar" value="Buscar notas" class="Boton_enviar" >
              

            </div>
        </form>
            
        </main>
         
          <!-- FOOTER -->
         <footer class="footer">
            <div class="container">
                <nav class="nav_footer">
                    <img src="assets/imagenes/LOGO.png" width="250" height="90" >
                    <ul class="nav_barra_f">
                        <li class="nav_barra_item_f"> Contactanos: Notebank@gmail.com  Telefono: 8120052167</li>
                        
                    </ul>
                </nav>
            </div>
        </footer>
    </body>
    
    
</html>
