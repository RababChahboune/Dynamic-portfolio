package controlleur;

import com.geekonjava.fileupload.FileUploading;
import dataAccess.AdministrateurDA;
import dataAccess.Categorie_projetDA;
import dataAccess.courrierDA;
import dataAccess.experienceDA;
import model.Administrateur;
import model.Domaine;
import model.Experience;
import model.Experience;
import utility.Check;
import utility.verifySession;

import javax.servlet.ServletConfig;
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
 * Created by Rabab Chahboune on 12/12/2016.
 */
public class experienceController extends HttpServlet{
    public void init(ServletConfig config) throws ServletException {
        super.init(config);
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ServletContext context = this.getServletContext();
        Experience d;
        String imagepath = this.getServletContext().getRealPath("/") + "/lib/dist/img/partenaire/";
        ArrayList<String> imagename = new ArrayList<String>();
        imagename.add("logoExperience");
        ArrayList<String> dataname = new ArrayList<String>();
        dataname.add("nomExperience");
        dataname.add("idExperience");
        dataname.add("action");
        HashMap map = FileUploading.UploadFile(imagepath, dataname, imagename, request);
        if(map.get("action").toString().equals("ajouterExperience")){
            String logoExperience = Check.checkInput(map.get("logoExperience").toString());
            d = new Experience("","");
            d.setNomExperience(map.get("nomExperience").toString());
            d.setLogoExperience(logoExperience);
            try {
                experienceDA.insertExperience(d);
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        else if(map.get("action").toString().equals("modifierExperience")){
           try {
               int idExperience = Integer.parseInt(map.get("idExperience").toString());
               String logoExperience;
               d = experienceDA.findExperience(idExperience);
               if(map.get("logoExperience").toString().equals("")){
                   logoExperience = d.getLogoExperience();
               }else{
                   logoExperience = map.get("logoExperience").toString();
               }
                d.setNomExperience(map.get("nomExperience").toString());
                d.setLogoExperience(logoExperience);
                experienceDA.updateExperience(d);
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        response.sendRedirect("homeServlet");

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
        Experience partenaire = new Experience("","");
        Administrateur administrateur = null;
        try {
            administrateur = AdministrateurDA.getAdministrateur();
            request.setAttribute("administrateur",administrateur);
            request.setAttribute("portfolio",administrateur.getProfile());
            request.setAttribute("categorie", Categorie_projetDA.getCategorie_projetList());
            request.setAttribute("courrier", courrierDA.getCourrierList());
        } catch (SQLException e) {
            e.printStackTrace();
        }

        if(request.getParameter("action") != null){
            if(request.getParameter("action").equals("modifierExperience")){
                try {
                        partenaire = experienceDA.findExperience(Integer.parseInt(request.getParameter("id")));
                        request.setAttribute("partenaire",partenaire);
                        request.getRequestDispatcher("admin/partenaire.jsp?action=modifierExperience").forward(request,response);
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            if(request.getParameter("action").equals("supprimerExperience")){
                try {
                    int idExperience = Integer.parseInt(Check.checkInput(request.getParameter("id")));
                    Experience d = experienceDA.findExperience(idExperience);
                    experienceDA.deleteExperience(d);
                    response.sendRedirect("homeServlet");
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }else{
                request.setAttribute("partenaire",partenaire);
                request.getRequestDispatcher("admin/partenaire.jsp?action=ajouterExperience").forward(request,response);
            }
        }else{
            request.setAttribute("partenaire",partenaire);
            request.getRequestDispatcher("admin/partenaire.jsp?action=ajouterExperience").forward(request,response);
        }
    }
}
