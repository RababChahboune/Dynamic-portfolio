package controlleur;

import dataAccess.experienceDA;
import model.Experience;
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
@WebServlet(name = "experienceController")
public class experienceController extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = Check.checkInput(request.getParameter("action"));
        String nomExperience = Check.checkInput(request.getParameter("nomExperience"));
        String logoExperience = Check.checkInput(request.getParameter("logoExperience"));
        Experience d;
        if(action.equals("ajouterExperience")){
            d = new Experience();
            d.setNomExperience(nomExperience);
            d.setLogoExperience(logoExperience);

            try {
                experienceDA.insertExperience(d);

            } catch (SQLException e) {
                e.printStackTrace();
            }

        }
        else if(action.equals("modifierExperience")){
           try {
               int idExperience = Integer.parseInt(Check.checkInput(request.getParameter("idExperience")));
                d = experienceDA.findExperience(idExperience);
                d.setNomExperience(nomExperience);
                d.setLogoExperience(logoExperience);
                experienceDA.updateExperience(d);
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        else if(action.equals("supprimerExperience")){

            try {
                int idExperience = Integer.parseInt(Check.checkInput(request.getParameter("idExperience")));
                d = experienceDA.findExperience(idExperience);
                experienceDA.deleteExperience(d);
            } catch (SQLException e) {
                e.printStackTrace();
            }

        }
        request.getRequestDispatcher("home.jsp").forward(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
