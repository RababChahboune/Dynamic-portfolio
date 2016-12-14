package controlleur;

import dataAccess.portfolioDA;
import dataAccess.themeDA;
import model.Portfolio;
import model.Theme;
//import org.apache.commons.fileupload.FileItem;
//import org.apache.commons.fileupload.FileUploadException;
//import org.apache.commons.fileupload.disk.DiskFileItemFactory;
//import org.apache.commons.fileupload.servlet.ServletFileUpload;
import utility.Check;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.Iterator;
import java.util.List;

/**
 * Created by Rabab Chahboune on 12/13/2016.
 */
@WebServlet(name = "portfolioController")
public class portfolioController extends HttpServlet {
    private static final String DATA_DIRECTORY = "data";
    private static final int MAX_MEMORY_SIZE = 1024 * 1024 * 2;
    private static final int MAX_REQUEST_SIZE = 1024 * 1024;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        out.println(request.getAttribute("nom") + " " +  request.getAttribute("logo"));
        /*boolean isMultipart = ServletFileUpload.isMultipartContent(request);
        if (!isMultipart) return;
        DiskFileItemFactory factory = new DiskFileItemFactory();
        factory.setSizeThreshold(MAX_MEMORY_SIZE);
        factory.setRepository(new File(System.getProperty("java.io.tmpdir")));
        String uploadFolder = getServletContext().getRealPath("") + File.separator + DATA_DIRECTORY;
        ServletFileUpload upload = new ServletFileUpload(factory);
        upload.setSizeMax(MAX_REQUEST_SIZE);
        try {
            List items = upload.parseRequest(request);
            Iterator iter = items.iterator();
            while (iter.hasNext()) {
                FileItem item = (FileItem) iter.next();
                if (!item.isFormField()) {
                    String fileName = new File(item.getName()).getName();
                    String filePath = uploadFolder + File.separator + fileName;
                    File uploadedFile = new File(filePath);
                    System.out.println(filePath);
                    item.write(uploadedFile);
                }
            }
            getServletContext().getRequestDispatcher("/done.jsp").forward(request, response);
        } catch (Exception ex) {
            throw new ServletException(ex);
        }

        String action = Check.checkInput(request.getParameter("action"));
        String nomPortfolio = Check.checkInput(request.getParameter("nomPortfolio"));
        String aProposPortfolio = Check.checkInput(request.getParameter("aProposPortfolio"));
        String salutationPortfolio = Check.checkInput(request.getParameter("salutationPortfolio"));
        String theme = Check.checkInput(request.getParameter("theme"));
        Portfolio d;
        try {
            Theme t = themeDA.findTheme(theme);
            if(action.equals("ajouterPortfolio")){
                d = new Portfolio();
                String logoPortfolio = Check.checkInput(request.getParameter("logoPortfolio"));
                d.setNomPortfolio(nomPortfolio);
                d.setSalutationPortfolio(salutationPortfolio);
                d.setaProposPortfolio(aProposPortfolio);
                d.setLogoPortfolio(logoPortfolio);
                d.setTheme(t);
                portfolioDA.insertPortfolio(d);
            }
            else if(action.equals("modifierPortfolio")){
                String logoPortfolio = request.getParameter("logoPortfolio");
                d = portfolioDA.getPortfolio();
                if(logoPortfolio==null){
                    logoPortfolio = d.getLogoPortfolio();
                }
                d.setTheme(t);
                d.setNomPortfolio(nomPortfolio);
                d.setaProposPortfolio(aProposPortfolio);
                d.setSalutationPortfolio(salutationPortfolio);
                portfolioDA.updatePortfolio(d);

            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        request.getRequestDispatcher("home.jsp").forward(request,response);*/
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
