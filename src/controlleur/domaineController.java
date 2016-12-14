package controlleur;

import dataAccess.domaineDA;
import model.Domaine;
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
@WebServlet(name = "domaineController")
public class domaineController extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String action = Check.checkInput(request.getParameter("action"));
        String nomDomaine = Check.checkInput(request.getParameter("nomDomaine"));
        String descriptionDomaine = Check.checkInput(request.getParameter("descriptionDomaine"));
        Domaine d;
        if(action.equals("ajouterDomaine")){
            try {
                String imageDomaine = Check.checkInput(request.getParameter("imageDomaine"));
                d = new Domaine();
                d.setNomDomaine(nomDomaine);
                d.setDescriptionDomaine(descriptionDomaine);
                d.setImageDomaine(imageDomaine);
                domaineDA.insertDomaine(d);

            } catch (SQLException e) {
                e.printStackTrace();
            }

        }
        else if(action.equals("modifierDomaine")){
            try {
                int idDomaine = Integer.parseInt(Check.checkInput(request.getParameter("idDomaine")));
                String imageDomaine = request.getParameter("imageDomaine");
                d = domaineDA.findDomaine(idDomaine);
                if(imageDomaine==null){
                    imageDomaine = d.getImageDomaine();
                }
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
                int idDomaine = Integer.parseInt(Check.checkInput(request.getParameter("idDomaine")));
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
