package Servlets;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.util.*;
import java.sql.*;

/**
 *
 * @author CARLOS
 */
public class AltaCircuito extends HttpServlet {

    private ModeloDatos bd;

    public void init(ServletConfig cfg) throws ServletException {
        bd = new ModeloDatos();
        bd.abrirConexion();
    }

    public void service(HttpServletRequest req,
            HttpServletResponse res) throws ServletException, IOException {
        String nombre = (String) req.getParameter("nombreCircuito");
        String ciudad = (String) req.getParameter("ciudad");
        String pais = (String) req.getParameter("pais");
        String vueltas = (String) req.getParameter("vueltas");
        String longitud = (String) req.getParameter("longitud");
        String curvasPorVuelta = (String) req.getParameter("curvasPorVuelta");
        
        System.out.println(nombre + " - " + ciudad + " - " + pais + " - " + vueltas 
                + " - " + longitud + " - " + curvasPorVuelta);

        if (validarCircuito(vueltas, longitud, curvasPorVuelta) == true) {
            if (bd.existeRegistroEnTabla("CIRCUITO","nombre",nombre)) {
                bd.actualizarCircuito(nombre, ciudad, pais, vueltas, longitud, curvasPorVuelta);
            } else {
                bd.insertarCircuito(nombre, ciudad, pais, vueltas, longitud, curvasPorVuelta);
            }
        }

        //s.setAttribute("nombreCliente", nombreP);
        // Llamada a la página jsp que nos da las gracias
        res.sendRedirect(res.encodeRedirectURL("/Practica6MVC/index.jsp"));

    }

    public void destroy() {
        bd.cerrarConexion();
        super.destroy();
    }

    private boolean validarCircuito(String vueltas, String longitud, String curvasPorVuelta) {
        try {
            double numero = Double.parseDouble(vueltas);
            
            //validamos que la variable vueltas tenga un valor entre 80 y 40
            if (numero > 80 || numero < 40)
                return false;
            
            numero = Double.parseDouble(longitud);
            
            //validamos que la longitud tenga un valor entre 9000 y 3000
            if (numero > 9000 || numero < 3000)
                return false;
            
            numero = Double.parseDouble(curvasPorVuelta);
            
            //validamos que la variable curvasPorVuelta tenga un valor entre 9000 y 3000
            if (numero > 20 || numero < 6)
                return false;
            
            return true;
        } catch (Exception e) {
            System.out.println("Debe introducir numeros. Vueltas: "+vueltas
                    +" Longitud: "+longitud+" Curvas: "+curvasPorVuelta);
            return false;
        }
    }
}
