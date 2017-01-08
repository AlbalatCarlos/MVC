<%-- 
    Document   : altaEntrada
    Created on : 06-ene-2017, 16:40:51
    Author     : Jayro
--%>

<%@page import="Servlets.ModeloDatos.ENTRADA"%>
<%@page import="Servlets.ModeloDatos.REPRODUCCION"%>
<%@page import="Servlets.ModeloDatos.SALA"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Servlets.ModeloDatos"%>
<%@page import="Servlets.ModeloDatos.PELICULA"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Agregar reproduccion formulario</title>
        <meta name="viewport" content="width=device-width , user scalable=no, initial-scale=1.0, maxumun-scale=1.0, minimum-scale=1.0">
        <link rel="stylesheet" href="../css/bootstrap.min.css">
        <link rel="stylesheet" href="../css/estilos.css">
        <script src="../js/jquery.js"></script>
        <script src="../js/bootstrap.min.js"></script>
    </head>
    <body>
        
        
        <%
            
            String idReproduccion = (String) session.getAttribute("idReproduccion");
            
            ModeloDatos bd = new ModeloDatos();
            bd.abrirConexion();
            REPRODUCCION reproduccion =  bd.dameReproduccion(idReproduccion);
            SALA sala =  bd.dameSala(reproduccion.nombreSala);
            ArrayList<ENTRADA> entradas = bd.dameListaEntradasPorIdReproduccion(idReproduccion);
            String nombre= (String) session.getAttribute("nombre");
            
            
            
        %>
        <header>
            <div class="container" style="text-align: center">
                <h1>AGREGAR ENTRADA</h1>
            </div>
        </header>
        <br>



        <form class="form-group col-xs-6 col-xs-offset-3" action="/MVC/AltaReproduccion" method="POST">

            <div class="col-xs-9 col-xs-offset-3">
                <div  style="text-align: center" >
                        <%
                            
                            try {
                                String resp = "",icono;
                                out.println("<div class='row'>");
                                for(int i=1;i<=(sala.filas * sala.columnas);i++)
                                {
                                    if((i % sala.columnas) == 1)
                                        out.println("</div><br/><div class='row'>");
                                    resp = "";
                                    icono= "I";
                                    for(ENTRADA entrada : entradas)
                                    {
                                        int fila = ((i - 1) % sala.columnas);
                                        int columna = (i-1 / sala.filas);
                                        if(entrada.fila == fila && entrada.columna==columna){}
                                            icono= "X";
                                    }
                                    out.println("<div style='width:50px;display:inline-block;' > "+icono + "</div>");
                                }
                                out.println("</div>");

                            } catch (Exception e) {
                                
                            }

                        %>
                    </div>
            </div>
            <br>
            <br>

            <label class="control-label col-xs-3">Hora:</label>
            <div class="col-xs-9">
                <input type="number"  class="form-control" name="hora" placeholder="Hora">
            </div>
            <br>
            <br>

   
            <br>
            <br>
            <br>
            <br>
            <br>
            <br>

            <div class="row">
                <div class="col-sm-2"></div>
                <div class="col-sm-2"><a href="/MVC/" class="button btn btn-primary btn-md">Volver a menu </a></div>
                <div class="col-sm-4"><input class="button btn btn-success btn-block" type="submit" value="Alta Entrada"/></div>
                <div class="col-sm-2"></div>
                <div class="col-sm-2"></div>
            </div>



        </form>

    </body>
</html>