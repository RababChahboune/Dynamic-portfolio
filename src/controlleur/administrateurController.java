package controlleur;

import dataAccess.AdministrateurDA;
import dataAccess.Categorie_projetDA;
import dataAccess.courrierDA;
import dataAccess.domaineDA;
import model.Administrateur;
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
 * Created by Rabab Chahboune on 12/13/2016.
 */
@WebServlet(name = "administrateurController")
public class administrateurController extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = Check.checkInput(request.getParameter("oldUsername"));
        String password = Check.checkInput(request.getParameter("oldPassword"));
        String nusername = Check.checkInput(request.getParameter("newUsername"));
        String npassword = Check.checkInput(request.getParameter("newPassword"));
        PrintWriter out = response.getWriter();
        try {
            Administrateur admin;
            admin = AdministrateurDA.getAdministrateur();
            if(admin.getUsername().equals(username) && admin.getPassword().equals(password)){
                admin.setUsername(nusername);
                admin.setPassword(npassword);
                AdministrateurDA.updateAdministrateur(admin);
                out.print("Changement avec success");
            }else{
                out.print("Echec, mot de passe ou nom d'utilisateur errone");
            }
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
            Administrateur administrateur = AdministrateurDA.getAdministrateur();
            request.setAttribute("portfolio",administrateur.getProfile());
            request.setAttribute("categorie", Categorie_projetDA.getCategorie_projetList());
            request.setAttribute("administrateur",administrateur);
            request.setAttribute("courrier", courrierDA.getCourrierList());
            request.getRequestDispatcher("admin/administrateur.jsp").forward(request,response);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
