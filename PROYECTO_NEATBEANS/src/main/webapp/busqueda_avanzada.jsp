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
        
        <link href= "https://fonts.googleaplis.com/icon?family=Material+Icons" rel="stylesheet">
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

                    <li class="nav_barra_item"> <a href="perfil.jsp" class="nav_barra_link"> <img src="assets/imagenes/foto.png" width="100" height="90" align="left">Perfil de usuario </a> </li>
                    <li class="nav_barra_item"> <a href="registro_usuario.jsp" class="nav_barra_link"> LOG OUT </a> </li>

                </ul>

            </nav>
        </header>
         
          <!-- MAIN CLASS -->
        <main class="main">
        
        
        <section class="busqueda_nota">
                <h3>Busqueda Avanzada</h3>
                <form  name="busquedaAv" action="" method="POST"  > 
                    <div class="busquedaN">
               <input type="text" id="Busqueda_contenido" name="Busqueda_contenido" placeholder="Contenido de la nota" class="contenido_nota" >
                    </div>
                    <h4>Fechas </h4>
               <div class="inputsav" >
                   <p style="align-self: center">Desde:</p>
                <input type="date" id="fecha1"  name="fecha1" class="inputs_diseño"  >
                
                <p style="align-self: center">Hasta:</p>
                <input type="date" id="fecha2"  name="fecha2" class="inputs_diseño" >
                <br>
               </div>
                <!-- CONTENEDOR DE TAGS -->
                <h4>Etiquetas</h4>
                <div class="tag-container">
                    <input/>
                </div>

                <input class="boton" id="btnenviar" type="submit" value="Buscar notas">
                 
                 </form> 
            </section>
            
        </main>
         
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
                        <li class="font-weight-bold text-uppercase">Contacto</li>
                        
                    </ul>
                    <!-- MENU2 --> 
                    <ul class="Catego">
                        <li class="font-weight-bold text-uppercase">Contacto</li>
                        
                    </ul>
                </nav>
            </div>
        </footer>
          
          <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script type="text/javascript">
        
            const tagContainer = document.querySelector('.tag-container');
            const input = document.querySelector('.tag-container input');

            let tags = [];

            function createTag(label) {
                const div = document.createElement('div');
                div.setAttribute('class', 'tag');
                const span = document.createElement('span');
                span.innerHTML = label;
                const closeIcon = document.createElement('i');
                closeIcon.innerHTML = 'close';
                closeIcon.setAttribute('class', 'material-icons');
                closeIcon.setAttribute('data-item', label);
                div.appendChild(span);
                div.appendChild(closeIcon);
                return div;
            }

            function clearTags() {
                document.querySelectorAll('.tag').forEach(tag => {
                    tag.parentElement.removeChild(tag);
                });
            }

            function addTags() {
                clearTags();
                tags.slice().reverse().forEach(tag => {
                    tagContainer.prepend(createTag(tag));
                });
            }

            input.addEventListener('keyup', (e) => {
                if (e.key === ' ') {
                    e.target.value.split(',').forEach(tag => {
                        tags.push(tag);
                    });

                    addTags();
                    input.value = '';
                }
            });
            document.addEventListener('click', (e) => {
                console.log(e.target.tagName);
                if (e.target.tagName === 'I') {
                    const tagLabel = e.target.getAttribute('data-item');
                    const index = tags.indexOf(tagLabel);
                    tags = [...tags.slice(0, index), ...tags.slice(index + 1)];
                    addTags();
                }
            })

            input.focus();
        </script>
    </body>
    
    
</html>
