<%-- 
    Document   : modificarPelicula
    Created on : 04-ene-2017, 13:45:45
    Author     : Jayro
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <SCRIPT languaje="JavaScript">
            function pulsar() {
                alert("PELICULA BORRADA!")
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
                <h1>BORRAR PELICULA</h1>
            </div>
        </header>
        <br>
        <div class="row">
            <div class="col-sm-4">
            </div>
            <div class="col-sm-4">
                <div class="panel-group">
                    <div class="panel panel-body panel-primary" style="text-align: center">Elige una pelicula a modificar</div>
                </div>


                <form class="form-group" action="/MVC/BorrarPelicula" method="POST">
                    <select  size="10" style="text-align: center" class="form-control "    name="nombrePelicula">
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
                    <br>
                    <br>
                    <input class="button btn btn-danger btn-block" onclick="pulsar()"  type="submit" value="Borrar Pelicula"/>
                    
                    <br>
                    <br>
                    <a href="/MVC/menuGestionPeliculas.jsp"  class="button btn btn-primary btn-block">Volver a menu</a>
                </form>
            </div>

        </div>

        <div class="col-sm-4"></div>
    </div>

</body>
</html>
