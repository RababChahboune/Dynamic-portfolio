package controlleur;

import dataAccess.AdministrateurDA;
import model.Administrateur;
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
 * Created by Rabab Chahboune on 12/13/2016.
 */
@WebServlet(name = "administrateurController")
public class administrateurController extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String username = Check.checkInput(request.getParameter("username"));
        String password = Check.checkInput(request.getParameter("password"));
        try {
            Administrateur admin;
            admin = AdministrateurDA.getAdministrateur();
            admin.setUsername(username);
            admin.setPassword(password);
            AdministrateurDA.updateAdministrateur(admin);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        request.getRequestDispatcher("home.jsp").forward(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
