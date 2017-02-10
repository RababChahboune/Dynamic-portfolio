package controlleur;

import dataAccess.*;
import model.Administrateur;
import model.Portfolio;
import model.Theme;
import utility.Check;
import utility.verifySession;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;


/**
 * Created by Reda BENCHRAA on 14/12/2016.
 */
@WebServlet(name = "themeController")
public class themeController extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        try {
            String themeName = Check.checkInput(request.getParameter("themeName"));
            System.out.printf(request.getParameter("themeName"));
            Portfolio p = portfolioDA.getPortfolio();
            Theme theme = themeDA.findTheme(themeName);
            System.out.printf(String.valueOf(theme));
            p.setTheme(theme);
            portfolioDA.updatePortfolio(p);
            out.write(theme.getPaletteTheme());
        } catch (SQLException e) {
            out.write("Failed");
            e.printStackTrace();
        }

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html; charset=UTF-8");
        try {
            if(!verifySession.check(request,response)){
                response.sendRedirect("admin/index");
            }
            Administrateur administrateur = AdministrateurDA.getAdministrateur();
            String selectedThemeImage =themeDA.findTheme(administrateur.getPortfolio().getTheme().getNomTheme()).getPaletteTheme();
            request.setAttribute("administrateur",administrateur);
            request.setAttribute("portfolio",administrateur.getProfile());
            request.setAttribute("categorie", Categorie_projetDA.getCategorie_projetList());
            request.setAttribute("courrier", courrierDA.getCourrierList());
            request.setAttribute("theme", themeDA.getThemeList());
            request.setAttribute("selectedThemeImage", selectedThemeImage);
            request.getRequestDispatcher("admin/theme.jsp").include(request,response);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
