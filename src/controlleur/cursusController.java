package controlleur;

import dataAccess.cursusDA;
import dataAccess.ProfileDA;
import model.Cursus;
import model.Profile;
import utility.Check;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

/**
 * Created by Rabab Chahboune on 12/13/2016.
 */
@WebServlet(name = "cursusController")
public class cursusController extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = Check.checkInput(request.getParameter("actionCursus"));
        String nomCursus = Check.checkInput(request.getParameter("nomCursus"));
        String anneeDebutCursus = Check.checkInput(request.getParameter("anneeDebutCursus"));
        String anneeFinCursus = Check.checkInput(request.getParameter("anneeFinCursus"));
        String etablissementCursus = Check.checkInput(request.getParameter("etablissementCursus"));
        String remarqueCursus = Check.checkInput(request.getParameter("remarqueCursus"));
        int idProfile = Integer.parseInt(Check.checkInput(request.getParameter("idProfile")));
        Cursus c;
        try {
            Profile p = ProfileDA.findProfile(idProfile);
            if(action.equals("ajouterCursus")){
                c = new Cursus();
                c.setNomCursus(nomCursus);
                c.setAnnee_debutCursus(anneeDebutCursus);
                c.setAnnee_finCursus(anneeFinCursus);
                c.setEtablissementCursus(etablissementCursus);
                c.setRemarqueCursus(remarqueCursus);
                cursusDA.insertCursus(c,p);
            }
            else if(action.equals("modifierCursus")){
                int idCursus = Integer.parseInt(Check.checkInput(request.getParameter("idCursus")));
                c = cursusDA.findCursus(idCursus);
                c.setNomCursus(nomCursus);
                c.setAnnee_debutCursus(anneeDebutCursus);
                c.setAnnee_finCursus(anneeFinCursus);
                c.setEtablissementCursus(etablissementCursus);
                c.setRemarqueCursus(remarqueCursus);
                cursusDA.updateCursus(c,p);
            }
            else if(action.equals("supprimerCursus")){
                int idCursus = Integer.parseInt(Check.checkInput(request.getParameter("idCursus")));
                c = cursusDA.findCursus(idCursus);
                cursusDA.deleteCursus(c);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
