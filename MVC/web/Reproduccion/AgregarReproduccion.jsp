<%-- 
    Document   : altaEntrada
    Created on : 06-ene-2017, 16:40:51
    Author     : Jayro
--%>

<%@page import="Servlets.ModeloDatos.SALA"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Servlets.ModeloDatos"%>
<%@page import="Servlets.ModeloDatos.PELICULA"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Agregar reproduccion formulario</title>
        <meta name="viewport" content="width=device-width , user scalable=no, initial-scale=1.0, maxumun-scale=1.0, minimum-scale=1.0">
        <link rel="stylesheet" href="../css/bootstrap.min.css">
        <link rel="stylesheet" href="../css/estilos.css">
        <script src="../js/jquery.js"></script>
        <script src="../js/bootstrap.min.js"></script>
    </head>
    <body>
        <header>
            <div class="container" style="text-align: center">
                <h1>AGREGAR REPRODUCCION</h1>
            </div>
        </header>
        <br>



        <form class="form-group col-xs-6 col-xs-offset-3" action="/MVC/AltaReproduccion" method="POST">

            <label for="nombrePelicula" class="control-label col-xs-3">Nombre Pelicula:</label>
            <div class="col-xs-9">
                <select  style="text-align: center" class="form-control "    name="nombrePelicula">
                        <%
                            
                            ModeloDatos bd = new ModeloDatos();
                            bd.abrirConexion();
                            /* Leemos de la base de datos */
                            try {
                                ArrayList<PELICULA> peliculas = bd.dameListaPeliculas();
                                String resp = "";

                                for(PELICULA pelicula : peliculas)
                                {
                                    resp = pelicula.nombre;
                                    out.println("<option class=\"form-control\" value='" + resp + "' > " + resp + "</option>");
                                }

                            } catch (Exception e) {
                                out.println("<option class=\"form-control\" value='' > No hay Películas</option>");
                            }

                        %>
                    </select>
            </div>
            <br>
            <br>

            <label class="control-label col-xs-3">Nombre Sala:</label>
            <div class="col-xs-9">
                <select  style="text-align: center" class="form-control "    name="nombreSala">
                        <%
                            
                            /* Leemos de la base de datos */
                            try {
                                ArrayList<SALA> salas = bd.dameListaSalas();
                                String resp = "";

                                for(SALA sala : salas)
                                {
                                    resp = sala.nombre;
                                    out.println("<option class=\"form-control\" value='" + resp + "' > " + resp + "</option>");
                                }

                            } catch (Exception e) {
                                out.println("<option class=\"form-control\" value='' > No hay Salas</option>");
                            }

                            bd.cerrarConexion();
                        %>
                    </select>
            </div>
            <br>
            <br>



            <label class="control-label col-xs-3">Fecha:</label>
            <div class="col-xs-9">
                <input type="date" class="form-control" id="fecha" name="fecha" value="2017-01-01" placeholder="Fecha">
            </div>
            <br>
            <br>


            <label class="control-label col-xs-3">Hora:</label>
            <div class="col-xs-9">
                <input type="number"  class="form-control" name="hora" placeholder="Hora">
            </div>
            <br>
            <br>


            <label class="control-label col-xs-3">Id Reproduccion:</label>
            <div class="col-xs-9">
                <input type="text" class="form-control" name="idReproduccion" placeholder="Id Reproduccion">
            </div>
            <br>
            <br>


            
            <br>
            <br>
            <br>
            <br>
            <br>
            <br>

            <div class="row">
                <div class="col-sm-2"></div>
                <div class="col-sm-2"><a href="/MVC/MenuGestionPeliculas" class="button btn btn-primary btn-md">Volver a menu </a></div>
                <div class="col-sm-4"><input class="button btn btn-success btn-block" type="submit" value="Alta Reproduccion"/></div>
                <div class="col-sm-2"></div>
                <div class="col-sm-2"></div>
            </div>



        </form>

    </body>
</html>