package Servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
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
public class BorrarPelicula extends HttpServlet {

    private ModeloDatos bd;

    public void init(ServletConfig cfg) throws ServletException {
        bd = new ModeloDatos();
        bd.abrirConexion();
    }

    public void service(HttpServletRequest req,
            HttpServletResponse res) throws ServletException, IOException {

        String nombre = (String) req.getParameter("nombre");
        
        bd.borrarPelicula(nombre);
        
        
        res.sendRedirect(res.encodeRedirectURL("/MVC/MenuGestionPeliculas"));
    }
    
    public void destroy() {
        bd.cerrarConexion();
        super.destroy();
    }

}
