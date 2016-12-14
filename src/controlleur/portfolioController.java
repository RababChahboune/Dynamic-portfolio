package controlleur;

import dataAccess.portfolioDA;
import dataAccess.themeDA;
import model.Portfolio;
import model.Theme;
import utility.Check;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

/**
 * Created by Rabab Chahboune on 12/13/2016.
 */
@WebServlet(name = "portfolioController")
public class portfolioController extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = Check.checkInput(request.getParameter("action"));
        String nomPortfolio = Check.checkInput(request.getParameter("nomPortfolio"));
        String aProposPortfolio = Check.checkInput(request.getParameter("aProposPortfolio"));
        String salutationPortfolio = Check.checkInput(request.getParameter("salutationPortfolio"));
        String logoPortfolio = Check.checkInput(request.getParameter("logoPortfolio"));
        String theme = Check.checkInput(request.getParameter("theme"));
        Portfolio d;
        try {
            Theme t = themeDA.findTheme(theme);
            if(action.equals("ajouterPortfolio")){
                d = new Portfolio();
                d.setNomPortfolio(nomPortfolio);
                d.setSalutationPortfolio(salutationPortfolio);
                d.setaProposPortfolio(aProposPortfolio);
                d.setLogoPortfolio(logoPortfolio);
                d.setTheme(t);
                portfolioDA.insertPortfolio(d);
            }
            else if(action.equals("modifierPortfolio")){
                int idPortfolio = Integer.parseInt(Check.checkInput(request.getParameter("idPortfolio")));
                d = portfolioDA.getPortfolio();
                d.setNomPortfolio(nomPortfolio);
                d.setSalutationPortfolio(salutationPortfolio);
                d.setaProposPortfolio(aProposPortfolio);
                d.setLogoPortfolio(logoPortfolio);
                d.setTheme(t);
                portfolioDA.updatePortfolio(d);

            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        request.getRequestDispatcher("home.jsp").forward(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
