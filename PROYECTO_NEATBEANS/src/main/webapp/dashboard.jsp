<%-- 
    Document   : dashboard
    Created on : 6/10/2021, 01:39:07 AM
    Author     : jctor
--%>

<%@page import="com.mycompany.proyecto_neatbeans.DAO.NotaDAO"%>
<%@page import="java.util.List"%>
<%@page import="com.mycompany.proyecto_neatbeans.models.Nota"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
 
 session = request.getSession();
 
 List <Nota> notas =  NotaDAO.getNotasByUsuario((String)session.getAttribute("Username"));
System.out.println(notas);
 %>


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
                            <li class="subnivel"> <a href="busqueda_avanzada.jsp" > BUSQUEDA AV. </a> </li>

                        </ul>
                    </li>
                    
                    <li class="nav_barra_item"> <a href="perfil.jsp" class="nav_barra_link"> <img src= "<%= session.getAttribute("ImagenPerfil") %>" width="100" height="90" align="left">Perfil de usuario </a> </li>
                    <li class="nav_barra_item"> <a href="LogOffController" class="nav_barra_link"> LOG OUT </a> </li>
                   
                   
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
           
            
            <% for (Nota nota: notas){ %>
            
            <form class="containerDASHBOARD" action="editar_borrar_nota.jsp" method="post" onclick="CHECAR">
                    <h4>¡Notebank!</h4>
                    <input type="hidden" name="id" value="<%=nota.getIdNota()%>">
                    <p>
                        <%=nota.getDescripcion()
                        
                        %>
                        
                    </p>
                    <% session.setAttribute("idNota", nota.getIdNota());
                        
                        %>
                    <input type="submit" value="...">
                </form>
           
                <%}%>
            

         
            
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
                        
                    </ul>
                    <!-- MENU2 --> 
                    <ul class="Catego">
                        <li class="font-weight-bold text-uppercase">Contacto</li>
                        
                    </ul>
                </nav>
            </div>
        </footer>

        <script >
            function CHECAR(){
            <% String notaid="10";%>
            <%session.setAttribute("NotaID",notaid);%> 
    }
        
        </script>
    </body>
    
    
    
</html>
