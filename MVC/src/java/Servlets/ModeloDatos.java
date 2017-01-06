/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import java.util.*;
import java.sql.*;
import java.util.Date;

/**
 *
 * @author CARLOS
 */


public class ModeloDatos {

    public class COMENTARIO {
        public String nombrePelicula; //PK
        public String nombreUsuario; //PK
        public String comentario;
    }
    
    public class ENTRADA {
        public int idReproduccion; //FK REPRODUCCION
        public String nombreUsuario; //FK USUARIO
        public int fila;
        public int columna;
        public int referencia; //PK
    }
    
    public class PELICULA {
        public String nombre; //PK
        public String sipnosis;
        public String paginaOficial;
        public String tituloOriginal;
        public String genero;
        public String nacionalidad;
        public double duracion;
        public int anyo;
        public String distribuidora;
        public String director;
        public String otrosDatos;
        public String actores;
        public String edad;
    }
    
    public class PELICULA_AUTORES {
        public String nombrePelicula; //PK 
        public String nombreAutor; //PK
    }
    
    public class REPRODUCCION {
        public String nombrePelicula; //FK PELICULA
        public String nombreSala; //FK SALA
        public Date fecha;
        public double hora;
        public int idReproduccion; //PK
    }
    
    public class SALA {
        public String nombre; //PK
        public int filas;
        public int columnas;
    }
    
    public class USUARIO {
        public String nombre; //PK
        public String apellidos;
        public String pass;
        public String rol;
    }
    
    
    private Connection con;
    private Statement set;
    private ResultSet rs;

    public void abrirConexion() {
        String sURL = "jdbc:odbc:mvc";  
        if (con != null) {
            return;
        }
        try {
            //Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
            Class.forName("org.apache.derby.jdbc.ClientDriver");
            //    con = DriverManager.getConnection(sURL,"","");
            con = DriverManager.getConnection("jdbc:derby://localhost:1527/MVCAUX", "app", "app");
            System.out.println("Se ha conectado");
        } catch (Exception e) {
            System.out.println("No se ha conectado");
        }
    }

    public boolean existeRegistroEnTabla(String nombreTabla, String nombreCampoClave,
            String valorClave) {

        boolean existe = false;
        String cad;
        try {
            set = con.createStatement();
            rs = set.executeQuery("SELECT * FROM " + nombreTabla);
            while (rs.next()) {
                cad = rs.getString(nombreCampoClave);
                cad = cad.trim();
                if (cad.compareTo(valorClave.trim()) == 0) {
                    existe = true;
                }
            }
            rs.close();
            set.close();
        } catch (Exception e) {
            System.out.println("No lee de la tabla Nombre: "+ valorClave+" \nException: "+e);
        }
        return (existe);
    }
    
    public boolean IsNullOrWhiteSpace(String value) {
        if (value == null) {
            return true;
        }
        for (int index = 0; index < value.length(); ++index) {
            if (value.charAt(index) != ' ') 
            {
                return false;
            }
        }
        return true;
    }

    public void actualizarUsuario(String nombre, String apellidos, String pass, String rol) {
        try {
            String strSQl = "apellidos='" + apellidos + "',pass='" + pass 
                    + "',rol='" + rol + "'";
            set = con.createStatement();
            set.executeUpdate(
                    "UPDATE USUARIO SET " + strSQl + " WHERE nombre "
                    + " LIKE '%" + nombre + "%'");
            rs.close();
            set.close();
        } catch (Exception e) {
            System.out.println("No modifica la tabla. Nombre: "+ nombre+" \nException: "+ e);
        }
    }
    
    public void insertarUsuario(String nombre, String apellidos, String pass, String rol) {
        try {
            set = con.createStatement();
            set.executeUpdate("INSERT INTO USUARIO "
                    + " (nombre,apellidos,pass,rol) VALUES ('" + nombre + "','" + apellidos
                    + "','"+ pass+"','"+rol+"')");
            rs.close();
            set.close();
        } catch (Exception e) {
            System.out.println("Ya existía el usuario"+ e);
        }
    }
    
