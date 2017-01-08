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
        <meta name="viewport" content="width=device-width , user scalable=no, initial-scale=1.0, maxumun-scale=1.0, minimum-scale=1.0">
        <link rel="stylesheet" href="../css/bootstrap.min.css">
        <link rel="stylesheet" href="../css/estilos.css">
        <script src="../js/jquery.js"></script>
        <script src="../js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="../css/estilos.css">
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
        
       <!-- <form action="/MVC/Login" method="POST">
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
         </form> -->
       <div class="row">
       <div class="col-xs-12">
            <form action="/MVC/Login" method="POST">
                <div <%if(error == null){out.print("style=display:none");}%>>
                <label for="nombre">Fallo de acceso: <%out.print(error);%></label>
            </div>
            <br/>
            <div class="container">
	<div class="login col-xs-6 col-xs-offset-3">
            <br/>
            <img src="../Imagenes/login-avatar.png" align="center" class="img-rounded" alt="Drive" width="100" height="100">
		<h4>Login to Web App</h4>
			<hr>
        		
    				<input type="user" class="form-control" name="nombre"  placeholder="Enter User">
    				<input type="password" class="form-control password" name="pass" id="password-input" placeholder="Password">
					<label class="checkbox-inline">
						<br/>
					</label>
					<input class="btn btn-block btn-lg btn-success submit" type="submit" value="Login">
                                        <br/>
			<a href="../AltaUsuario" class="btn btn-sm btn-primary register">Registrarse</a>
                        
                        
			
	</div>
</div>
        </form>
                        </div>
            </div>
            
    </body>
</html>
