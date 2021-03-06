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
        <link rel="stylesheet" href="css/bootstrap.min.css"/>
        <link rel="stylesheet" href="css/estilos.css"/>
        <script src="js/jquery.js"></script>
        <script src="js/bootstrap.min.js"></script>
    </head>
    <body>
        <header>
            <div class="container" style="text-align: center">
                <h1>MENU GESTION PELICULAS</h1>
            </div>
        </header>
        <div class="row">
            <div class="col-sm-2"></div>
            <div class="col-sm-8" >
                <nav class="navbar navbar-default">
                    <div class="container-fluid">
                        <div class="navbar-header">
                            <a class="navbar-brand" >CINES CARJAY</a>
                        </div>
                        <ul class="nav navbar-nav">
                            <li class="active"><a >Administración</a></li>
                                

                        </ul>

                        <ul class="nav navbar-nav navbar-right">
                            <li><a href='/MVC/'><span class='glyphicon glyphicon-log-in'></span> Volver al inicio</a></li>
                        </ul>
                    </div>
                </nav>
            </div>
        </div>
        <br/>
        <br/>
        <br/>    
        <div class="row">
            <div class="col-sm-3"></div>
            <div class="col-sm-6"> <div class="dropdown">
                    <button class="btn btn-primary  btn-block dropdown-toggle" type="button" data-toggle="dropdown">
                        Gestion Peliculas
                        <span class="caret"></span>
                    </button>
                    <ul class="dropdown-menu btn btn-block">
                        <li><a style="color:#337ab7;" class="btn btn-block btn-default" href="./MenuGestionPeliculas?dir=alta&obj=Pelicula">Alta Película</a></li>
                        <li><a style="color:#337ab7;" class="btn  btn-block btn-default" href="./MenuGestionPeliculas?dir=mod&obj=Pelicula">Modificar Película</a></li>
                        <li><a style="color:#337ab7;" class="btn  btn-block btn-default" href="./MenuGestionPeliculas?dir=bor&obj=Pelicula">Borrar Película</a></li>
                    </ul>
                </div> </div>

            <div class="col-sm-3"></div>
        </div>


        <br/>
        <br/>
        <div class="row">
            <div class="col-sm-3"></div>
            <div class="col-sm-6"> <div class="dropdown">
                    <button class="btn btn-primary  btn-block dropdown-toggle" type="button" data-toggle="dropdown">
                        Gestion Salas
                        <span class="caret"></span>
                    </button>
                    <ul class="dropdown-menu btn btn-block"  >
                        <li><a style="color:#337ab7;" class="btn btn-block btn-default" href="./MenuGestionPeliculas?dir=alta&obj=Sala">Alta Sala</a></li>
                        <li><a style="color:#337ab7;" class="btn  btn-block btn-default" href="./MenuGestionPeliculas?dir=mod&obj=Sala">Modificar Sala</a></li>
                        <li><a style="color:#337ab7;" class="btn  btn-block btn-default" href="./MenuGestionPeliculas?dir=bor&obj=Sala">Borrar Sala</a></li>
                    </ul>
                </div> </div>

            <div class="col-sm-3"></div>
        </div>

        <br/>
        <br/>

        <div class="row">
            <div class="col-sm-3"></div>
            <div class="col-sm-6"> <div class="dropdown">
                    <button class="btn btn-primary  btn-block dropdown-toggle" type="button" data-toggle="dropdown">
                        Gestión Reproducciones
                        <span class="caret"></span>
                    </button>
                    <ul class="dropdown-menu btn btn-block"  >
                        <li><a style="color:#337ab7;" class="btn btn-block btn-default" href="./MenuGestionPeliculas?dir=alta&obj=Reproduccion">Alta Reproducción</a></li>
                        <li><a style="color:#337ab7;" class="btn  btn-block btn-default" href="./MenuGestionPeliculas?dir=mod&obj=Reproduccion">Modificar Reproducción</a></li>
                        <li><a style="color:#337ab7;" class="btn  btn-block btn-default" href="./MenuGestionPeliculas?dir=bor&obj=Reproduccion">Borrar Reproducción</a></li>
                    </ul>
                </div> </div>

            <div class="col-sm-3"></div>
        </div>
    </body>
</html>
