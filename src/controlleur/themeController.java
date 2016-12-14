package controlleur;

import dataAccess.themeDA;
import model.Portfolio;
import dataAccess.portfolioDA;
import model.Theme;
import utility.Check;

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

    }
}
