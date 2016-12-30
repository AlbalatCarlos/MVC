<%-- 
    Document   : index
    Created on : 08-dic-2016, 12:19:24
    Author     : CARLOS
--%>

<%@page import="java.util.ArrayList"%>
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
    </head>
    <body style="text-align:center;">
        <h1>Bienvenido a la F1</h1>

        <form action="/Practica6MVC/AltaCoche" method="POST">
            <h1> Alta / Modificacion de Coche </h1>
            <div class="form-group">
                <label for="nombreCoche">Nombre Coche</label>
                <br/>
                <input required type="text" class="form-control" id="nombreCoche" name="nombreCoche" placeholder="Nombre">
            </div>
            <br/>
            <div class="form-group">
                <label for="gananciaKW">Ganancia en KW (Entre 4 y 10)</label>
                <br/>
                <input required type="number" min="4" max="10" title="Valor fuera del rango" class="form-control" id="gananciaKW" name="gananciaKW" placeholder="Ganancia">
            </div>
            <br/>
            <br/>
            <input class="button" type="submit" value="Alta Coche"/>
        </form>
        <br/>
        <br/>
        <br/>
        <form action="/Practica6MVC/AltaCircuito" method="POST">
            <h1> Alta / Modificacion de Circuito </h1>
            <div class="form-group">
                <label for="nombreCircuito">Nombre Circuito</label>
                <br/>
                <input required type="text" class="form-control" id="nombreCircuito" name="nombreCircuito" placeholder="Nombre">
            </div>
            <br/>
            <div class="form-group">
                <label for="ciudad">Ciudad</label>
                <br/>
                <input required type="text" class="form-control" id="ciudad" name="ciudad" placeholder="Ciudad">
            </div>
            <br/>
            <div class="form-group">
                <label for="pais">Pais</label>
                <br/>
                <input required type="text" class="form-control" id="pais" name="pais" placeholder="Pais">
            </div>
            <br/>
            <div class="form-group">
                <label required for="vueltas">Vueltas (Entre 40 y 80)</label>
                <br/>
                <input required type="number" min="40" max="80" title="Valor fuera del rango" class="form-control" id="vueltas" name="vueltas" placeholder="Vueltas">
            </div>
            <br/>
            <div class="form-group">
                <label for="longitud">Longitud (Entre 3000 y 9000)</label>
                <br/>
                <input required type="number" min="3000" max="9000" title="Valor fuera del rango" class="form-control" id="longitud" name="longitud" placeholder="Longitud">
            </div>
            <br/>
            <div class="form-group">
                <label for="curvasPorVuelta">Curvas por Vuelta (Entre 6 y 20)</label>
                <br/>
                <input required type="number" min="6" max="20" title="Valor fuera del rango" class="form-control" id="curvasPorVuelta" name="curvasPorVuelta" placeholder="Curvas">
            </div>
            <br/>
            <br/>
            <input class="button" type="submit" value="Alta Circuito"/>
        </form>
        <br/>
        <br/>
        <br/>
        <form action="/Practica6MVC/CalculoGanancia" method="POST">
            <h1> Calculo de ganancia </h1>
            <div class="form-group">
                <label for="coche">Elija un coche</label>
                <br/>
                <select name="coche">
                    <%
                        Statement mandato = null;
                        Connection conexion = null;
                        String URL = "jdbc:derby://localhost:1527/sample";
                        String usuario = "";
                        String contraseña = "";
                        try {
                            Class.forName("org.apache.derby.jdbc.ClientDriver");
                        } catch (Exception e) {
                            System.out.println("Error al cargar el driver JDBC/ODBC.");
                            return;
                        }

                        try {
                            conexion = DriverManager.getConnection("jdbc:derby://localhost:1527/sample", "app", "app");
                            mandato = conexion.createStatement();
                        } catch (Exception e) {
                            System.out.println("Problemas al conectar con " + URL);
                            return;
                        }

                        /* Leemos de la base de datos */
                        try {
                            //
                            ResultSet resultado = mandato.executeQuery("SELECT nombre,ganaciaKW FROM COCHE");
                            String resp = "", ganancia = "";

                            //
                            while (resultado.next()) {
                                resp = resultado.getString("nombre");
                                ganancia = resultado.getString("ganaciaKW");
                                out.println("<option value='" + resp + "' > " + resp + " - "
                                        + ganancia + "KW</option>");
                            }

                        } catch (Exception e) {

                        }


                    %>

                </select>
            </div>
            <br/>
            <br/>
            <div class="form-group">
                <label for="formGroupExampleInput2">Elija un circuito (Nombre, Ciudad, Pais, Vueltas, Longitud, Curvas)</label>
                <br/>
                <select name="circuito">
                    <%                        /* Leemos de la base de datos */
                        try {
                            //
                            ResultSet resultado = mandato.executeQuery("SELECT"
                                    + " nombre,ciudad,pais,vueltas,longitud,"
                                    + "curvasPorVuelta FROM CIRCUITO");
                            String resp = "", restoInfo = "";

                            //
                            while (resultado.next()) {
                                resp = resultado.getString("nombre");
                                restoInfo = resultado.getString("ciudad") + " - "
                                        + resultado.getString("pais") + " - "
                                        + resultado.getString("vueltas") + " - "
                                        + resultado.getString("longitud") + " - "
                                        + resultado.getString("curvasPorVuelta");

                                out.println("<option value='" + resp + "' > " + resp + " - "
                                        + restoInfo + "</option>");
                            }

                        } catch (Exception e) {

                        }

                        conexion.close();
                    %>

                </select>
            </div>
            <br/>
            <br/>

            <input class="button" type="submit" value="Calcular Ganancia de KW"/>
        </form>
        <br/>
        <br/>
        <br/>
        <br/>
        <br/>
    </body>
</html>
