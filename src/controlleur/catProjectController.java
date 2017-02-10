package controlleur;

import com.geekonjava.fileupload.FileUploading;
import dataAccess.AdministrateurDA;
import dataAccess.Categorie_projetDA;
import dataAccess.courrierDA;
import model.Administrateur;
import model.Categorie_projet;
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
@WebServlet(name = "catProjectController")
public class catProjectController extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ServletContext context = this.getServletContext();
        String imagepath = this.getServletContext().getRealPath("/") + "/lib/dist/img/categorieProjet/";
        ArrayList<String> imagename = new ArrayList<String>();
        imagename.add("imageProjetCategorie");
        ArrayList<String> dataname = new ArrayList<String>();
        dataname.add("nomProjetCategorie");
        dataname.add("idProjetCategorie");
        dataname.add("descriptionProjetCategorie");
        dataname.add("action");
        HashMap map = FileUploading.UploadFile(imagepath, dataname, imagename, request);
        Categorie_projet cp;
        PrintWriter out = response.getWriter();
        System.out.println(map.get("action").toString()+"---------------------");
        if(map.get("action").toString().equals("ajouterCategorieProjet")){
            try {
                String imageProjetCategorie = Check.checkInput(map.get("imageProjetCategorie").toString());
                cp = new Categorie_projet();
                cp.setNomProjetCategorie(map.get("nomProjetCategorie").toString());
                cp.setDescriptionProjetCategorie(map.get("descriptionProjetCategorie").toString());
                cp.setImageProjetCategorie(imageProjetCategorie);
                Categorie_projetDA.insertCategorie_projet(cp);
            } catch (SQLException e) {
                e.printStackTrace();
            }

        }
        else if(map.get("action").toString().equals("modifierCategorieProjet")){
            try {
                int idProjetCategorie = Integer.parseInt(Check.checkInput(map.get("idProjetCategorie").toString()));
                cp = Categorie_projetDA.findCategorie_projet("idProjetCategorie",idProjetCategorie);
                if( !map.get("imageProjetCategorie").toString().equals("") ){
                    cp.setImageProjetCategorie(map.get("imageProjetCategorie").toString());
                }
                else {
                    out.print("Erreur lors de l'upload de l'image");
                }
                cp.setNomProjetCategorie(map.get("nomProjetCategorie").toString());
                cp.setDescriptionProjetCategorie(map.get("descriptionProjetCategorie").toString());
                Categorie_projetDA.updateCategorie_projet(cp);
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        //request.getRequestDispatcher("home.jsp").forward(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html; charset=UTF-8");

        Categorie_projet cp = new Categorie_projet("","","");
        Administrateur administrateur = null;
        try {
            if(!verifySession.check(request,response)){
                response.sendRedirect("admin/index");
            }
            administrateur = AdministrateurDA.getAdministrateur();
            request.setAttribute("administrateur",administrateur);
            request.setAttribute("portfolio",administrateur.getProfile());
            request.setAttribute("courrier", courrierDA.getCourrierList());
            request.setAttribute("categorie", Categorie_projetDA.getCategorie_projetList());
        } catch (SQLException e) {
            e.printStackTrace();
        }
        if(request.getParameter("action") != null){
            if(request.getParameter("action").equals("modifierCategorieProjet")){
                try {
                    cp = Categorie_projetDA.findCategorie_projet("idProjetCategorie",Integer.parseInt(request.getParameter("id")));
                    request.setAttribute("cat",cp);
                    request.getRequestDispatcher("admin/categorieProjet.jsp?action=modifierCategorieProjet").forward(request,response);
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }else
                if(request.getParameter("action").equals("supprimerCategorieProjet")){
                try {
                    int idProjetCategorie = Integer.parseInt(Check.checkInput(request.getParameter("id")));
                    cp = Categorie_projetDA.findCategorie_projet("idProjetCategorie",idProjetCategorie);
                    Categorie_projetDA.deleteCategorie_projet(cp);
                    response.sendRedirect("homeServlet");
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }else {
                    System.out.println("ajoutercat");

                    request.setAttribute("cat",cp);
                request.getRequestDispatcher("admin/categorieProjet.jsp?action=ajouterCategorieProjet").forward(request,response);
            }
        }else{
            request.setAttribute("cat",cp);
            request.setAttribute("action","ajouterCategorieProjet");
            request.getRequestDispatcher("admin/categorieProjet.jsp?action=ajouterCategorieProjet").forward(request,response);
        }

    }
}
