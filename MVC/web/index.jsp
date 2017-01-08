<%-- 
    Document   : peliculas
    Created on : 21-dic-2016, 10:57:12
    Author     : Jayro
--%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page import="Servlets.ModeloDatos.PELICULA"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Servlets.ModeloDatos"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html style="text-align:center;">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <LINK REL=StyleSheet HREF="css/peliculasCss.css" TYPE="text/css" MEDIA=screen>
        <title>JSP Page</title>
    </head>
    <body style="text-align:center;" style="border:solid black 2px;">
        <div><img src="Imagenes/cabeceraCine.jpg" width="768" height="200" alt="imagCabecera"></div>
        <div id="barraSeparadora">
            <div style="display:inline-block"><label>CARTELERA</label></div>
            <div style="display:inline-block"><img width="100" height="105" src="Imagenes/barra2.png"  style="left:20px"></div>
        </div>
        <br>
        <div id="contenedoraux">

            <style type="text/css">

            </style>



            <%

                try {
                    ModeloDatos bd = new ModeloDatos();
                    bd.abrirConexion();
                    String resp = "";
                    int id = 0;
                    ArrayList<PELICULA> peliculas = bd.dameListaPeliculas();

                    out.println("</br>");
                    for (PELICULA pelicula : peliculas) {

                        out.println("<div id=\"espacio1\">");

                        out.println("</br>");
                        out.println("</br>");
                        out.println("<tr>" + "<td>" + pelicula.nombre + "</td>" + "</tr>");
                        out.println("</br>");
                        out.println("Director:" + pelicula.director);
                        out.println("</br>");
                        out.println("Edad:" + pelicula.edad);
                        out.println("</br>");
                        out.println("</br>");
                        out.println("<div id=\"info\">+info</div>");
                        out.println("<input  type =\"hidden\" name = \"nombre\" value ="+pelicula.nombre+">");
                        out.println("<div  id=\"comprarEntradas\">-COMPRAR ENTRADAS-</div>");
                        out.println("</div>");
                    }
                    bd.cerrarConexion();

                } catch (Exception e) {
                    out.println("<option class=\"btn btn-block\" value='' > No hay Peliculas</option>");
                }

                out.println("</div>");

                //out.println("</table>");

            %>


        </div>             
    </body>
</html>
