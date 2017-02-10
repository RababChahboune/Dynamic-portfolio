package controlleur;

import com.geekonjava.fileupload.FileUploading;
import dataAccess.ProfileDA;
import dataAccess.lienDA;
import model.Domaine;
import model.Lien;
import model.Profile;
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
 * Created by Rabab Chahboune on 12/13/2016.
 */
@WebServlet(name = "lienController")
public class lienController extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ServletContext context = this.getServletContext();
        PrintWriter out = response.getWriter();
        Domaine d;
        String imagepath = this.getServletContext().getRealPath("/") + "/lib/dist/img/lien/";
        ArrayList<String> imagename = new ArrayList<String>();
        imagename.add("imageLien");
        ArrayList<String> dataname = new ArrayList<String>();
        dataname.add("actionLien");
        dataname.add("nomLien");
        dataname.add("urlLien");
        dataname.add("idLien");
        dataname.add("idProfile");
        HashMap map = FileUploading.UploadFile(imagepath, dataname, imagename, request);
        Lien l;
        try {
            if(map.get("actionLien").toString().equals("ajouterLien")){
                Profile p = ProfileDA.findProfile(Integer.parseInt(map.get("idProfile").toString()));
                String imageLien = Check.checkInput(map.get("imageLien").toString());
                if(imageLien.equals("")) imageLien ="0";
                l = new Lien();
                l.setNomLien(map.get("nomLien").toString());
                l.setUrlLien(map.get("urlLien").toString());
                l.setImageLien(imageLien);
                lienDA.insertLien(l,p);
            }
            else if(map.get("actionLien").toString().equals("modifierLien")){
                Profile p = ProfileDA.findProfile(Integer.parseInt(map.get("idProfile").toString()));
                int idLien = Integer.parseInt(Check.checkInput(map.get("idLien").toString()));
                l = lienDA.findLien(idLien);
                String imageLien = l.getImageLien();
                if(map.get("imageLien").toString().equals("")){
                    imageLien = l.getImageLien();
                }else{
                    imageLien = map.get("imageLien").toString();
                }
                l.setNomLien(map.get("nomLien").toString());
                l.setUrlLien(map.get("urlLien").toString());
                l.setImageLien(imageLien);
                lienDA.updateLien(l,p);
            }else if(request.getParameter("actionLien").equals("supprimerLien")){
                int idLien = Integer.parseInt(Check.checkInput(request.getParameter("idLien")));
                l = lienDA.findLien(idLien);
                lienDA.deleteLien(l);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html; charset=UTF-8");
    }
}
