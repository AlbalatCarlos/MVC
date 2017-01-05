<%-- 
    Document   : Login
    Created on : 05-ene-2017, 2:17:38
    Author     : CARLOS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
    </head>
    <body style="text-align:center;">
        <%
             String error = (String)session.getAttribute("error");
             session.setAttribute("error", null);
             session.setAttribute("nombre", null);
             session.removeAttribute("error");
             session.removeAttribute("nombre");
        %>
        <h1>Login</h1>
        <form action="/MVC/Login" method="POST">
            <div <%if(error == null){out.print("style=display:none");}%>>
                <label for="nombre">Fallo de acceso: <%out.print(error);%></label>
            </div>
            <br/>
            <div class="form-group">
                <label for="nombreCoche">Nombre</label>
                <br/> 
                <input type="text" name="nombre" value=""/>
            </div>
            <div class="form-group">
                <label for="nombreCoche">Password</label>
                <br/> 
                <input type="text" name="pass" value=""/>
            </div>
             <input class="button" type="submit" value="Acceder a la Web"/>
         </form>
    </body>
</html>
