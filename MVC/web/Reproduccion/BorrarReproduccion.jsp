<%-- 
    Document   : modificarPelicula
    Created on : 04-ene-2017, 13:45:45
    Author     : Jayro
--%>

<%@page import="Servlets.ModeloDatos.REPRODUCCION"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Servlets.ModeloDatos"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Borrar Reproduccion</title>
        <SCRIPT languaje="JavaScript">
            function pulsar() {
                alert("REPRODUCCION BORRADA!")
            }</script>
        <meta name="viewport" content="width=device-width , user scalable=no, initial-scale=1.0, maxumun-scale=1.0, minimum-scale=1.0">
        <link rel="stylesheet" href="../css/bootstrap.min.css">
        <link rel="stylesheet" href="../css/estilos.css">
        <script src="../js/jquery.js"></script>
        <script src="../js/bootstrap.min.js"></script>
    </head>
    <body>
        <header>
            <div class="container" style="text-align: center" >
                <h1>BORRAR REPRODUCCION</h1>
            </div>
        </header>
        <br>
        <div class="row">
            <div class="col-sm-4">
            </div>
            <div class="col-sm-4">
                <div class="panel-group">
                    <div class="panel panel-body panel-primary" style="text-align: center">Elige una reproducción a borrar</div>
                </div>


                <form class="form-group" action="/MVC/BorrarReproduccion" method="POST">
                    <select required size="10" style="text-align: center" class="form-control"    name="idReproduccion">
                        <%
                            ModeloDatos bd = new ModeloDatos();
                            bd.abrirConexion();
                            try {
                                String resp = "";
                                int id = 0;
                                ArrayList<REPRODUCCION> reproducciones = bd.dameListaReproducciones();
                                
                                for(REPRODUCCION reproduccion : reproducciones)
                                {
                                    id = reproduccion.idReproduccion;
                                    resp = reproduccion.nombrePelicula + " - " + 
                                            reproduccion.nombreSala +" - " +
                                            reproduccion.fecha.toString() + " - " 
                                            + reproduccion.hora;
                                    out.println("<option class=\"btn btn-block\" value='" + id + "' > " + resp + "</option>");

                                }

                            } catch (Exception e) {
                                out.println("<option class=\"btn btn-block\" value='' > No hay Reproducciones</option>");
                            }
                            bd.cerrarConexion();
                        %>
                    </select>
                    <br>
                    <br>
                    <input class="button btn btn-danger btn-block"  type="submit" value="Borrar Reproducción"/>
                    
                    <br>
                    <br>
                    <a href="/MVC/MenuGestionPeliculas"  class="button btn btn-primary btn-block">Volver al menú</a>
                </form>
            </div>

        </div>

        <div class="col-sm-4"></div>
    </div>

</body>
</html>
