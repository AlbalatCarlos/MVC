/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Jayro
 */
public class ModificarPelicula extends HttpServlet {

     private ModeloDatos bd;
     
     private Connection con;
    private Statement set;
    private ResultSet rs;



    public void service(HttpServletRequest req,
            HttpServletResponse res) throws ServletException, IOException {
        
        HttpSession session = req.getSession();
        
        
        String nombre = (String) req.getParameter("nombrePelicula");
        System.out.println("AQUI LLEGA LA PELICULA A Modificar" + nombre);
        
        session.setAttribute("nombrePelicula", nombre);
        
        res.sendRedirect(res.encodeRedirectURL("/MVC/Pelicula/ModificarPeliculaAux.jsp"));
    }

}
  