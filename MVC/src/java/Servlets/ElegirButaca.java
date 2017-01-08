/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author CARLOS
 */
public class ElegirButaca extends HttpServlet {

    public void service(HttpServletRequest req,
            HttpServletResponse res) throws ServletException, IOException {
        
        HttpSession session = req.getSession();
        
        String idReproduccion = (String) req.getParameter("idReproduccion");
        
        session.setAttribute("idReproduccion", idReproduccion);
        
        res.sendRedirect(res.encodeRedirectURL("/MVC/Entrada/AgregarEntradaAux.jsp"));
    }
}