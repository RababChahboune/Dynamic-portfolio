package controlleur;

import dataAccess.ProfileDA;
import dataAccess.lienDA;
import model.Lien;
import model.Profile;
import utility.Check;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

/**
 * Created by Rabab Chahboune on 12/13/2016.
 */
@WebServlet(name = "lienController")
public class lienController extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = Check.checkInput(request.getParameter("action"));
        String nomLien = Check.checkInput(request.getParameter("nomLien"));
        String urlLien = Check.checkInput(request.getParameter("urlLien"));
        int idProfile = Integer.parseInt(Check.checkInput(request.getParameter("idProfile")));

        Lien l;
        try {
            Profile p = ProfileDA.findProfile(idProfile);
            if(action.equals("ajouterLien")){
                String imageLien = Check.checkInput(request.getParameter("imageLien"));
                l = new Lien();
                l.setNomLien(nomLien);
                l.setUrlLien(urlLien);
                l.setImageLien(imageLien);
                lienDA.insertLien(l,p);

            }
            else if(action.equals("modifierLien")){
                int idLien = Integer.parseInt(Check.checkInput(request.getParameter("idLien")));
                String imageLien = request.getParameter("imageLien");
                l = lienDA.findLien(idLien);
                if(imageLien==null){
                    imageLien = l.getImageLien();
                }
                l.setNomLien(nomLien);
                l.setUrlLien(urlLien);
                l.setImageLien(imageLien);
                lienDA.updateLien(l,p);

            }else if(action.equals("supprimerLien")){
                int idLien = Integer.parseInt(Check.checkInput(request.getParameter("idLien")));
                l = lienDA.findLien(idLien);
                lienDA.deleteLien(l);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        request.getRequestDispatcher("home.jsp").forward(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
