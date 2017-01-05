<%-- 
    Document   : AltaUsuario
    Created on : 05-ene-2017, 1:21:56
    Author     : CARLOS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Modificar usuario</title>
    </head>
    <body style="text-align:center;">
        
        <%
            String nombre = (String) session.getAttribute("nombre");
        %>
        <h1><%if (nombre!= null) {out.print("Modificar Usuario");}else{out.print("No está logado");}%></h1>
        <div  style="<%if (nombre == null) {out.print("display:none;");}%>">
            
            <form action="/MVC/AltaUsuario" method="POST">
                <div class="form-group" >
                    <br/>
                    <label for="nombre">Nombre: <%out.print(nombre);%></label>
                    <br/> 
                    <input style="display:none" type="text" name="nombre" value="<%out.print(nombre);%>"/>
                </div>
                <div class="form-group">
                    <label for="apellidos">Apellidos</label>
                    <br/> 
                    <input type="text" name="apellidos" value=""/>
                </div>
                <div class="form-group">
                    <label for="pass">Password</label>
                    <br/> 
                    <input type="text" name="pass" value=""/>
                </div>
                <div class="form-group">
                    <label for="rol">Rol</label>
                    <br/> 
                    <input type="text" name="rol" value=""/>
                </div>
                <input class="button" type="submit" value="Modificar Usuario"/>
            </form>
        </div>
    </body>
</html>
