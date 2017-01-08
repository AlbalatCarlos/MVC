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
<%@page import="Servlets.ModeloDatos.*"%>
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
            ModeloDatos bd = new ModeloDatos();
            bd.abrirConexion();
            
            String idReproduccion = (String) session.getAttribute("idReproduccion");
            
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



        <form class="form-group col-xs-6 col-xs-offset-3" action="/MVC/AltaEntrada" method="POST">

            <div class="col-xs-9 col-xs-offset-3">
                <div  style="text-align: center" class="butacas">
                        <%
                            
                            try {
                                String styleYOnClick = "",icono;
                                out.println("<div class='row'>");
                                for(int i=1;i<=(sala.filas * sala.columnas);i++)
                                {
                                    if((i % sala.columnas) == 1)
                                        out.println("</div><br/><div class='row'>");
                                    
                                    int columna = ((i-1) % sala.columnas)+1;
                                    int fila = ((i-1) / sala.columnas)+1;
                                    styleYOnClick = "style='width:50px;display:inline-block; cursor:pointer;' onclick='SeleccionarButaca("+fila+","+columna+",this)'";
                                    icono= "O";
                                    for(ENTRADA entrada : entradas)
                                    {
                                        
                                        if(entrada.fila == fila && entrada.columna==columna)
                                        {
                                            icono= "X";
                                            styleYOnClick = "style='width:50px;display:inline-block;'";
                                        }
                                    }
                                    out.println("<div "+ styleYOnClick +" > "+icono + "</div>");
                                }
                                out.println("</div>");

                            } catch (Exception e) {
                                
                            }
                            bd.cerrarConexion();
                        %>
                    </div>
            </div>
            <br/>
            <div class="form-group row">
                <label class="control-label col-xs-3">Fila</label>
                <div class="col-xs-9">
                    <input required type="number"  class="form-control" id="fila" name="fila" value="" placeholder="Fila">
                </div>
            </div>
            
            <div class="form-group row">
                <label class="control-label col-xs-3">Columna</label>
                <div class="col-xs-9">
                    <input required type="number"  class="form-control" id="columna" name="columna"  value="" placeholder="Columna">
                </div>
            </div>
            
            <div class="form-group row">
                <label class="control-label col-xs-3">Referencia</label>
                <div class="col-xs-9">
                    <input required type="number"  class="form-control" id="referencia" name="referencia" value="" placeholder="Referencia">
                </div>
            </div>
            
            <input style="display:none" type="number"  class="form-control" name="idReproduccion" value="<%out.print(idReproduccion);%>">
            
            
            <input style="display:none;" type="text"  class="form-control" name="nombreUsuario" value="<%out.print(nombre);%>">
          
            <div class="row">
                
                <div class="col-xs-4 col-xs-offset-1"><a href="/MVC/MenuEntradas" class="button btn btn-primary btn-md">Volver a menu </a></div>
                <div class="col-sm-5"><input class="button btn btn-success btn-block" type="submit" value="Alta Entrada"/></div>
                
            </div>



        </form>

    </body>
</html>
<script type="text/javascript">
    
    function SeleccionarButaca( fila, columna,butaca)
    {
        butaca.style.color="red";
        $("#fila").val(fila);
        $("#columna").val(columna);        
    }
</script>