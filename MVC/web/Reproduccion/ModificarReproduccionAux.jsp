<%-- 
    Document   : agregarPeliculas
    Created on : 03-ene-2017, 17:24:08
    Author     : Jayro
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="Servlets.ModeloDatos"%>
<%@page import="Servlets.ModeloDatos.*"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Agregar reproducción formulario</title>
        <meta name="viewport" content="width=device-width , user scalable=no, initial-scale=1.0, maxumun-scale=1.0, minimum-scale=1.0">
        <link rel="stylesheet" href="../css/bootstrap.min.css">
        <link rel="stylesheet" href="../css/estilos.css">
        <script src="../js/jquery.js"></script>
        <script src="../js/bootstrap.min.js"></script>
    </head>
    <body>
        <%
            
            String idReproduccion = (String) session.getAttribute("idReproduccion");
            
            ModeloDatos bd = new ModeloDatos();
            bd.abrirConexion();
            REPRODUCCION reproduccion =  bd.dameReproduccion(idReproduccion);
            String nombre= (String) session.getAttribute("nombre");
            
            
        %>
        <header>
            <div class="container" style="text-align: center">
                <h1>MODIFICAR SALA</h1>
            </div>
        </header>
        <br>



        <form class="form-group col-xs-6 col-xs-offset-3" action="/MVC/AltaReproduccion" method="POST">

            <div class="row form-group">
                <label class="control-label col-xs-3">Nombre Película:</label>
                <div class="col-xs-9">
                    <select required  style="text-align: center" class="form-control "    name="nombrePelicula">
                            <%


                                /* Leemos de la base de datos */
                                try {
                                    ArrayList<PELICULA> peliculas = bd.dameListaPeliculas();
                                    String resp = "", selected;

                                    for(PELICULA pelicula : peliculas)
                                    {
                                        selected = "";
                                        resp = pelicula.nombre;
                                        if(resp.equals(reproduccion.nombrePelicula)){selected="selected";}
                                        out.println("<option class=\"form-control\" "+selected+" value='" + resp + "' > " + resp + "</option>");
                                    }

                                } catch (Exception e) {
                                    out.println("<option class=\"form-control\" value='' > No hay Películas</option>");
                                }

                            %>
                        </select>
                </div>
            </div>
            
            <div class="row form-group">
                <label for="nombreSala" class="control-label col-xs-3">Nombre Sala:</label>
                <div class="col-xs-9">
                    <select required  style="text-align: center" class="form-control" id="nombreSala"   name="nombreSala">
                        <%

                            /* Leemos de la base de datos */
                            try {
                                ArrayList<SALA> salas = bd.dameListaSalas();
                                String resp = "",selected;

                                for(SALA sala : salas)
                                {
                                    selected = "";
                                    resp = sala.nombre;
                                    if(resp.equals(reproduccion.nombreSala)){selected="selected";}
                                    out.println("<option class=\"form-control\" value='" + resp + "' > " + resp + "</option>");
                                }

                            } catch (Exception e) {
                                out.println("<option class=\"form-control\" value='' > No hay Salas</option>");
                            }

                            bd.cerrarConexion();
                        %>
                    </select>
                </div>
            </div>
            
            <div class="row form-group">
                <label class="control-label col-xs-3">Fecha:</label>
                <div class="col-xs-9">
                    <input required type="date" value="<%out.print(reproduccion.fecha);%>" class="form-control" id="fecha" name="fecha" placeholder="Fecha">
                </div>
            </div>
            
            <div class="row form-group">
                <label class="control-label col-xs-3">Hora:</label>
                <div class="col-xs-9">
                    <input required type="number" value="<%out.print(reproduccion.hora);%>" class="form-control" name="hora" placeholder="Hora">
                </div>
            </div>
            
            <div class="row form-group">
                <label class="control-label col-xs-3">Id Reproducción</label>
                <div class="col-xs-9">
                    <input readonly required type="number" value="<%out.print(reproduccion.idReproduccion);%>" class="form-control" name="idReproduccion" placeholder="Id Reproducción">
                </div>
            </div>
            
            
            <div class="row">
                
                <div class="col-xs-4"><a href="/MVC/MenuGestionPeliculas" class="button btn btn-primary btn-md">Volver a menú </a></div>
                <div class="col-xs-4 col-xs-offset-2"><input class="button btn btn-success btn-block" type="submit" value="Modificar Reproduccion"/></div>
               
            </div>



        </form>

    </body>
</html>