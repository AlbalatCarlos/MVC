package Servlets;

import Servlets.ModeloDatos.COMENTARIO;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.util.*;
import java.sql.*;
import javax.json.Json;

/**
 *
 * @author CARLOS
 */
public class AltaComentario extends HttpServlet {

    private ModeloDatos bd;

    public void init(ServletConfig cfg) throws ServletException {
        bd = new ModeloDatos();
        bd.abrirConexion();
    }

    public void service(HttpServletRequest req,
            HttpServletResponse res) throws ServletException, IOException {

        String comentario = (String) req.getParameter("comentario");
        String nombreUsuario = (String) req.getParameter("nombreUsuario");
        String nombrePelicula = (String) req.getParameter("nombrePelicula");

        HttpSession session = req.getSession();
        session.removeAttribute("error");
        String nombreSession = (String)session.getAttribute("nombre");
        
        if(bd.IsNullOrWhiteSpace(nombreSession)|| bd.IsNullOrWhiteSpace(comentario) 
                || bd.IsNullOrWhiteSpace(nombreUsuario) || bd.IsNullOrWhiteSpace(nombrePelicula))
        {
            System.out.println("La llamada llega pero vacía: "+nombreSession+" - "+ comentario +
                   " - "+ nombreUsuario +" - "+ nombrePelicula);
        }else{
            bd.insertarComentario(comentario, nombreUsuario, nombrePelicula);
            System.out.println("La llamada llega rellena: "+nombreSession+" - "+ comentario +
                       " - "+ nombreUsuario +" - "+ nombrePelicula);
        }
        
    }

    public void destroy() {
        bd.cerrarConexion();
        super.destroy();
    }
}
