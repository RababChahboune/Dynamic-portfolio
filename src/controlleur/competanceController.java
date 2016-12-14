package controlleur;

import dataAccess.CompetanceDA;
import dataAccess.ProfileDA;
import model.Competance;
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
@WebServlet(name = "competanceController")
public class competanceController extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = Check.checkInput(request.getParameter("action"));
        String nomCompetance = Check.checkInput(request.getParameter("nomCompetance"));
        int pourcentageCompetance = Integer.parseInt(Check.checkInput(request.getParameter("pourcentageCompetance")));
        int idProfile = Integer.parseInt(Check.checkInput(request.getParameter("idProfile")));
        Competance c;
        try {
            Profile p = ProfileDA.findProfile(idProfile);
            if(action.equals("ajouterCompetance")){
                c = new Competance();
                c.setNomCompetance(nomCompetance);
                c.setPourcentageCompetance(pourcentageCompetance);
                CompetanceDA.insertCompetance(c,p);
            }
            else if(action.equals("modifierCompetance")){
                int idCompetance = Integer.parseInt(Check.checkInput(request.getParameter("idCompetance")));
                c = CompetanceDA.findCompetance(idCompetance);
                c.setNomCompetance(nomCompetance);
                c.setPourcentageCompetance(pourcentageCompetance);
                CompetanceDA.updateCompetance(c,p);
            }
            else if(action.equals("supprimerCompetance")){
                int idCompetance = Integer.parseInt(Check.checkInput(request.getParameter("idCompetance")));
                c = CompetanceDA.findCompetance(idCompetance);
                CompetanceDA.deleteCompetance(c);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        request.getRequestDispatcher("home.jsp").forward(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}