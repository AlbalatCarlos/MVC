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
        <link rel="stylesheet" href="../css/estilos.css">
    </head>
    <body>
        <%

            String nombrePelicula = (String) session.getAttribute("nombrePelicula");

            ModeloDatos bd = new ModeloDatos();
            bd.abrirConexion();
            PELICULA pelicula = bd.damePelicula(nombrePelicula);
            String nombre = (String) session.getAttribute("nombre");
            bd.cerrarConexion();

        %>
        <header>
            <div class="container" style="text-align: center">
                <h1><%out.print(pelicula.nombre);%></h1>
            </div>
        </header>
        <br>
        <div class="row">
            <div class="col-sm-2"></div>
            <div class="col-sm-8">
                <div class="row">
                    <div class="col-sm-6">
                        <div><img src="../Imagenes/cartelera/drive.jpg" align="center" class="img-rounded" alt="Drive" width="304" height="320"></div>
                    </div>
                    <div class="col-sm-6">
                        <span class="label label-primary btn-block" style="text-align: center">Sinopsis</span>
                        <div  class="contenedorInfo"  style="text-align: center; height:320px;"><%out.print(pelicula.sipnosis);%></div>
                    </div>
                </div>
                <br>
                <br>
                <span class="label label-primary btn-block" style="text-align: center">Titulo Original</span>
                <div class="contenedorInfo"   style="text-align: center"><%out.print(pelicula.tituloOriginal);%></div>
                <br>
                
                <span class="label label-primary btn-block" style="text-align: center">Genero</span>
                <div class="contenedorInfo"  style="text-align: center"><%out.print(pelicula.genero);%></div>
                <br>
                
                <span class="label label-primary btn-block" style="text-align: center">Director</span>
                <div class="contenedorInfo"  style="text-align: center"><%out.print(pelicula.director);%></div>
                <br>
                
                <span class="label label-primary btn-block" style="text-align: center">Actores</span>
                <div class="contenedorInfo"  style="text-align: center"><%out.print(pelicula.actores);%></div>
                <br>

                <span class="label label-primary btn-block" style="text-align: center">Nacionalidad</span>
                <div class="contenedorInfo"  style="text-align: center"><%out.print(pelicula.nacionalidad);%></div>
                <br>
                
                 <div class="row">
                    <div class="col-sm-6">
                       <span class="label label-primary btn-block" style="text-align: center">Duracion</span>
                <div class="contenedorInfo"  style="text-align: center"><%out.print(pelicula.duracion);%></div>
                <br>
                    </div>
                    <div class="col-sm-6">
                        <span class="label label-primary btn-block" style="text-align: center">Edad minima Recomendada</span>
                <div class="contenedorInfo"  style="text-align: center"><%out.print(pelicula.edad);%></div>
                <br>
                    </div>
                </div>
                
               




            </div>
            <div class="col-sm-2"></div>
        </div>
         
         
        <div class="row">
            <div class="col-sm-2"></div>
            <div class="col-sm-2"><a href="/MVC/index.jsp" class="button btn btn-primary btn-md">Volver a cartelera </a></div>
            <div class="col-sm-4"></div>
            <div class="col-sm-2"></div>
            <div class="col-sm-2"></div>
        </div>
        <br/>
        <br/>
        





    </body>
</html>