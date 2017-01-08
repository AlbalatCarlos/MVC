<%-- 
    Document   : menuGestionPeliculas
    Created on : 04-ene-2017, 12:12:10
    Author     : Jayro
--%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" 
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <meta name="viewport" content="width=device-width , user scalable=no, initial-scale=1.0, maxumun-scale=1.0, minimum-scale=1.0"/>
        <link rel="stylesheet" href="../css/bootstrap.min.css"/>
        <link rel="stylesheet" href="../css/estilos.css"/>
        <script src="../js/jquery.js"></script>
        <script src="../js/bootstrap.min.js"></script>
    </head>
    <body>
        <header>
            <div class="container" style="text-align: center">
                <h1>MENU GESTION ENTRADAS</h1>
            </div>
        </header>
        <br/>
        <br/>
        <br/>    
        <div class="row">
            <div class="col-sm-3"></div>
            <div class="col-sm-6"> <div class="dropdown">
                    <button class="btn btn-primary  btn-block dropdown-toggle" type="button" data-toggle="dropdown">
                        Gestion Entradas
                        <span class="caret"></span>
                    </button>
                    <ul class="dropdown-menu btn btn-block">
                        <li><a style="color:#337ab7;" class="btn btn-block btn-default" href="../MenuEntradas?dir=alta">Alta Entrada</a></li>
                        <li><a style="color:#337ab7;" class="btn  btn-block btn-default" href="../MenuEntradas?dir=mod">Modificar Entrada</a></li>
                        <li><a style="color:#337ab7;" class="btn  btn-block btn-default" href="../MenuEntradas?dir=bor">Borrar Entrada</a></li>
                    </ul>
                </div> </div>

            <div class="col-sm-3"></div>
        </div>


       
    </body>
</html>
