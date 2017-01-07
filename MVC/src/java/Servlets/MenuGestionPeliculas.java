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
        String obj = (String) req.getParameter("obj");

        HttpSession session = req.getSession();
        session.removeAttribute("error");
        String pagina="/MVC/menuGestionPeliculas.jsp";
        if(bd.IsNullOrWhiteSpace(direccion) == false){
            if( direccion.equals("mod"))
            {
                pagina = "/MVC/"+obj+"/Modificar"+obj+".jsp";
            }
            else if(direccion.equals("alta"))
            {
                pagina = "/MVC/"+obj+"/Agregar"+obj+".jsp";
            }
            else if(direccion.equals("bor"))
            {
                pagina = "/MVC/"+obj+"/Borrar"+obj+".jsp";
            }
        }
        
        res.sendRedirect(res.encodeRedirectURL(pagina));
    }

    public void destroy() {
        bd.cerrarConexion();
        super.destroy();
    }
}
