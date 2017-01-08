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
public class AltaEntrada extends HttpServlet {

     private ModeloDatos bd;

    public void init(ServletConfig cfg) throws ServletException {
        bd = new ModeloDatos();
        bd.abrirConexion();
    }

    @SuppressWarnings("empty-statement")
    public void service(HttpServletRequest req,
            HttpServletResponse res) throws ServletException, IOException {

        String fila = (String) req.getParameter("fila");
        String columna = (String) req.getParameter("columna");
        String referencia = (String) req.getParameter("referencia");
        
        String idReproduccion= "";
        
        if(((String)req.getParameter("idReproduccion")).length()>0){
            idReproduccion= req.getParameter("idReproduccion");
        }
        

        HttpSession session = req.getSession();
        session.removeAttribute("error");
        String pagina = "/MVC/Entrada/ModificarEntradaAux.jsp";
        String nombreSession = (String)session.getAttribute("nombre");
        
        String rol = bd.dameRolUsuario(nombreSession);
        
        if(bd.IsNullOrWhiteSpace(nombreSession))
        {
            session.setAttribute("error", "No puede comprar una entrada si no está logado");
            pagina = "/MVC/Usuario/Login.jsp";
        } 
        else if (bd.existeEntrada(referencia)) 
        {
            bd.actualizarEntrada(idReproduccion,nombreSession,fila,columna,referencia);
            session.setAttribute("idReproduccion", idReproduccion); 
        } 
        else {
            
            bd.insertarEntrada(idReproduccion,nombreSession,fila,columna,referencia);
            session.setAttribute("idReproduccion", idReproduccion);
        }
        
        res.sendRedirect(res.encodeRedirectURL(pagina));
    }

   public void destroy() {
        bd.cerrarConexion();
        super.destroy();
    }
}