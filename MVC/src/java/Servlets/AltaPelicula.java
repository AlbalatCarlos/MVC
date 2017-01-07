package Servlets;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Jayro
 */
@WebServlet(urlPatterns = {"/AltaPelicula"})
public class AltaPelicula extends HttpServlet {

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

        String nombre = (String) req.getParameter("nombrePelicula");
        String sinopsis = (String) req.getParameter("sinopsis");
        String paginaOficial = (String) req.getParameter("paginaOficial");
        String tituloOriginal = (String) req.getParameter("tituloOriginal");
        String genero = (String) req.getParameter("genero");
        String nacionalidad = (String) req.getParameter("nacionalidad");
        int ano=0;
        
        if(((String)req.getParameter("ano")).length()>0){
        ano=Integer.parseInt(req.getParameter("ano"));
        }
      
        double duracion=0.00;
        
        if(((String)req.getParameter("duracion")).length()>0){
        duracion= Double.parseDouble(req.getParameter("duracion"));
        }
        

        
        String distribuidora = (String) req.getParameter("distribuidora");
        String director = (String) req.getParameter("director");
        String actores = (String) req.getParameter("actores");
        String datos = (String) req.getParameter("datos");
        String edad = (String) req.getParameter("edad");
        System.out.println("AQUUIIIII LLEGAAA LA PELI!!!" + sinopsis);
        
        
        
        HttpSession session = req.getSession();
        session.removeAttribute("error");
        String pagina = "/MVC/Pelicula/ModificarPaliculaAux.jsp";
        String nombreSession = (String)session.getAttribute("nombre");
        
        String rol = bd.dameRolUsuario(nombreSession);
        
        if(bd.IsNullOrWhiteSpace(nombreSession))
        {
            session.setAttribute("error", "No puede dar de alta un usuario si está logado");
            pagina = "/MVC/Usuario/Login.jsp";
        } 
        else if (bd.existeRegistroEnTabla("USUARIO", "nombre", nombre)) 
        {
            if(rol.equals("admin"))
            {
                bd.modificarPelicula(nombre, sinopsis, paginaOficial, tituloOriginal, genero, nacionalidad, duracion, ano, distribuidora,
                    director, actores, datos, edad);
                
            }
        } else {
            if(rol.equals("admin"))
            {
                bd.insertarPelicula(nombre, sinopsis, paginaOficial, tituloOriginal, genero, nacionalidad, duracion, ano, distribuidora,
                    director, actores, datos, edad);
                session.setAttribute("nombrePelicula", nombre);
            }
        }
        res.sendRedirect(res.encodeRedirectURL(pagina));
        
        
        
        

        res.sendRedirect(res.encodeRedirectURL("/MVC/agregarPelicula.jsp"));

    }
}
