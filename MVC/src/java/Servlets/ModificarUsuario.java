/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
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
public class ModificarUsuario extends HttpServlet {


    public void service(HttpServletRequest req,
            HttpServletResponse res) throws ServletException, IOException {
        
        HttpSession session = req.getSession();
        String nombre = (String) session.getAttribute("nombre");
        
        res.sendRedirect(res.encodeRedirectURL("/MVC/Usuario/ModificarUsuario.jsp"));
    }

}