    public boolean Logearse(String nombre, String pass){
        boolean exito = false;
        try {
            set = con.createStatement();
            rs = set.executeQuery("SELECT * FROM USUARIO WHERE nombre='"+nombre
                    +"' and pass='" + pass+"'");
            while (rs.next()) {
                exito = true;
            }
            
            rs.close();
            set.close();
            
        } catch (Exception e) {
            System.out.println("No lee de la tabla USUARIO \nException: "+e);
            return false;
        }
        return exito;
    }
    
    public String dameRolUsuario( String nombreUsuario ){
        String rol = "";
        try {
            set = con.createStatement();
            rs = set.executeQuery("SELECT rol FROM USUARIO WHERE nombre='"+nombreUsuario+"'");
            while (rs.next()) {
                rol = rs.getString("rol");
                rol = rol.trim();
            }
            
            rs.close();
            set.close();
        } catch (Exception e) {
            System.out.println("No lee el rol de la tabla USUARIO \nException: "+e);
            return null;
        }
        return rol;
    }
    
    public ArrayList<ENTRADA> dameListaEntradas() {
        try {
            set = con.createStatement();
            rs = set.executeQuery("SELECT * FROM ENTRADA");

            ArrayList<ENTRADA> entradas = new ArrayList<ENTRADA>();
            

            //Guardo las entradas en un ArrayList
            while (rs.next()) {
                try{
                    ENTRADA entrada = new ENTRADA();
                    entrada.idReproduccion =  rs.getInt("idReproduccion");

                    entrada.nombreUsuario = rs.getString("nombreUsuario");

                    entrada.fila = rs.getInt("fila");

                    entrada.columna = rs.getInt("columna");

                    entrada.referencia = rs.getInt("referencia");

                    entradas.add(entrada);
                }
                catch(Exception e){
                    System.out.println("Alguna de las entradas tiene datos no validos: "+e);
                    return new ArrayList<ENTRADA>();
                }
            }
            rs.close();
            set.close();
            
            return entradas;
        } catch (Exception e) {
            System.out.println("Fallo al listar entradas "+ e);
            return new ArrayList<ENTRADA>();
        }
    }
    
    public PELICULA damePelicula(String nombrePelicula)
    {
        PELICULA pelicula = new PELICULA();
        try {
            set = con.createStatement();
            rs = set.executeQuery("SELECT * FROM PELICULA WHERE nombre='"+nombrePelicula+"'");
            while (rs.next()) {
                pelicula.nombre = rs.getString("nombre");
                pelicula.anyo = rs.getInt("anyo");
                pelicula.director = rs.getString("director");
                pelicula.distribuidora = rs.getString("distribuidora");
                pelicula.duracion = rs.getInt("duracion");
                pelicula.genero = rs.getString("genero");
                pelicula.nacionalidad = rs.getString("nacionalidad");
                pelicula.otrosDatos = rs.getString("otrosDatos");
                pelicula.paginaOficial = rs.getString("paginaOficial");
                pelicula.sipnosis = rs.getString("sinopsis");
                pelicula.tituloOriginal = rs.getString("tituloOriginal");
                pelicula.actores = rs.getString("actores");
                pelicula.edad = rs.getString("edad");
                
            }
            
            rs.close();
            set.close();
        } catch (Exception e) {
            System.out.println("No lee el rol de la tabla USUARIO \nException: "+e);
            return null;
        }
        return pelicula;
    }
    

    public void cerrarConexion() {
        try {
            con.close();
        } catch (Exception e) {
        }
    }

    double calcularGananciaPorCocheYCircuito(String coche, String circuito) {
        try {
            double vueltas;
            double curvasPorVuelta;
            double gananciaFinal = 0.0;
            set = con.createStatement();
            rs = set.executeQuery("SELECT vueltas,curvasPorVuelta FROM CIRCUITO WHERE nombre='"
                    + circuito +"'");
            while (rs.next()) {
                
                vueltas = rs.getDouble("vueltas");
                curvasPorVuelta = rs.getDouble("curvasPorVuelta");
                rs = set.executeQuery("SELECT ganaciaKW FROM COCHE WHERE nombre='"
                    + coche +"'");
                while(rs.next()){
                    
                    gananciaFinal = vueltas * curvasPorVuelta * rs.getDouble("ganaciaKW");
                }
            }
            rs.close();
            set.close();
            
            return gananciaFinal;
        } catch (Exception e) {
            System.out.println("No se ha podido calcular la ganancia");
            return 0.0;
        }
    }
    
    
    
    
    
    
    // ----------------------------------------------- GESTION DE PELICULAS ---------------------------------------- Jayro
    
