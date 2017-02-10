package controlleur;

import com.geekonjava.fileupload.FileUploading;
import dataAccess.AdministrateurDA;
import dataAccess.Categorie_projetDA;
import dataAccess.ProjetDA;
import dataAccess.courrierDA;
import model.Administrateur;
import model.Categorie_projet;
import model.Projet;
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
 * Created by Rabab Chahboune on 12/12/2016.
 */
@WebServlet(name = "projectController")
public class projectController extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ServletContext context = this.getServletContext();
        String imagepath = this.getServletContext().getRealPath("/") + "/lib/dist/img/projet/";
        ArrayList<String> imagename = new ArrayList<String>();
        imagename.add("imageProjet");
        ArrayList<String> dataname = new ArrayList<String>();
        dataname.add("nomProjet");
        dataname.add("idProjet");
        dataname.add("descriptionProjet");
        dataname.add("projetProjet");
        dataname.add("idProjetCategorie");
        dataname.add("etoileProjet");
        dataname.add("action");
        HashMap map = FileUploading.UploadFile(imagepath, dataname, imagename, request);
        Projet p;
        PrintWriter out = response.getWriter();
        try {
            Categorie_projet categorie_projet = Categorie_projetDA.findCategorie_projet("idProjetCategorie",map.get("idProjetCategorie").toString());
            if(map.get("action").equals("ajouterProjet")){

                String imageProjet = Check.checkInput(map.get("imageProjet").toString());
                p = new Projet();
                p.setNomProjet(map.get("nomProjet").toString());
                p.setDescriptionProjet(map.get("descriptionProjet").toString());
                p.setProjetProjet(map.get("projetProjet").toString());
                p.setImageProjet(imageProjet);
                p.setCategorie_projet(categorie_projet);
                p.setEtoileProjet(Boolean.parseBoolean(map.get("etoileProjet").toString()));
                System.out.println(map.get("etoileProjet").toString());
                ProjetDA.insertProjet(p);
            }
            else if(map.get("action").equals("modifierProjet")){
                int idProjet = Integer.parseInt(map.get("idProjet").toString());
                p = ProjetDA.findProjet(idProjet);
                if( !map.get("imageProjet").toString().equals("") ){
                    p.setImageProjet(map.get("imageProjet").toString());
                }
                else {
                    out.print("Erreur lors de l'upload de l'image");
                }
                p.setNomProjet(map.get("nomProjet").toString());
                p.setDescriptionProjet(map.get("descriptionProjet").toString());
                p.setProjetProjet(map.get("projetProjet").toString());
                p.setCategorie_projet(categorie_projet);
                if(map.get("etoileProjet").toString().equals("on")){
                    p.setEtoileProjet(true);
                }else{
                    p.setEtoileProjet(false);
                }

                ProjetDA.updateProjet(p);
            }

        } catch (SQLException e) {
            e.printStackTrace();
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
        Projet p = new Projet("", "", "", "", false, null);
        Administrateur administrateur = null;
        try {
            administrateur = AdministrateurDA.getAdministrateur();
            request.setAttribute("portfolio", administrateur.getProfile());
            request.setAttribute("administrateur", administrateur);
            request.setAttribute("courrier", courrierDA.getCourrierList());
            request.setAttribute("categorie", Categorie_projetDA.getCategorie_projetList());
        } catch (SQLException e) {
            e.printStackTrace();
        }
        try {
            ArrayList<Categorie_projet> cps = Categorie_projetDA.getCategorie_projetList();
            request.setAttribute("cps", Categorie_projetDA.getCategorie_projetList());

        } catch (SQLException e) {
            e.printStackTrace();
        }
        if (request.getParameter("action") != null) {
            if (request.getParameter("action").equals("modifierProjet")) {
                try {
                    p = ProjetDA.findProjet(Integer.parseInt(request.getParameter("id")));
                    request.setAttribute("projet", p);
                    request.getRequestDispatcher("admin/projet.jsp?action=modifierProjet").forward(request, response);
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            } else if (request.getParameter("action").equals("supprimerProjet")) {
                int idProjet = Integer.parseInt(Check.checkInput(request.getParameter("id")));
                try {
                    p = ProjetDA.findProjet(idProjet);
                    ProjetDA.deleteProjet(p);
                    response.sendRedirect("homeServlet");
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            } else {
                request.setAttribute("projet", p);
                request.getRequestDispatcher("admin/projet.jsp?action=ajouterProjet").forward(request, response);
            }
        } else {
            request.setAttribute("projet", p);
            request.getRequestDispatcher("admin/projet.jsp?action=ajouterProjet").forward(request, response);
        }
    }
}
