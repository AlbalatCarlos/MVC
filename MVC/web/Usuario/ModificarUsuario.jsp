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
      
        <meta name="viewport" content="width=device-width , user scalable=no, initial-scale=1.0, maxumun-scale=1.0, minimum-scale=1.0">
        <link rel="stylesheet" href="../css/bootstrap.min.css">
        <link rel="stylesheet" href="../css/estilos.css">
        <script src="../js/jquery.js"></script>
        <script src="../js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="../css/estilos.css">
        <title>Modificar usuario</title>
    </head>
    <body style="text-align:center;">
        
        <%
            String nombre = (String) session.getAttribute("nombre");
        %>
        <h1><%if (nombre!= null) {}else{out.print("No está logado");}%></h1>
        <div  style="<%if (nombre == null) {out.print("display:none;");}%>">
            
            <!--<form action="/MVC/AltaUsuario" method="POST">
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
            </form>-->
            
         <div class="row">
       <div class="col-xs-12">
            <form action="/MVC/AltaUsuario" method="POST">
              
            <br/>
            <div class="container">
	<div class="login col-xs-6 col-xs-offset-3">
            <br/>
            <img src="../Imagenes/login-avatar.png" align="center" class="img-rounded" alt="Drive" width="100" height="100">
		<h4>Modificar Usuario</h4>
			<hr>
        		
    				<input type="user" value =<%out.print(nombre);%> class="form-control" name="nombre"  placeholder="Introducir Usuario">
                                <input type="user" class="form-control" name="apellidos"  placeholder="Introduce apellidos">
    				<input type="password" class="form-control password" name="pass" id="password-input" placeholder="Password">
					<label class="checkbox-inline">
						<br/>
					</label>
					<input class="btn btn-block btn-lg btn-success submit" type="submit" value="Modificar">
                                        <br/>
			
			
	</div>
</div>
        </form>
                        </div>
            </div>
   
            
            
        </div>
    </body>
</html>
