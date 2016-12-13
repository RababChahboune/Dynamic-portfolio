package controlleur;

import dataAccess.domaineDA;
import model.Domaine;

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
@WebServlet(name = "domaineController")
public class domaineController extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String action = request.getParameter("action");
        String nomDomaine = request.getParameter("nomDomaine");
        String descriptionDomaine = request.getParameter("descriptionDomaine");
        String imageDomaine = request.getParameter("imageDomaine");
        Domaine d;
        if(action.equals("ajouterDomaine")){
            d = new Domaine();
            d.setNomDomaine(nomDomaine);
            d.setDescriptionDomaine(descriptionDomaine);
            d.setImageDomaine(imageDomaine);

            try {
                domaineDA.insertDomaine(d);

            } catch (SQLException e) {
                e.printStackTrace();
            }

        }
        else if(action.equals("modifierDomaine")){
            int idDomaine = Integer.parseInt(request.getParameter("idDomaine"));
            try {
                d = domaineDA.findDomaine(idDomaine);
                d.setNomDomaine(nomDomaine);
                d.setDescriptionDomaine(descriptionDomaine);
                d.setImageDomaine(imageDomaine);
                domaineDA.updateDomaine(d);
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        else if(action.equals("supprimerDomaine")){

            try {
                int idDomaine = Integer.parseInt(request.getParameter("idDomaine"));
                d = domaineDA.findDomaine(idDomaine);
                domaineDA.deleteDomaine(d);
            } catch (SQLException e) {
                e.printStackTrace();
            }

        }
                

        request.getRequestDispatcher("home.jsp").forward(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
