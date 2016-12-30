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
public class AltaCoche extends HttpServlet {

    private ModeloDatos bd;

    public void init(ServletConfig cfg) throws ServletException {
        bd = new ModeloDatos();
        bd.abrirConexion();
    }

    public void service(HttpServletRequest req,
            HttpServletResponse res) throws ServletException, IOException {
        
        String nombre = (String) req.getParameter("nombreCoche");
        String gananciaKW = (String) req.getParameter("gananciaKW");
        System.out.println(nombre+" - " + gananciaKW);

        if (validarGanancia(gananciaKW) == true) {
            if (bd.existeRegistroEnTabla("COCHE","nombre",nombre)) {
                bd.actualizarCoche(nombre, gananciaKW);
            } else {
                bd.insertarCoche(nombre, gananciaKW);
            }
        }

        res.sendRedirect(res.encodeRedirectURL("/Practica6MVC/index.jsp"));

    }

    public void destroy() {
        bd.cerrarConexion();
        super.destroy();
    }

    private boolean validarGanancia(String gananciaKW) {
        try {
            int ganancia = Integer.parseInt(gananciaKW);
            //validamos que la ganancia de KW sea un valor entre 10 y 4
            if (ganancia > 10 || ganancia < 4)
                return false;
            
            return true; 
        } catch (Exception e) {
            System.out.println("La ganancia no es un numero: " + gananciaKW);
            return false ;
        }
    }
}
