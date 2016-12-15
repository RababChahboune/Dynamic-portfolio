package controlleur;

import com.geekonjava.fileupload.FileUploading;
import dataAccess.domaineDA;
import model.Domaine;
import utility.Check;

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
@WebServlet(name = "domaineController")
public class domaineController extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ServletContext context = this.getServletContext();
        PrintWriter out = response.getWriter();
        Domaine d;
        String imagepath = this.getServletContext().getRealPath("/") + "/lib/dist/img/domaine/";
        ArrayList<String> imagename = new ArrayList<String>();
        imagename.add("imageDomaine");
        ArrayList<String> dataname = new ArrayList<String>();
        dataname.add("nomDomaine");
        dataname.add("idDomaine");
        dataname.add("descriptionDomaine");
        dataname.add("action");
        HashMap map = FileUploading.UploadFile(imagepath, dataname, imagename, request);
        if(map.get("action").toString().equals("ajouterDomaine")){
            try {
                String imageDomaine = Check.checkInput(map.get("imageDomaine").toString());
                d = new Domaine();
                d.setNomDomaine(map.get("nomDomaine").toString());
                d.setDescriptionDomaine(map.get("descriptionDomaine").toString());
                d.setImageDomaine(imageDomaine);
                domaineDA.insertDomaine(d);
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        else if(map.get("action").toString().equals("modifierDomaine")){
            try {
                int idDomaine = Integer.parseInt(Check.checkInput(map.get("idDomaine").toString()));
                d = domaineDA.findDomaine(idDomaine);
                if( !map.get("imageDomaine").toString().equals("")){
                    d.setImageDomaine(map.get("imageDomaine").toString());
                } else {
                    out.print("Erreur lors de l'upload de l'image");
                }
                d.setNomDomaine(map.get("nomDomaine").toString());
                d.setDescriptionDomaine(map.get("descriptionDomaine").toString());
                domaineDA.updateDomaine(d);
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if(request.getParameter("action").equals("supprimerDomaine")){
            try {
                int idDomaine = Integer.parseInt(Check.checkInput(request.getParameter("id")));
                Domaine d = domaineDA.findDomaine(idDomaine);
                domaineDA.deleteDomaine(d);
                response.sendRedirect("admin/home.jsp");
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
