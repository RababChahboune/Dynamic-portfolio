package controlleur;

import dataAccess.AdministrateurDA;
import dataAccess.Categorie_projetDA;
import model.Administrateur;
import model.Categorie_projet;
import model.Portfolio;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 * Created by Rabab Chahboune on 2/10/2017.
 */
@WebServlet(name = "indexController")
public class indexController extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html; charset=UTF-8");
        Administrateur administrateur = null;
        ArrayList<Categorie_projet> cps = null;

        try{
            administrateur = AdministrateurDA.getAdministrateur();
            cps = Categorie_projetDA.getCategorie_projetList();

            request.setAttribute("administrateur", administrateur);
            request.setAttribute("cps",cps);
            request.getRequestDispatcher(administrateur.getPortfolio().getTheme().getNomTheme()+"/").forward(request,response);

        }catch (SQLException e){
            System.out.println(e);
        }
    }
}
