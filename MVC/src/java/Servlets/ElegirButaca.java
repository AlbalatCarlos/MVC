/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author CARLOS
 */
public class ElegirButaca extends HttpServlet {

    public void service(HttpServletRequest req,
            HttpServletResponse res) throws ServletException, IOException {
        
        ModeloDatos bd = new ModeloDatos();
        bd.abrirConexion();
        HttpSession session = req.getSession();
        
        String idReproduccion = (String) req.getParameter("idReproduccion");
        String referencia = (String) req.getParameter("referencia");
        String pagina = "";
        
        if(bd.IsNullOrWhiteSpace(idReproduccion) == false)
        {
            session.setAttribute("idReproduccion", idReproduccion);
            pagina="/MVC/Entrada/AgregarEntradaAux.jsp";
        }
        
        if(bd.IsNullOrWhiteSpace(referencia) == false)
        {
            int id = bd.dameEntrada(referencia).idReproduccion;
            session.setAttribute("referencia", referencia);
            session.setAttribute("idReproduccion", ""+id+"");
            pagina = "/MVC/Entrada/ModificarEntradaAux.jsp" ;
        }
        bd.cerrarConexion();
        res.sendRedirect(res.encodeRedirectURL(pagina));
    }
}