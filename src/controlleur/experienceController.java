package controlleur;

import com.geekonjava.fileupload.FileUploading;
import dataAccess.experienceDA;
import model.Domaine;
import model.Experience;
import model.Experience;
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
@WebServlet(name = "experienceController")
public class experienceController extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ServletContext context = this.getServletContext();
        PrintWriter out = response.getWriter();
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
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if(request.getParameter("action").equals("supprimerExperience")){
            try {
                int idExperience = Integer.parseInt(Check.checkInput(request.getParameter("id")));
                Experience d = experienceDA.findExperience(idExperience);
                experienceDA.deleteExperience(d);
                response.sendRedirect("admin/home.jsp");
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
