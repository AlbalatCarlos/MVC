/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
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
public class CalculoGanancia extends HttpServlet {

    private ModeloDatos bd;

    public void init(ServletConfig cfg) throws ServletException {
        bd = new ModeloDatos();
        bd.abrirConexion();
    }

    public void service(HttpServletRequest req,
            HttpServletResponse res) throws ServletException, IOException {
        String coche = (String) req.getParameter("coche");
        String circuito = (String) req.getParameter("circuito");
        double gananciaFinal = 0.0;
        if (bd.existeRegistroEnTabla("COCHE", "nombre", coche)
                && bd.existeRegistroEnTabla("CIRCUITO", "nombre", circuito)) {
            gananciaFinal = bd.calcularGananciaPorCocheYCircuito(coche, circuito);
        }
        
        PrintWriter out = res.getWriter();
        out.println("<h1 style='text-align:center'>Ganancia total de KW del coche "+coche+" en el ciruito "+circuito+"</h1>");
        out.println("<h1 style='text-align:center'>"+gananciaFinal+"KW</h1>");

    }

    public void destroy() {
        bd.cerrarConexion();
        super.destroy();
    }
}

