/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Jayro
 */
public class InfoPelicula extends HttpServlet {


    public void service(HttpServletRequest req,
            HttpServletResponse res) throws ServletException, IOException {
        
        HttpSession session = req.getSession();
        
        
        String nombre = (String) req.getParameter("nombrePelicula");
        if(nombre.contains("Ã±"))
        {
            nombre = nombre.replace("Ã±", "ñ");
        }
        
        ModeloDatos bd = new ModeloDatos();
        if(bd.IsNullOrWhiteSpace(nombre) == false)
        {
            session.setAttribute("nombrePelicula", nombre);
        }
        
        res.sendRedirect(res.encodeRedirectURL("/MVC/Pelicula/InfoPelicula.jsp"));
    }

}