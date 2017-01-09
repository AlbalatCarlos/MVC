<%-- 
    Document   : agregarPeliculas
    Created on : 03-ene-2017, 17:24:08
    Author     : Jayro
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="Servlets.ModeloDatos"%>
<%@page import="Servlets.ModeloDatos.*"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Agregar peliculas formulario</title>
        <meta name="viewport" content="width=device-width , user scalable=no, initial-scale=1.0, maxumun-scale=1.0, minimum-scale=1.0">
        <link rel="stylesheet" href="../css/bootstrap.min.css">
        <link rel="stylesheet" href="../css/estilos.css">
        <script src="../js/jquery.js"></script>
        <script src="../js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="../css/estilos.css">
    </head>
    <body>
        <%

            String nombrePelicula = (String) session.getAttribute("nombrePelicula");

            ModeloDatos bd = new ModeloDatos();
            bd.abrirConexion();
            PELICULA pelicula = bd.damePelicula(nombrePelicula);
            String nombre = (String) session.getAttribute("nombre");
            ArrayList<COMENTARIO> comentarios = bd.dameListaComentarios(nombrePelicula);
            bd.cerrarConexion();

        %>
        <header>
            <div class="container" style="text-align: center">
                <h1><%out.print(pelicula.nombre);%></h1>
            </div>
        </header>
        <br>
        <div class="row">
            <div class="col-sm-2"></div>
            <div class="col-sm-8">
                <div class="row">
                    <div class="col-sm-6">
                        <div><img src="../Imagenes/cartelera/drive.jpg" align="center" class="img-rounded" alt="Drive" width="304" height="320"></div>
                    </div>
                    <div class="col-sm-6">
                        <span class="label label-primary btn-block" style="text-align: center">Sinopsis</span>
                        <div  class="contenedorInfo"  style="text-align: center; height:320px;"><%out.print(pelicula.sipnosis);%></div>
                    </div>
                </div>
                <br>
                <br>
                <span class="label label-primary btn-block" style="text-align: center">Titulo Original</span>
                <div class="contenedorInfo"   style="text-align: center"><%out.print(pelicula.tituloOriginal);%></div>
                <br>
                
                <span class="label label-primary btn-block" style="text-align: center">Genero</span>
                <div class="contenedorInfo"  style="text-align: center"><%out.print(pelicula.genero);%></div>
                <br>
                
                <span class="label label-primary btn-block" style="text-align: center">Director</span>
                <div class="contenedorInfo"  style="text-align: center"><%out.print(pelicula.director);%></div>
                <br>
                
                <span class="label label-primary btn-block" style="text-align: center">Actores</span>
                <div class="contenedorInfo"  style="text-align: center"><%out.print(pelicula.actores);%></div>
                <br>

                <span class="label label-primary btn-block" style="text-align: center">Nacionalidad</span>
                <div class="contenedorInfo"  style="text-align: center"><%out.print(pelicula.nacionalidad);%></div>
                <br>
                
                 <div class="row">
                    <div class="col-sm-6">
                       <span class="label label-primary btn-block" style="text-align: center">Duracion</span>
                <div class="contenedorInfo"  style="text-align: center"><%out.print(pelicula.duracion);%></div>
                <br>
                    </div>
                    <div class="col-sm-6">
                        <span class="label label-primary btn-block" style="text-align: center">Edad minima Recomendada</span>
                <div class="contenedorInfo"  style="text-align: center"><%out.print(pelicula.edad);%></div>
                <br>
                    </div>
                </div>
                
               




            </div>
            <div class="col-sm-2"></div>
        </div>
         
         
        <div class="row">
            <div class="col-sm-2"></div>
            <div class="col-sm-2"><a href="/MVC/index.jsp" class="button btn btn-primary btn-md">Volver a cartelera </a></div>
            <div class="col-sm-4"></div>
            <div class="col-sm-2"></div>
            <div class="col-sm-2"></div>
        </div>
                <br/>
                <br/>
                <br/>
                <br/>
        <div id="comentarios" style="<%if(bd.IsNullOrWhiteSpace(nombre)){out.print("display:none");}%>">
            <div class="row">
                <div class="panel panel-default col-xs-offset-3 col-xs-6">
                    <div class="panel-heading"><h3>Lista de comentarios</h3></div>
                    <div class="panel-body">
                        <table class="table table-condensed">
                        <%

                            try{
                                for(COMENTARIO comentario : comentarios)
                                {
                                    out.println("<tr><td>"+comentario.nombreUsuario+"</td><td>"+comentario.comentario+"</td></tr>");
                                }
                            }
                            catch(Exception e)
                            {}

                        %>
                        </table>
                    </div>
                </div>
            </div>

            <div class="row">
                <form class="form-group col-xs-offset-2 col-xs-8">
                    <div class="form-group row">
                        <label class="control-label col-xs-3" style="text-align: right">Comentar</label>
                        <div class="col-xs-6">
                            <input required type="text"  class="form-control" id="comentario" name="comentario" value="" placeholder="Comentario">
                        </div>
                        <div class="col-xs-3">
                            <a onclick="AltaComentario()" class="button btn btn-primary btn-md">Comentar Pelicula</a>
                        </div>
                    </div>
                    <br/>
                    
                        

                    
                </form>
            </div>
        </div>
        
        
        





    </body>
</html>
<script>
    function AltaComentario(){
        var data = {
            comentario: $('#comentario').val(),
            nombrePelicula: "<%out.print(nombrePelicula);%>",
            nombreUsuario: "<%out.print(nombre);%>"

        };

        $.ajax({
            type: "POST",
            url: "/MVC/AltaComentario",
            //data: JSON.stringify(data),
            data: data,
            success: function () {
                window.location.href='../InfoPelicula';
            }
            //success: function(response) {
            //    alert('vuelvo!!!');
            //}
        });
    }
</script>