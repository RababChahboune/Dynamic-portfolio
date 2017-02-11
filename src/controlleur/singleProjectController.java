package controlleur;

import dataAccess.AdministrateurDA;
import dataAccess.Categorie_projetDA;
import dataAccess.ProjetDA;
import model.Administrateur;
import model.Categorie_projet;
import model.Projet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 * Created by Rabab Chahboune on 2/11/2017.
 */
@WebServlet(name = "singleProjectController")
public class singleProjectController extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html; charset=UTF-8");
        Administrateur administrateur = null;
       Projet projet = null;

        try{
            administrateur = AdministrateurDA.getAdministrateur();
            projet = ProjetDA.findProjet(Integer.parseInt(request.getParameter("id")));
            request.setAttribute("administrateur", administrateur);
            request.setAttribute("projet",projet);
            request.getRequestDispatcher(administrateur.getPortfolio().getTheme().getNomTheme()+"/single-project.jsp").forward(request,response);

        }catch (SQLException e){
            System.out.println(e);
        }
    }
}
