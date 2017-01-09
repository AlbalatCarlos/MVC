<%-- 
    Document   : agregarPeliculas
    Created on : 03-ene-2017, 17:24:08
    Author     : Jayro
--%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Agregar salas formulario</title>
        <meta name="viewport" content="width=device-width , user scalable=no, initial-scale=1.0, maxumun-scale=1.0, minimum-scale=1.0">
        <link rel="stylesheet" href="../css/bootstrap.min.css">
        <link rel="stylesheet" href="../css/estilos.css">
        <script src="../js/jquery.js"></script>
        <script src="../js/bootstrap.min.js"></script>
    </head>
    <body>
        <header>
            <div class="container" style="text-align: center">
                <h1>AGREGAR SALA</h1>
            </div>
        </header>
        <br>



        <form class="form-group col-xs-6 col-xs-offset-3" action="/MVC/AltaSala" method="POST">

            <label for="nombre" class="control-label col-xs-3">Nombre Sala</label>
            <div class="col-xs-9">
                <input required value="" type="text" class="form-control" id="nombre" name="nombre" placeholder="Nombre Sala">
            </div>
            <br>
            <br>

            <label class="control-label col-xs-3">Filas:</label>
            <div class="col-xs-9">
                <input type="number" class="form-control" id="filas" name="filas" placeholder="Filas">
            </div>
            <br>
            <br>


            <label class="control-label col-xs-3">Columnas:</label>
            <div class="col-xs-9">
                <input type="number"  class="form-control" name="columnas" placeholder="Columnas">
            </div>
            <br>
            <br>

            <br>
            <br>
            <br>

            <div class="row">
                <div class="col-sm-2"></div>
                <div class="col-sm-2"><a href="/MVC/MenuGestionPeliculas" class="button btn btn-primary btn-md">Volver al menú </a></div>
                <div class="col-sm-4"><input class="button btn btn-success btn-block" type="submit" value="Alta Sala"/></div>
                <div class="col-sm-2"></div>
                <div class="col-sm-2"></div>
            </div>



        </form>

    </body>
</html>