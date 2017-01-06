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
public class PruebaSession extends HttpServlet {

    private ModeloDatos bd;

    public void init(ServletConfig cfg) throws ServletException {
        bd = new ModeloDatos();
        bd.abrirConexion();
    }

    public void service(HttpServletRequest req,
            HttpServletResponse res) throws ServletException, IOException {
        String nombreUsuario = (String) req.getParameter("nombreUsuario");
        HttpSession session = req.getSession();
        System.out.println();
        
        
        PrintWriter out = res.getWriter();
        out.println("<h1 style='text-align:center'>"+session.getAttribute("nombre")+"</h1>");
        session.setAttribute("nombre", "Paco");
        out.println("<h1 style='text-align:center'>"+session.getAttribute("nombre")+"</h1>");
        out.println("<h1 style='text-align:center'>"+nombreUsuario+"</h1>");

    }

    public void destroy() {
        bd.cerrarConexion();
        super.destroy();
    }
}
