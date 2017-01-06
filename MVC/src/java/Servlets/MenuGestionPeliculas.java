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
public class MenuGestionPeliculas extends HttpServlet {

    private ModeloDatos bd;

    public void init(ServletConfig cfg) throws ServletException {
        bd = new ModeloDatos();
        bd.abrirConexion();
    }

    public void service(HttpServletRequest req,
            HttpServletResponse res) throws ServletException, IOException {

        String direccion = (String) req.getParameter("dir");

        HttpSession session = req.getSession();
        session.removeAttribute("error");
        String pagina="/MVC/Usuario/Login.jsp";
        
        if( direccion.equals("mod"))
        {
            pagina = "/MVC/Pelicula/modificarPelicula.jsp";
        }
        else if(direccion.equals("alta"))
        {
            pagina = "/MVC/Pelicula/agregarPelicula.jsp";
        }
        else if(direccion.equals("bor"))
        {
            pagina = "/MVC/Pelicula/borrarPelicula.jsp";
        }
        
       
         
        System.out.println("direccion");
        
        res.sendRedirect(res.encodeRedirectURL(pagina));
        
    }

    public void destroy() {
        bd.cerrarConexion();
        super.destroy();
    }
}
