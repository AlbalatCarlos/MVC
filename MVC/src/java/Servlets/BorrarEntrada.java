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
import javax.servlet.http.HttpSession;

/**
 *
 * @author Jayro
 */
public class BorrarEntrada extends HttpServlet {

    private ModeloDatos bd;

    public void init(ServletConfig cfg) throws ServletException {
        bd = new ModeloDatos();
        bd.abrirConexion();
    }

    public void service(HttpServletRequest req,
            HttpServletResponse res) throws ServletException, IOException {

        String referencia = (String) req.getParameter("referencia");
        
        HttpSession session = req.getSession();
        String nombreSession = (String)session.getAttribute("nombre");
        
        String rol = bd.dameRolUsuario(nombreSession);
        if(rol.equals("admin"))
            bd.borrarEntrada(referencia);
        
        
        res.sendRedirect(res.encodeRedirectURL("/MVC/MenuEntradas"));
    }
    
    public void destroy() {
        bd.cerrarConexion();
        super.destroy();
    }

}
