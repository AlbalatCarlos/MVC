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

    public void actualizarCoche(String nombre, String ganaciaKW) {
        try {
            set = con.createStatement();
            set.executeUpdate(
                    "UPDATE COCHE SET ganaciaKW=" + ganaciaKW + " WHERE nombre "
                    + " LIKE '%" + nombre + "%'");
            rs.close();
            set.close();
        } catch (Exception e) {
            System.out.println("No modifica la tabla");
        }
    }

    public void insertarCoche(String nombre, String gananciaKW) {
        try {
            set = con.createStatement();
            set.executeUpdate("INSERT INTO COCHE "
                    + " (nombre,ganaciaKW) VALUES ('" + nombre + "'," + gananciaKW + ")");
            rs.close();
            set.close();
        } catch (Exception e) {
            System.out.println("No inserta en la tabla");
        }
    }

    public void actualizarCircuito(String nombre, String ciudad, String pais,
            String vueltas, String longitud, String curvasPorVuelta) {
        try {
            String strSQl = "ciudad='" + ciudad + "',pais='" + pais 
                    + "',vueltas=" + vueltas + ",longitud=" + longitud 
                    + ",curvasPorVuelta=" + curvasPorVuelta ;
            
            set = con.createStatement();
            set.executeUpdate(
                    "UPDATE CIRCUITO SET " + strSQl + " WHERE nombre "
                    + " LIKE '%" + nombre + "%'");
            rs.close();
            set.close();
        } catch (Exception e) {
            System.out.println("No modifica la tabla");
        }
    }

    public void insertarCircuito(String nombre, String ciudad, String pais,
            String vueltas, String longitud, String curvasPorVuelta) {
        try {
            String strCampos = "nombre,ciudad,pais,vueltas,longitud,curvasPorVuelta";
            String strValues = "'" + nombre + "','" + ciudad + "','" + pais 
                    + "'," + vueltas + "," + longitud 
                    + "," + curvasPorVuelta;
            
            set = con.createStatement();
            set.executeUpdate("INSERT INTO CIRCUITO "
                    + " ("+strCampos+") VALUES (" + strValues + ")");
            rs.close();
            set.close();
        } catch (Exception e) {
            System.out.println("No inserta en la tabla");
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
