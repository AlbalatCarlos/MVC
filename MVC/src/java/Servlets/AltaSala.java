package Servlets;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
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

public class AltaSala extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    private ModeloDatos bd;

    public void init(ServletConfig cfg) throws ServletException {
        bd = new ModeloDatos();
        bd.abrirConexion();
    }

    @SuppressWarnings("empty-statement")
    public void service(HttpServletRequest req,
            HttpServletResponse res) throws ServletException, IOException {

        String nombre = (String) req.getParameter("nombre");
        String filasAux = (String) req.getParameter("filas");
        String columnasAux = (String) req.getParameter("columnas");
        
        int filas=0,columnas=0;
        
        if(filasAux.length()>0){
            filas=Integer.parseInt(filasAux);
        }
      
        if(columnasAux.length()>0){
            columnas= Integer.parseInt(columnasAux);
        }
        
        HttpSession session = req.getSession();
        session.removeAttribute("error");
        String pagina = "/MVC/Sala/ModificarSalaAux.jsp";
        String nombreSession = (String)session.getAttribute("nombre");
        
        String rol = bd.dameRolUsuario(nombreSession);
        
        if(bd.IsNullOrWhiteSpace(nombreSession))
        {
            session.setAttribute("error", "No puede dar de alta una sala si no está logado");
            pagina = "/MVC/Usuario/Login.jsp";
        } 
        else if (bd.existeRegistroEnTabla("SALA", "nombre", nombre)) 
        {
            if(rol.equals("admin"))
            {
                bd.actualizarSala(nombre, filas, columnas);
                session.setAttribute("nombreSala", nombre);
            }
            else
            {
                session.setAttribute("error", "No puede modificar una sala si no es administrador");
                pagina = "/MVC/Usuario/Login.jsp";
            }
        } else {
            if(rol.equals("admin"))
            {
                bd.insertarSala(nombre, filas, columnas);
                session.setAttribute("nombreSala", nombre);
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