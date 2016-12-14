package controlleur;

import dataAccess.ProfileDA;
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
@WebServlet(name = "profileController")
public class profileController extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String action = Check.checkInput(request.getParameter("action"));
        String nomProfile = Check.checkInput(request.getParameter("nomProfile"));
        String prenomProfile = Check.checkInput(request.getParameter("prenomProfile"));
        String emailProfile = Check.checkInput(request.getParameter("emailProfile"));
        String telephoneProfile = Check.checkInput(request.getParameter("telephoneProfile"));
        String biographieProfile= Check.checkInput(request.getParameter("biographieProfile"));

        Profile p ;
        if(action.equals("ajouterProfile")){
            try {
                p = new Profile();
                //sitting the picture for the 1st time
                String imageProfile= Check.checkInput(request.getParameter("imageProfile"));
                p.setNomProfile(nomProfile);
                p.setPrenomProfile(prenomProfile);
                p.setEmailProfile(emailProfile);
                p.setTelephoneProfile(telephoneProfile);
                p.setImageProfile(imageProfile);
                p.setBiographieProfile(biographieProfile);
                ProfileDA.insertProfile(p);
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        else if(action.equals("modifierProfile")){
            try {
                int idProfile = Integer.parseInt(request.getParameter("idProfile"));
                String imageProfile= request.getParameter("imageProfile");
                p = ProfileDA.findProfile(idProfile);
                if(imageProfile==null){
                    imageProfile = p.getImageProfile();
                }
                p.setNomProfile(nomProfile);
                p.setPrenomProfile(prenomProfile);
                p.setEmailProfile(emailProfile);
                p.setTelephoneProfile(telephoneProfile);
                p.setImageProfile(imageProfile);
                p.setBiographieProfile(biographieProfile);
                ProfileDA.updateProfile(p);
            } catch (SQLException e) {
                e.printStackTrace();
            }

        }
        else if(action.equals("supprimerProfile")){
            try {
                int idProfile = Integer.parseInt(request.getParameter("idProfile"));
                p = ProfileDA.findProfile(idProfile);
                ProfileDA.deleteProfile(p);
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        request.getRequestDispatcher("home.jsp").forward(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
