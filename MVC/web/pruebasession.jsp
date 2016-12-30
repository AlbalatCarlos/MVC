<%-- 
    Document   : pruebasession
    Created on : 30-dic-2016, 18:04:48
    Author     : CARLOS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
             String nombre = (String)session.getAttribute("nombre");
                session.setAttribute( "nombre", "Jayro" );
        %>
         <form action="/MVC/PruebaSession" method="POST">
             <input type="text" name="nombreUsuario" value="<%out.print(nombre);%>"/>
             <input class="button" type="submit" value="Session"/>
         </form>
             <div>
                 <form hidden action="Controller" method="POST">
                     <input type="text" hidden value="Valor"/>
                 
                 <img />
                 <p>
                     
                 </p>
                 </form>
             </div>
        <h1>Hello World!</h1>
    </body>
</html>
