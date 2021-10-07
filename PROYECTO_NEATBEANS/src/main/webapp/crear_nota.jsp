<%-- 
    Document   : crear_nota
    Created on : 7/10/2021, 12:18:08 AM
    Author     : ALEXANDRA
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="assets/css/crear_nota.css">
        <title>Crear Nota</title>
        <link href="https://fonts.googleapis.com/css2?family=Truculenta:wght@400;500&display=swap" rel="stylesheet">
        <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <link href= "https://fonts.googleaplis.com/icon?family=Material+Icons" rel="stylesheet">
        <link href="css/style.css" rel="stylesheet" />
    </head>
    <body style="background-color: #A0E7E5;">
        <!-- BARRA NAVEGACION -->
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
            <section class="creacion_nota">
                <h3>Crea tu nota de Notebank</h3>
                <form  action="dashboard.jsp" method="POST"  > 
                <!--<input class="controls" type="text" name="nota" id="nota" > -->
                <textarea class="controls" rows = "1" cols = "10" name = "description">
                </textarea>
                <!-- CONTENEDOR DE TAGS -->
                <h4>Etiquetas</h4>
                <div class="tag-container">

                    <input/>
                </div>

                <input class="boton" id="btnenviar" type="submit" value="Crear nota">
                 
                 </form> 
            </section>
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
