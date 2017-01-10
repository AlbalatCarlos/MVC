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
        <%

            String nombre = (String) session.getAttribute("nombre");
            ModeloDatos bd = new ModeloDatos();
            bd.abrirConexion();
            String rol = bd.dameRolUsuario(nombre);
            


        %>
        <div><img src="Imagenes/cabeceraCine.jpg" width="768" height="200" alt="imagCabecera"></div>

        <div class="row">
            <div class="col-sm-2"></div>
            <div class="col-sm-8" >
                <nav class="navbar navbar-default">
                    <div class="container-fluid">
                        <div class="navbar-header">
                            <a class="navbar-brand" href="#">CINES CARJAY</a>
                        </div>
                        <ul class="nav navbar-nav">
                            <li class="active"><a href="#">Cartelera</a></li>
                                

                        </ul>

                        <ul class="nav navbar-nav navbar-right">
                            <%if (nombre != null) {
                                 if (rol.equals("admin")){
                                out.print("<li><a href='/MVC/menuGestionPeliculas.jsp'><span class='glyphicon glyphicon-cog'></span> Gestionar Sitio</a></li>");
                        }
                                    out.print("<li><a href='../MVC/ModificarUsuario'><span class='glyphicon glyphicon-user'></span> " + nombre+"</a></li>");
                                    out.print("<li><a href='../MVC/CerrarSesion'><span class='glyphicon glyphicon-off'></span> Cerrar Sesion</a></li>");
                                } else {

                                    out.print("<li><a href='../MVC/AltaUsuario'><span class='glyphicon glyphicon-user'></span> Registro</a></li>");
                            out.print("<li><a href='../MVC/Login'><span class='glyphicon glyphicon-log-in'></span> Acceso</a></li>");
                        }%>
                                                    </ul>
                    </div>
                </nav>
            </div>
        </div>



        <div class="row">
            <div class="col-sm-2"></div>
            <div class="col-sm-8" id="contenedorCartelera" >




                <%

                    try {
                       // ModeloDatos bd = new ModeloDatos();
                        
                        String resp = "";
                        int id = 0;
                        ArrayList<PELICULA> peliculas = bd.dameListaPeliculas();

                        out.println("</br>");

                        for (PELICULA pelicula : peliculas) {

                            out.print("<form  class='col-sm-3 form-group' style='height:250px;'  action=\"/MVC/InfoPelicula\" Method=\"POST\">");
                            out.print("<div class='contenedorPelicula'>");
                            out.println("<br/>");
                            if(bd.IsNullOrWhiteSpace(pelicula.paginaOficial)==false)
                            {
                                out.println("<img style='max-width:80px;max-height:80px;' src='"+pelicula.paginaOficial+"'/>");
                            }
                            
                            out.println("<br/>");
                            out.println("<p>" + "" + pelicula.nombre +"</p>");
                            out.println("<p>");
                            out.println("Director:" + pelicula.director);
                            out.println("</p><p>");
                            out.println("Edad:" + pelicula.edad);
                            out.println("</p>");
                            out.println("<br/>");
                            out.println("<input  type =\"hidden\" name = \"nombrePelicula\" value =\"" + pelicula.nombre + "\">");

                            out.println("<input style='position:absolute;bottom:0; margin-bottom:32px;left: 83px;' class=\"bottomaligned button btn btn-link btn-xs\" type=\"submit\" value=\"+info\"/>");
                            out.println("<input onclick=\"location.href='/MVC/MenuEntradas'\" class=\"bottomaligned button btn btn-success btn-xs\" value=\"COMPRAR ENTRADAS\"/>");
                            out.println("<br/><br/>");

                            out.println("</div>");

                            out.println("</form>");

                        }
                       

                    } catch (Exception e) {
                        out.println("<option class=\"btn btn-block\" value='' > No hay Peliculas</option>");
                    }

                     bd.cerrarConexion();

                %>

            </div>    
        </div>             
    </body>
</html>
<style>
    p {
     white-space: nowrap;
     overflow: hidden;
     text-overflow: ellipsis;
    }
</style>