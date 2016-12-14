package controlleur;

import com.geekonjava.fileupload.FileUploading;
import dataAccess.portfolioDA;
import model.Portfolio;
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
@WebServlet(name = "portfolioController")
public class portfolioController extends HttpServlet {
    private static final String DATA_DIRECTORY = "C:/uploads";
    private static final int MAX_MEMORY_SIZE = 1024 * 1024 * 200;
    private static final int MAX_REQUEST_SIZE = 1024 * 1024 * 200;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ServletContext context = this.getServletContext();
        PrintWriter out = response.getWriter();
        Portfolio d = new Portfolio();
        String nomPortfolio = Check.checkInput(request.getParameter("nomPortfolio"));
        String aProposPortfolio = Check.checkInput(request.getParameter("aProposPortfolio"));
        String salutationPortfolio = Check.checkInput(request.getParameter("salutationPortfolio"));
        String imagepath = this.getServletContext().getRealPath("/") + "/lib/dist/img/portfolio/";
        System.out.println(imagepath);
        ArrayList<String> imagename = new ArrayList<String>();
        imagename.add("logoPortfolio");
        ArrayList<String> dataname = new ArrayList<String>();
        dataname.add("nomPortfolio");
        dataname.add("aProposPortfolio");
        dataname.add("salutationPortfolio");
        HashMap map = FileUploading.UploadFile(imagepath, dataname, imagename, request);
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

    }
}
