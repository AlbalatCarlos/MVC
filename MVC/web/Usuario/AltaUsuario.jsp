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
        <title>Alta Usuario</title>
    </head>
    <body style="text-align:center;">
        
        <h1>Alta Usuario</h1>
        <form action="/MVC/AltaUsuario" method="POST">
            <div class="form-group">
                <label for="nombre">Nombre</label>
                <br/> 
                <input type="text" name="nombre" value=""/>
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
             <input class="button" type="submit" value="Alta Usuario"/>
         </form>
    </body>
</html>
