<%-- 
    Document   : agregarPeliculas
    Created on : 03-ene-2017, 17:24:08
    Author     : Jayro
--%>

<%@page import="Servlets.ModeloDatos"%>
<%@page import="Servlets.ModeloDatos.*"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Agregar peliculas formulario</title>
        <meta name="viewport" content="width=device-width , user scalable=no, initial-scale=1.0, maxumun-scale=1.0, minimum-scale=1.0">
        <link rel="stylesheet" href="../css/bootstrap.min.css">
        <link rel="stylesheet" href="../css/estilos.css">
        <script src="../js/jquery.js"></script>
        <script src="../js/bootstrap.min.js"></script>
    </head>
    <body>
        <%
            
            String nombrePelicula = (String) session.getAttribute("nombrePelicula");
            
            ModeloDatos bd = new ModeloDatos();
            bd.abrirConexion();
            PELICULA pelicula =  bd.damePelicula(nombrePelicula);
            String nombre= (String) session.getAttribute("nombre");
            bd.cerrarConexion();
            
        %>
        <header>
            <div class="container" style="text-align: center">
                <h1>MODIFICAR PELICULA</h1>
            </div>
        </header>
        <br>



        <form class="form-group col-xs-6 col-xs-offset-3" action="/MVC/AltaPelicula" method="POST">

            <label for="nombrePelicula" class="control-label col-xs-3">Nombre Pelicula:</label>
            <div class="col-xs-9">
                <input required value="<%out.print(pelicula.nombre);%>" type="text" class="form-control" id="nombrePelicula" name="nombrePelicula" placeholder="Nombre Pelicula">
            </div>
            <br>
            <br>

            <label class="control-label col-xs-3">Sinopsis:</label>
            <div class="col-xs-9">
                <input textarea rows="3" value="<%out.print(pelicula.sipnosis);%>" class="form-control" placeholder="Sinopsis" name="sinopsis">
            </div>
            <br>
            <br>



            <label class="control-label col-xs-3">Página Oficial:</label>
            <div class="col-xs-9">
                <input type="text" value="<%out.print(pelicula.paginaOficial);%>" class="form-control" id="inputPaginaOficial" name="paginaOficial" placeholder="PaginaOficial">
            </div>
            <br>
            <br>


            <label class="control-label col-xs-3">Título Original:</label>
            <div class="col-xs-9">
                <input type="text" value="<%out.print(pelicula.tituloOriginal);%>" class="form-control" name="tituloOriginal" placeholder="TituloOriginal">
            </div>
            <br>
            <br>


            <label class="control-label col-xs-3">Género:</label>
            <div class="col-xs-9">
                <input type="text" value="<%out.print(pelicula.genero);%>" class="form-control" name="genero" placeholder="Genero">
            </div>
            <br>
            <br>


            <label class="control-label col-xs-3">Nacionalidad:</label>
            <div class="col-xs-9">
                <input type="text" value="<%out.print(pelicula.nacionalidad);%>" class="form-control" name="nacionalidad" placeholder="Nacionalidad">
            </div>
            <br>
            <br>


            <label class="control-label col-xs-3">Duración:</label>
            <div class="col-xs-9">
                <input type="number" value="<%out.print(pelicula.duracion);%>" class="form-control" name="duracion" placeholder="Duracion">
            </div>
            <br>
            <br>


            <label class="control-label col-xs-3">Año:</label>
            <div class="col-xs-9">
                <input type="number" value="<%out.print(pelicula.anyo);%>" class="form-control" name="ano" placeholder="Año">
            </div>
            <br>
            <br>


            <label class="control-label col-xs-3">Distribuidora:</label>
            <div class="col-xs-9">
                <input type="text" value="<%out.print(pelicula.distribuidora);%>" class="form-control" name="distribuidora" placeholder="Distribuidora">
            </div>
            <br>
            <br>


            <label class="control-label col-xs-3">Director:</label>
            <div class="col-xs-9">
                <input type="text" value="<%out.print(pelicula.director);%>" class="form-control" name="director" placeholder="Director">
            </div>
            <br>
            <br>


            <label class="control-label col-xs-3">Actores:</label>
            <div class="col-xs-9">
                <input type="text" value="<%out.print(pelicula.actores);%>" class="form-control" name="actores" placeholder="Actores">
            </div>
            <br>
            <br>

            <label class="control-label col-xs-3">Edad minima recomendada:</label>
            <div class="col-xs-9">
                <input type="text" value="<%out.print(pelicula.edad);%>" class="form-control" name="edad" placeholder="Edad minima recomendada">
            </div>
            <br>
            <br>

            <label class="control-label col-xs-3">Otros datos de interés:</label>
            <div class="col-xs-9">
                <input type="text" value="<%out.print(pelicula.otrosDatos);%>" class="form-control" name="datos" placeholder="Otros datos">
            </div>
            <br>
            <br>
            <br>
            <br>
            <br>
            <br>

            <div class="row">
                <div class="col-sm-2"></div>
                <div class="col-sm-2"><a href="/MVC/MenuGestionPeliculas" class="button btn btn-primary btn-md">Volver a menú </a></div>
                <div class="col-sm-4"><input class="button btn btn-success btn-block" type="submit" value="Modificar Película"/></div>
                <div class="col-sm-2"></div>
                <div class="col-sm-2"></div>
            </div>



        </form>

    </body>
</html>