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

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html style="text-align:center;">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <LINK REL=StyleSheet HREF="peliculasCss.css" TYPE="text/css" MEDIA=screen>
        <title>JSP Page</title>
    </head>
    <body style="text-align:center;" style="border:solid black 2px;">
            <div><img src="Imagenes/cabeceraCine.jpg" width="768" height="200" alt="imagCabecera"></div>
            <div id="barraSeparadora">CARTELERA<img src="Imagenes/barra2.png" width="100" height="105" align="top" style="position:absolute" style="left:20px"></div>
            <br>
    <div id="contenedoraux">
    
    <style type="text/css">

</style>
    
<form action="VerDatosPelicula" method="POST">
    
    <input type="text" name="nombrePelicula" value="NombreDeLaPeliculaQueQuieresBuscar"/>
    <input type="submit" class="button" val="text" >
</form>
   
    <%
        
        
                        Statement mandato = null;
                        Connection conexion = null;
                        String URL = "jdbc:derby://localhost:1527/cine";
                        String usuario = "";
                        String contraseña = "";
                        try {
                            Class.forName("org.apache.derby.jdbc.ClientDriver");
                        } catch (Exception e) {
                            System.out.println("Error al cargar el driver JDBC/ODBC.");
                            return;
                        }

                        try {
                            conexion = DriverManager.getConnection("jdbc:derby://localhost:1527/cine", "app", "app");
                            mandato = conexion.createStatement();
                        } catch (Exception e) {
                            System.out.println("Problemas al conectar con " + URL);
                            return;
                        }

                        /* Leemos de la base de datos */
                        try {
                            //
                            ResultSet resultado = mandato.executeQuery("SELECT titulo, sala, director, rutaimagen FROM PELICULAS");
                            //String titulo = "", director = "" , sala="";
							

                            //
                            
                               // out.println("<table style=\"text-align:center;\">");
                            
                            out.println("</br>");
                            out.println("<div id=\"contenedor\">");

                            while (resultado.next()) {
                                out.println("<div id=\"espacio1\">");
                                out.println("<img  src="+resultado.getObject("rutaimagen")+"width=\"143px\" height=\"173px\" />");
                                out.println("<a href='http://localhost:8080/MVC/PruebaSession?titulo="+resultado.getObject("titulo")+"'>Visit W3Schools</a>");
                                out.println("</br>");
                                out.println("</br>");
                                out.println("<tr>"+"<td>"+resultado.getObject("titulo")+"</td>"+"</tr>");
                                out.println("</br>");
                                out.println("Director:"+resultado.getObject("director"));
                                out.println("</br>");
                                out.println("Sala:"+resultado.getObject("sala"));
                                out.println("</br>");
                                out.println("</br>");
                                out.println("<div  id=\"comprarEntradas\">-COMPRAR ENTRADAS-</div>");
                                out.println("</div>");
                            }

                             out.println("</div>");
                             
                            
                                //out.println("</table>");
                            
                            

                        } catch (Exception e) {

                        }


                    %>
    
                    
       </div>             
    </body>
</html>
