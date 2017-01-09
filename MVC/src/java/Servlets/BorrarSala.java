/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import java.io.IOException;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author CARLOS
 */
public class BorrarSala extends HttpServlet {

    private ModeloDatos bd;

    public void init(ServletConfig cfg) throws ServletException {
        bd = new ModeloDatos();
        bd.abrirConexion();
    }

    public void service(HttpServletRequest req,
            HttpServletResponse res) throws ServletException, IOException {

        String nombre = (String) req.getParameter("nombre");
        
        HttpSession session = req.getSession();
        String nombreSession = (String) session.getAttribute("nombre");
        
        String pagina = "/MVC/MenuGestionPeliculas";
        
        try {
            if(bd.IsNullOrWhiteSpace(nombreSession))
            {
                session.setAttribute("error", "No puede dar de baja una sala sin logearse");
                pagina = "/MVC/Usuario/Login.jsp";
            } 
            else if(bd.dameRolUsuario(nombreSession).equals("admin"))
            {
                if (bd.existeRegistroEnTabla("SALA", "nombre", nombre)) 
                {
                    bd.borrarSala(nombre);
                } 
                  
            }
            else
            {
                session.setAttribute("error", "No puede dar de baja una sala con este usuario");
                pagina = "/MVC/Usuario/Login.jsp";
            }
            
        } catch (Exception e) {
            
        }
        
        res.sendRedirect(res.encodeRedirectURL(pagina));
    }
    
    public void destroy() {
        bd.cerrarConexion();
        super.destroy();
    }

}
