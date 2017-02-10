package controlleur;

import com.geekonjava.fileupload.FileUploading;
import dataAccess.AdministrateurDA;
import dataAccess.Categorie_projetDA;
import dataAccess.ProfileDA;
import dataAccess.courrierDA;
import model.Administrateur;
import model.Domaine;
import model.Profile;
import utility.Check;
import utility.verifySession;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;

/**
 * Created by Rabab Chahboune on 12/13/2016.
 */
@WebServlet(name = "profileController")
public class profileController extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ServletContext context = this.getServletContext();
        PrintWriter out = response.getWriter();
        String imagepath = this.getServletContext().getRealPath("/") + "/lib/dist/img/profile/";
        ArrayList<String> imagename = new ArrayList<String>();
        imagename.add("imageProfile");
        ArrayList<String> dataname = new ArrayList<String>();
        dataname.add("action");
        dataname.add("idProfile");
        dataname.add("nomProfile");
        dataname.add("prenomProfile");
        dataname.add("emailProfile");
        dataname.add("telephoneProfile");
        dataname.add("biographieProfile");
        HashMap map = FileUploading.UploadFile(imagepath, dataname, imagename, request);
        Profile p ;
        if(map.get("action").toString().equals("ajouterProfile")){
            try {
                p = new Profile();
                String imageProfile = "0";
                if(!map.get("imageProfile").toString().equals(""))
                    imageProfile=map.get("imageProfile").toString();
                p.setNomProfile(Check.checkInput(map.get("nomProfile").toString()));
                p.setPrenomProfile(Check.checkInput(map.get("prenomProfile").toString()));
                p.setEmailProfile(Check.checkInput(map.get("emailProfile").toString()));
                p.setTelephoneProfile(Check.checkInput(map.get("telephoneProfile").toString()));
                p.setImageProfile(imageProfile);
                p.setBiographieProfile(Check.checkInput(map.get("biographieProfile").toString()));
                ProfileDA.insertProfile(p);
                response.sendRedirect("homeServlet");
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        else if(map.get("action").toString().equals("modifierProfile")){
            try {
                int idProfile = Integer.parseInt(Check.checkInput(map.get("idProfile").toString()));
                p = ProfileDA.findProfile(idProfile);
                String imageProfile;
                imageProfile = p.getImageProfile();
                if(!map.get("imageProfile").toString().equals(""))
                    imageProfile=map.get("imageProfile").toString();
                p.setNomProfile(Check.checkInput(map.get("nomProfile").toString()));
                p.setPrenomProfile(Check.checkInput(map.get("prenomProfile").toString()));
                p.setEmailProfile(Check.checkInput(map.get("emailProfile").toString()));
                p.setTelephoneProfile(Check.checkInput(map.get("telephoneProfile").toString()));
                p.setImageProfile(imageProfile);
                p.setBiographieProfile(Check.checkInput(map.get("biographieProfile").toString()));
                ProfileDA.updateProfile(p);
                out.print("Chagement avec succes Success");
            } catch (SQLException e) {
                out.print("Error : "+e.getMessage());
                e.printStackTrace();
            }
        }
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html; charset=UTF-8");
        try {
            if(!verifySession.check(request,response)){
                response.sendRedirect("admin/index");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        Administrateur administrateur = null;
        try {
            administrateur = AdministrateurDA.getAdministrateur();
            request.setAttribute("administrateur", administrateur);
            request.setAttribute("categorie", Categorie_projetDA.getCategorie_projetList());
            request.setAttribute("portfolio", administrateur.getProfile());
            request.setAttribute("courrier", courrierDA.getCourrierList());
        } catch (SQLException e) {
            e.printStackTrace();
        }
        if(request.getParameter("action") !=null) {
            if (request.getParameter("action").equals("supprimerProfile")) {
                try {
                    int idProfile = Integer.parseInt(request.getParameter("idProfile"));
                    Profile p = ProfileDA.findProfile(idProfile);
                    ProfileDA.deleteProfile(p);
                    response.sendRedirect("homeServlet");
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            if (request.getParameter("action").equals("ajouterProfile")) {
                request.getRequestDispatcher("admin/ajouterProfile.jsp").forward(request, response);
            }
        }else {
            Profile profile = new Profile(0);
            try {
                profile = ProfileDA.findProfile(Integer.parseInt(request.getParameter("id")));
            } catch (SQLException e) {
                e.printStackTrace();
            }
            request.setAttribute("profile", profile);
            request.getRequestDispatcher("admin/profile.jsp?id?" + request.getAttribute("id")).forward(request, response);
        }
    }
}
