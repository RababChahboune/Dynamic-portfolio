package controlleur;

import dataAccess.Categorie_projetDA;
import model.Categorie_projet;
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
@WebServlet(name = "catProjectController")
public class catProjectController extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = Check.checkInput(request.getParameter("action"));
        String nomProjetCategorie = Check.checkInput(request.getParameter("nomProjetCategorie"));
        String descriptionProjetCategorie = Check.checkInput(request.getParameter("descriptionProjetCategorie"));
        String imageProjetCategorie = Check.checkInput(request.getParameter("imageProjetCategorie"));
        Categorie_projet cp;
        PrintWriter out = response.getWriter();
        if(action.equals("ajouterCategorieProjet")){
            cp = new Categorie_projet();
            cp.setNomProjetCategorie(nomProjetCategorie);
            cp.setDescriptionProjetCategorie(descriptionProjetCategorie);
            cp.setImageProjetCategorie(imageProjetCategorie);

            try {
                Categorie_projetDA.insertCategorie_projet(cp);

            } catch (SQLException e) {
                e.printStackTrace();
            }

        }
        else if(action.equals("modifierCategorieProjet")){
            int idProjetCategorie = Integer.parseInt(Check.checkInput(request.getParameter("idProjetCategorie")));
            try {
                cp = Categorie_projetDA.findCategorie_projet("idProjetCategorie",idProjetCategorie);
                cp.setNomProjetCategorie(nomProjetCategorie);
                cp.setDescriptionProjetCategorie(descriptionProjetCategorie);
                cp.setImageProjetCategorie(imageProjetCategorie);
                Categorie_projetDA.updateCategorie_projet(cp);
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        else if(action.equals("supprimerCategorieProjet")){

            try {
                int idProjetCategorie = Integer.parseInt(Check.checkInput(request.getParameter("idProjetCategorie")));
                cp = Categorie_projetDA.findCategorie_projet("idProjetCategorie",idProjetCategorie);
                Categorie_projetDA.deleteCategorie_projet(cp);
            } catch (SQLException e) {
                e.printStackTrace();
            }

        }
        request.getRequestDispatcher("home.jsp").forward(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
