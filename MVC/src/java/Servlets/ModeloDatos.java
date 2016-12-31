/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import java.util.*;
import java.sql.*;

/**
 *
 * @author CARLOS
 */


public class ModeloDatos {

    public class Registro {
        public ArrayList<Campo> campos;
    }
    public class Campo{
        public String nombre;
        public String valor;
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
            con = DriverManager.getConnection("jdbc:derby://localhost:1527/sample", "app", "app");
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
            System.out.println("No lee de la tabla");
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
                    "UPDATE USUARIO SET " + strSQl + "' WHERE nombre "
                    + " LIKE '%" + nombre + "%'");
            rs.close();
            set.close();
        } catch (Exception e) {
            System.out.println("No modifica la tabla");
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
            System.out.println("Ya existía el usuario");
        }
    }
    
    public ArrayList<Registro> dameListaEntradas() {
        try {
            set = con.createStatement();
            rs = set.executeQuery("SELECT * FROM ENTRADA");

            ArrayList<Registro> registros = new ArrayList<Registro>();
            
            Campo campo = new Campo();

            //Guardo las entradas en un ArrayList
            while (rs.next()) {
                Registro registro = new Registro();
                campo.nombre = "idReproduccion";
                campo.valor = rs.getString("idReproduccion");
                registro.campos.add(campo);
                
                campo.nombre = "nombreUsuario";
                campo.valor = rs.getString("nombreUsuario");
                registro.campos.add(campo);
                
                campo.nombre = "fila";
                campo.valor = rs.getString("fila");
                registro.campos.add(campo);
                
                campo.nombre = "columna";
                campo.valor = rs.getString("columna");
                registro.campos.add(campo);
                
                campo.nombre = "referencia";
                campo.valor = rs.getString("referencia");
                registro.campos.add(campo);
                
                registros.add(registro);
            }
            rs.close();
            set.close();
            
            return registros;
        } catch (Exception e) {
            System.out.println("Fallo al listar entradas");
            return null;
        }
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

}
