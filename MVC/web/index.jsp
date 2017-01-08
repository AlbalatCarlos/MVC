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
        <title>Index</title>
        <meta name="viewport" content="width=device-width , user scalable=no, initial-scale=1.0, maxumun-scale=1.0, minimum-scale=1.0">
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/estilos.css">
        <script src="js/jquery.js"></script>
        <script src="js/bootstrap.min.js"></script>

    </head>
    <body style="text-align:center;" style="border:solid black 2px;">
        <div><img src="Imagenes/cabeceraCine.jpg" width="768" height="200" alt="imagCabecera"></div>
        <div id="barraSeparadora">CARTELERA<img width="100" height="105" align="top" style="position:absolute" style="left:20px"></div>
        <br>
        <div class="row">
        <div class="col-sm-2"></div>
        <div class="col-sm-8" id="contenedorCartelera" >
            


           
            <%

                try {
                    ModeloDatos bd = new ModeloDatos();
                    bd.abrirConexion();
                    String resp = "";
                    int id = 0;
                    ArrayList<PELICULA> peliculas = bd.dameListaPeliculas();

                    out.println("</br>");
                   
                    for (PELICULA pelicula : peliculas) {
                       
                        out.print("<form  class='col-sm-3 form-group' style='height:200px;'  action=\"/MVC/InfoPelicula\" Method=\"POST\">");
                         out.print("<div id='contenedorPelicula'>");
                        out.println("</br>");
                        out.println("</br>");
                        out.println("<tr>" + "<td>" + pelicula.nombre + "</td>" + "</tr>");
                        out.println("</br>");
                        out.println("Director:" + pelicula.director);
                        out.println("</br>");
                        out.println("Edad:" + pelicula.edad);
                        out.println("</br>");
                        out.println("</br>");
                        out.println("<input  type =\"hidden\" name = \"nombrePelicula\" value =\""+pelicula.nombre+"\">");
                        
                        out.println("<input style='position:absolute;bottom:0; margin-bottom:22px;left: 69px;' class=\"bottomaligned button btn btn-link btn-xs\" type=\"submit\" value=\"+info\"/>");
                        out.println("<input class=\"bottomaligned button btn btn-success btn-xs\" type=\"submit\" value=\"COMPRAR ENTRADAS\"/>");
                        out.println("<br/><br/>");
                          
                        out.println("</div>");
                        
                        out.println("</form>");
                        
                    }
                    bd.cerrarConexion();

                } catch (Exception e) {
                    out.println("<option class=\"btn btn-block\" value='' > No hay Peliculas</option>");
                }

                

                //out.println("</table>");

            %>
            
        </div>    
        </div>             
    </body>
</html>
