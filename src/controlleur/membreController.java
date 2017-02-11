package controlleur;

import dataAccess.AdministrateurDA;
import dataAccess.Categorie_projetDA;
import dataAccess.ProfileDA;
import model.Administrateur;
import model.Categorie_projet;
import model.Profile;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import static com.sun.corba.se.impl.util.Utility.printStackTrace;

/**
 * Created by Rabab Chahboune on 2/11/2017.
 */
@WebServlet(name = "membreController")
public class membreController extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Profile p = null;
        Administrateur administrateur = null;

        try{
            administrateur = AdministrateurDA.getAdministrateur();
            p  = ProfileDA.findProfile(Integer.parseInt(request.getParameter("idProfile")));
            request.setAttribute("administrateur",administrateur);
            request.setAttribute("profile",p);
            request.getRequestDispatcher(administrateur.getPortfolio().getTheme().getNomTheme()+"/profile.jsp").forward(request,response);
        }catch (SQLException e){
            printStackTrace();
        }

    }
}
