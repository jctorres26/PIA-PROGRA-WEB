<%-- 
    Document   : dashboard
    Created on : 6/10/2021, 01:39:07 AM
    Author     : jctor
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
      <head>
        <title>DASHBOARD</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="assets/css/dashboard.css">
        <link href="https://fonts.googleapis.com/css2?family=Truculenta:wght@400;500&display=swap" rel="stylesheet">
        <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous">
        <script src="dashboard.js"></script>
    <link href="css/style.css" rel="stylesheet" />
    <script src="js/script.js"></script>
           
    </head>
    <body style="background-color: #A0E7E5;">
        <!-- BARRA DE NAVEGACION -->
        <header class="header">
            <nav class="nav">
                <img src="assets/imagenes/LOGO.png" width="250" height="90" >
                
                <ul class="nav_barra">
                    <li class="nav_barra_item"> <a href="dashboard.jsp" class="nav_barra_link"> DASHBOARD </a> </li>
                    <li class="nav_barra_item"> <a href="busqueda_avanzada.jsp" class="nav_barra_link"> Busqueda Avanzada </a> </li>
                    <li class="nav_barra_item"> <a href="registro_usuario.jsp" class="nav_barra_link"> <img src="assets/imagenes/foto.png" width="100" height="90" align="left">Perfil de usuario </a> </li>
                    <li class="nav_barra_item"> <a href="registro_usuario.jsp" class="nav_barra_link"> LOG OUT </a> </li>

                </ul>
                
            </nav>
        </header>
         <!-- BARRA DE BUSQUEDA AVANZADA 
         <section class="Busqueda_avanzada">
             <h4> Busqueda Avanzada </h4>
             <input type="text" name="search" placeholder="Buscar nota" class="buscAv" autocomplete="off">
             <h4> Rango de fechas </h4>
             <input type="date" id="fecha1" name="fecha1" class="fechapick">
             <input type="date" id="fecha2" name="fecha2" class="fechapick">
            

         </section>
        -->
        <!-- MAIN CLASS -->
        <main class="main">
            
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
        
        
    <script >
        
    </script>
    </body>
    
    
    
</html>
