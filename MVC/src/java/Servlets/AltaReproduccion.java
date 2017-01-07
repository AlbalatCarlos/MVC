/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Jayro
 */
public class AltaReproduccion extends HttpServlet {

     private ModeloDatos bd;

    public void init(ServletConfig cfg) throws ServletException {
        bd = new ModeloDatos();
        bd.abrirConexion();
    }

    @SuppressWarnings("empty-statement")
    public void service(HttpServletRequest req,
            HttpServletResponse res) throws ServletException, IOException {

        String nombrePelicula = (String) req.getParameter("nombrePelicula");
        String nombreSala = (String) req.getParameter("nombreSala");
        String fecha = (String) req.getParameter("fecha");
        
      
        double hora=0.00;
        
        if(((String)req.getParameter("hora")).length()>0){
        hora= Double.parseDouble(req.getParameter("hora"));
        }
        
         int idReproduccion=0;
        
        if(((String)req.getParameter("idReproduccion")).length()>0){
        idReproduccion= Integer.parseInt(req.getParameter("idReproduccion"));
        }
        

        
        
        bd.insertarReproduccion(nombrePelicula, nombreSala, fecha, hora, idReproduccion);

        res.sendRedirect(res.encodeRedirectURL("/MVC/altaReproduccion.jsp"));

    }

   public void destroy() {
        bd.cerrarConexion();
        super.destroy();
    }
}