     public void insertarPelicula(String nombre, String sinopsis, String paginaOficial, String tituloOriginal,
            String genero, String nacionalidad, double duracion, int ano, String distribuidora, String director, String actores,
            String datos, String edad) {
        try {
            System.out.println("AQUIII LA PELICULA 2  " + nombre + sinopsis);
            set = con.createStatement();
            set.executeUpdate("INSERT INTO PELICULA "
                    + " (NOMBRE , SINOPSIS, PAGINAOFICIAL, TITULOORIGINAL, GENERO, NACIONALIDAD, DURACION,"
                    + "ANYO, DISTRIBUIDORA, DIRECTOR, ACTORES, OTROSDATOS, EDAD) VALUES"
                    + " ('" + nombre + "' , '" + sinopsis + "' , '" + paginaOficial + "', '" + tituloOriginal + "','" + genero + "'"
                    + ",'" + nacionalidad + "' , " + duracion + " , " + ano + " , '" + distribuidora + "' , '" + director + "' , '" + actores + "'"
                    + ", '" + datos + "' , '" + edad + "')");
            rs.close();
            set.close();
        } catch (Exception e) {
            System.out.println("No inserta en la tabla " + e);
        }
    }
     
     public void modificarPelicula(String nombre, String sinopsis, String paginaOficial, String tituloOriginal,
            String genero, String nacionalidad, double duracion, int ano, String distribuidora, String director, String actores,
            String datos, String edad) {
        try {
            System.out.println("AQUIII LA PELICULA 2  " + nombre + sinopsis);
            set = con.createStatement();
            set.executeUpdate(
                    "UPDATE PELICULA SET "
                    + " NOMBRE='"+nombre+"' , SINOPSIS='"+sinopsis
                    +"', PAGINAOFICIAL='"+ paginaOficial +"', TITULOORIGINAL='"+
                    tituloOriginal+"', GENERO='"+genero+"', NACIONALIDAD='"+nacionalidad
                    +"', DURACION="+duracion+","
                    + " ANYO="+ano+", DISTRIBUIDORA='"+distribuidora+"', DIRECTOR='"+
                    director+"', ACTORES='"+actores+"', OTROSDATOS='"+datos+"', EDAD='"+edad+"'"+
                    "WHERE nombre = '"+nombre+"'"
            );
            rs.close();
            set.close();
        } catch (Exception e) {
            System.out.println("No inserta en la tabla " + e);
        }
    }
     
     
     
    public void borrarPelicula(String nombre) throws SQLException {

        try {

            set = con.createStatement();
            set.executeUpdate("DELETE FROM PELICULA WHERE NOMBRE=" + "'" + nombre + "'");
            rs.close();
            set.close();
        } catch (Exception e) {
            System.out.println("No borra en la tabla " + e);
        }

        set = con.createStatement();

    }
    
    
    
    // ----------------------------------------------- GESTION DE REPRODUCCIONES ---------------------------------------- Jayro
    
    
    
    public void insertarReproduccion(String nombrePelicula, String nombreSala, String fecha, double hora, int idReproduccion ) {
        try {
            System.out.println("AQUIII LA REPRODUCCION 2  " + nombrePelicula + idReproduccion);
            set = con.createStatement();
            set.executeUpdate("INSERT INTO REPRODUCCION "
                    + " (NOMBREPELICULA , NOMBRESALA, FECHA, HORA, IDREPRODUCCION) VALUES"
                    + " ('" + nombrePelicula + "' , '" + nombreSala + "' , '" + fecha + "', " + hora + "," + idReproduccion + ")");
            rs.close();
            set.close();
        } catch (Exception e) {
            System.out.println("No inserta en la tabla " + e);
        }
    }

}
    


