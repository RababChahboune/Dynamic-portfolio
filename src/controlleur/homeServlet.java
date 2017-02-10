package controlleur;

import dataAccess.AdministrateurDA;
import dataAccess.Categorie_projetDA;
import dataAccess.courrierDA;
import model.Administrateur;
import utility.Check;
import utility.verifySession;

import javax.servlet.ServletException;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.SQLException;

/**
 * Created by Reda BENCHRAA on 11/12/2016.
 */
public class homeServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html; charset=UTF-8");

        try {
            if(!verifySession.check(request,response)){
                response.sendRedirect("admin/index");
            }
            Administrateur administrateur = AdministrateurDA.getAdministrateur();
            request.setAttribute("administrateur",administrateur);
            request.setAttribute("portfolio",administrateur.getProfile());
            request.setAttribute("categorie", Categorie_projetDA.getCategorie_projetList());
            request.setAttribute("courrier", courrierDA.getCourrierList());
            request.getRequestDispatcher("admin/home.jsp").include(request,response);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
