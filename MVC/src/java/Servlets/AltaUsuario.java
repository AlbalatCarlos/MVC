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
public class AltaUsuario extends HttpServlet {

    private ModeloDatos bd;

    public void init(ServletConfig cfg) throws ServletException {
        bd = new ModeloDatos();
        bd.abrirConexion();
    }

    public void service(HttpServletRequest req,
            HttpServletResponse res) throws ServletException, IOException {

        String nombre = (String) req.getParameter("nombre");
        String apellidos = (String) req.getParameter("apellidos");
        String pass = (String) req.getParameter("pass");
        String rol = (String) req.getParameter("rol");

        //if (validarGanancia(gananciaKW) == true) {
        if (bd.existeRegistroEnTabla("USUARIO", "nombre", nombre)) {
            bd.actualizarUsuario(nombre, apellidos, pass, rol);
        } else {
            bd.insertarUsuario(nombre, apellidos, pass, rol);
        }
        //}

        HttpSession session = req.getSession();
        session.setAttribute("nombre", nombre);
        res.sendRedirect(res.encodeRedirectURL("/MVC/Usuario/ModificarUsuario.jsp"));

    }

    public void destroy() {
        bd.cerrarConexion();
        super.destroy();
    }

    private boolean validarGanancia(String gananciaKW) {
        try {
            int ganancia = Integer.parseInt(gananciaKW);
            //validamos que la ganancia de KW sea un valor entre 10 y 4
            if (ganancia > 10 || ganancia < 4) {
                return false;
            }

            return true;
        } catch (Exception e) {
            System.out.println("La ganancia no es un numero: " + gananciaKW);
            return false;
        }
    }
}
