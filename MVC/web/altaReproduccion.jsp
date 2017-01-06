<%-- 
    Document   : altaEntrada
    Created on : 06-ene-2017, 16:40:51
    Author     : Jayro
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
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
        <header>
            <div class="container" style="text-align: center">
                <h1>AGREGAR PELICULA</h1>
            </div>
        </header>
        <br>



        <form class="form-group" action="/MVC/AltaReproduccion" method="POST">

            <label for="nombrePelicula" class="control-label col-xs-3">Nombre Pelicula:</label>
            <div class="col-xs-9">
                <select  style="text-align: center" class="form-control "    name="nombrePelicula">
                        <%
                            Statement mandato = null;
                            Connection conexion = null;
                            String URL = "jdbc:derby://localhost:1527/MVCAUX";
                            String usuario = "";
                            String contraseña = "";
                            try {
                                Class.forName("org.apache.derby.jdbc.ClientDriver");
                            } catch (Exception e) {
                                System.out.println("Error al cargar el driver JDBC/ODBC.");
                                return;
                            }

                            try {
                                conexion = DriverManager.getConnection("jdbc:derby://localhost:1527/MVCAUX", "app", "app");
                                mandato = conexion.createStatement();
                            } catch (Exception e) {
                                System.out.println("Problemas al conectar con " + URL);
                                return;
                            }

                            /* Leemos de la base de datos */
                            try {
                                //
                                ResultSet resultado = mandato.executeQuery("SELECT nombre FROM PELICULA");
                                String resp = "";

                                //
                                while (resultado.next()) {
                                    resp = resultado.getString("nombre");
                                    out.println("<option class=\"form-control\" value='" + resp + "' > " + resp + "</option>");

                                }

                            } catch (Exception e) {

                            }


                        %>
                    </select>
            </div>
            <br>
            <br>

            <label class="control-label col-xs-3">Nombre Sala:</label>
            <div class="col-xs-9">
                <input textarea rows="3" class="form-control" placeholder="nombreSala" name="sinopsis">
            </div>
            <br>
            <br>



            <label class="control-label col-xs-3">Fecha:</label>
            <div class="col-xs-9">
                <input type="text" class="form-control" id="inputPaginaOficial" name="fecha" placeholder="Fecha (yyyy-MM-dd)">
            </div>
            <br>
            <br>


            <label class="control-label col-xs-3">Hora:</label>
            <div class="col-xs-9">
                <input type="text"  class="form-control" name="hora" placeholder="Hora">
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
                <div class="col-sm-2"><a href="/MVC/menuGestionPeliculas.jsp" class="button btn btn-primary btn-md">Volver a menu </a></div>
                <div class="col-sm-4"><input class="button btn btn-success btn-block" type="submit" value="Alta Reproduccion"/></div>
                <div class="col-sm-2"></div>
                <div class="col-sm-2"></div>
            </div>



        </form>

    </body>
</html>