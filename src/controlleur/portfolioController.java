package controlleur;

import com.geekonjava.fileupload.FileUploading;
import dataAccess.*;
import model.Administrateur;
import model.Courrier;
import model.Portfolio;
import model.Theme;
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
@WebServlet(name = "portfolioController")
public class portfolioController extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ServletContext context = this.getServletContext();
        PrintWriter out = response.getWriter();
        Portfolio d;
        String imagepath = this.getServletContext().getRealPath("/") + "/lib/dist/img/portfolio/";
        System.out.println(imagepath);
        ArrayList<String> imagename = new ArrayList<String>();
        imagename.add("logoPortfolio");
        ArrayList<String> dataname = new ArrayList<String>();
        dataname.add("nomPortfolio");
        dataname.add("aProposPortfolio");
        dataname.add("salutationPortfolio");
        HashMap map = FileUploading.UploadFile(imagepath, dataname, imagename, request);
        System.out.println("image "+ map.get("logoPortfolio").toString());
        try {
            d = portfolioDA.getPortfolio();
            if (!map.get("logoPortfolio").equals("")) {
                d.setLogoPortfolio(map.get("logoPortfolio").toString());
            } else {
                out.print("Erreur lors de l'upload de l'image");
            }
            d.setNomPortfolio(map.get("nomPortfolio").toString());
            d.setSalutationPortfolio(map.get("salutationPortfolio").toString());
            d.setaProposPortfolio(map.get("aProposPortfolio").toString());
            portfolioDA.updatePortfolio(d);
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
        try {
            Administrateur administrateur = AdministrateurDA.getAdministrateur();
            request.setAttribute("portfolio",administrateur.getProfile());
            request.setAttribute("categorie", Categorie_projetDA.getCategorie_projetList());
            request.setAttribute("administrateur",administrateur);
            request.setAttribute("courrier", courrierDA.getCourrierList());
            request.setAttribute("domaine", domaineDA.getDomaineList());
            request.getRequestDispatcher("admin/information.jsp").forward(request,response);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
