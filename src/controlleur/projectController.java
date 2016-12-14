package controlleur;

import dataAccess.Categorie_projetDA;
import dataAccess.ProjetDA;
import model.Categorie_projet;
import model.Projet;
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
 * Created by Rabab Chahboune on 12/12/2016.
 */
@WebServlet(name = "projectController")
public class projectController extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        Projet p;

        String action = Check.checkInput(request.getParameter("action"));
        String nomProjet = Check.checkInput(request.getParameter("nomProjet"));
        String descriptionProjet = Check.checkInput(request.getParameter("descriptionProjet"));
        String projetProjet = Check.checkInput(request.getParameter("projetProjet"));
        String imageProjet = Check.checkInput(request.getParameter("imageProjet"));
        String etoileProjet = Check.checkInput(request.getParameter("etoileProjet"));
        int idProjetCategorie = Integer.parseInt(Check.checkInput(request.getParameter("idProjetCategorie")));


        try {
            Categorie_projet categorie_projet = Categorie_projetDA.findCategorie_projet("idProjetCategorie",idProjetCategorie);
            if(action.equals("ajouterProjet")){
                p = new Projet();
                p.setNomProjet(nomProjet);
                p.setDescriptionProjet(descriptionProjet);
                p.setProjetProjet(projetProjet);
                p.setImageProjet(imageProjet);
                p.setCategorie_projet(categorie_projet);
                p.setEtoileProjet(Boolean.parseBoolean(etoileProjet));
                ProjetDA.insertProjet(p);
            }
            else if(action.equals("modifierProjet")){
                int idProjet = Integer.parseInt(Check.checkInput(request.getParameter("idProjet")));
                p = ProjetDA.findProjet(idProjet);
                p.setNomProjet(nomProjet);
                p.setDescriptionProjet(descriptionProjet);
                p.setProjetProjet(projetProjet);
                p.setImageProjet(imageProjet);
                p.setCategorie_projet(categorie_projet);
                p.setEtoileProjet(Boolean.parseBoolean(etoileProjet));
                ProjetDA.updateProjet(p);
            }
            else if(action.equals("supprimerProjet")){
                int idProjet = Integer.parseInt(Check.checkInput(request.getParameter("idProjet")));
                p = ProjetDA.findProjet(idProjet);
                ProjetDA.deleteProjet(p);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        request.getRequestDispatcher("home.jsp").forward(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
