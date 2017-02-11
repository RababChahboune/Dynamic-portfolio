package controlleur;

import dataAccess.AdministrateurDA;
import model.Administrateur;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

/**
 * Created by Rabab Chahboune on 2/11/2017.
 */
@WebServlet(name = "contactUsController")
public class contactUsController extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html; charset=UTF-8");
        Administrateur administrateur = null;
        try{
            administrateur = AdministrateurDA.getAdministrateur();

            request.setAttribute("administrateur", administrateur);
            request.getRequestDispatcher(administrateur.getPortfolio().getTheme().getNomTheme()+"/contact.jsp").forward(request,response);

        }catch (SQLException e){
            System.out.println(e);
        }
    }
}
