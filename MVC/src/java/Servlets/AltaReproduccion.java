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
import javax.servlet.http.HttpSession;

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
        
         String idReproduccion= "";
        
        if(((String)req.getParameter("idReproduccion"))!=null){
        idReproduccion= req.getParameter("idReproduccion");
        }else
        {
            idReproduccion = bd.dameSiguienteIdReproduccionLibre();
        }
        

        HttpSession session = req.getSession();
        session.removeAttribute("error");
        String pagina = "/MVC/Reproduccion/ModificarReproduccionAux.jsp";
        String nombreSession = (String)session.getAttribute("nombre");
        
        String rol = bd.dameRolUsuario(nombreSession);
        
        if(bd.IsNullOrWhiteSpace(nombreSession))
        {
            session.setAttribute("error", "No puede dar de alta una reproduccion si no está logado");
            pagina = "/MVC/Usuario/Login.jsp";
        } 
        else if (bd.existeReproduccion(idReproduccion)) 
        {
            if(rol.equals("admin"))
            {
                bd.actualizarReproduccion(nombrePelicula, nombreSala, fecha, hora, idReproduccion);
                session.setAttribute("idReproduccion", idReproduccion);
            }
            else
            {
                session.setAttribute("error", "No puede modificar una sala si no es administrador");
                pagina = "/MVC/Usuario/Login.jsp";
            }
        } else {
            if(rol.equals("admin"))
            {
                bd.insertarReproduccion(nombrePelicula, nombreSala, fecha, hora, idReproduccion);
                session.setAttribute("idReproduccion", idReproduccion);
            }
            else
            {
                session.setAttribute("error", "No puede dar de alta una sala si no es administrador");
                pagina = "/MVC/Usuario/Login.jsp";
            }
        }
        
        res.sendRedirect(res.encodeRedirectURL(pagina));
    }

   public void destroy() {
        bd.cerrarConexion();
        super.destroy();
    }
}
