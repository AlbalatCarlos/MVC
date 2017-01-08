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
public class MenuEntradas extends HttpServlet {

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
        String pagina="/MVC/Entrada/MenuEntradas.jsp";
        if(bd.IsNullOrWhiteSpace(direccion) == false){
            if( direccion.equals("mod"))
            {
                pagina = "/MVC/Entrada/ModificarEntrada.jsp";
            }
            else if(direccion.equals("alta"))
            {
                pagina = "/MVC/Entrada/AgregarEntrada.jsp";
            }
            else if(direccion.equals("bor"))
            {
                pagina = "/MVC/Entrada/BorrarEntrada.jsp";
            }
        }
        
        res.sendRedirect(res.encodeRedirectURL(pagina));
    }

    public void destroy() {
        bd.cerrarConexion();
        super.destroy();
    }
}
