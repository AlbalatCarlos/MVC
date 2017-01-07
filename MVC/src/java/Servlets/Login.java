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
public class Login extends HttpServlet {

    private ModeloDatos bd;

    public void init(ServletConfig cfg) throws ServletException {
        bd = new ModeloDatos();
        bd.abrirConexion();
    }

    public void service(HttpServletRequest req,
            HttpServletResponse res) throws ServletException, IOException {

        String nombre = (String) req.getParameter("nombre");
        String pass = (String) req.getParameter("pass");

        HttpSession session = req.getSession();
        session.removeAttribute("error");
        String pagina="";
        if (bd.Logearse(nombre, pass)) {
            session.setAttribute("nombre", nombre);
            if(bd.dameRolUsuario(nombre).equals("admin"))
                pagina = "/MVC/menuGestionPeliculas.jsp";
            else
                pagina = "/MVC/Usuario/ModificarUsuario.jsp";
            
            
        } 
        else
        {
            pagina = "/MVC/Usuario/Login.jsp";
            session.setAttribute("error", "El nombre o la contraseña son incorrectos");
        }
        
        res.sendRedirect(res.encodeRedirectURL(pagina));
        
    }

    public void destroy() {
        bd.cerrarConexion();
        super.destroy();
    }
}
