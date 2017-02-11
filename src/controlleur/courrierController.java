package controlleur;

import dataAccess.AdministrateurDA;
import dataAccess.Categorie_projetDA;
import dataAccess.courrierDA;
import dataAccess.portfolioDA;
import model.Administrateur;
import model.Courrier;
import org.json.JSONException;
import org.json.JSONObject;
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
import java.util.ArrayList;

/**
 * Created by Rabab Chahboune on 12/13/2016.
 */
@WebServlet(name = "courrierController")
public class courrierController extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = Check.checkInput(request.getParameter("action"));
        String emailCourrier = Check.checkInput(request.getParameter("emailCourrier"));
        String sujetCourrier = Check.checkInput(request.getParameter("sujetCourrier"));
        String messageCourrier = Check.checkInput(request.getParameter("messageCourrier"));
        String nomComplet = Check.checkInput(request.getParameter("nomComplet"));

        Courrier c;

        if(action.equals("envoyerCourrier")){
            try {
                c = new Courrier();
                c.setEmailCourrier(emailCourrier);
                c.setSujetCourrier(sujetCourrier);
                c.setMessageCourrier(messageCourrier);
                c.setNomComplet(nomComplet);
                courrierDA.insertCourrier(c);
                response.sendRedirect("indexController");
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        else if(action.equals("supprimerCourrier")){
            try {
                System.out.println(request.getParameter("idCourrier"));
                String[] idsCourrier = request.getParameter("idCourrier").split(",");
                for (String id : idsCourrier){
                    int idCourrier = Integer.parseInt(id);
                    c = courrierDA.findCourrier(idCourrier);
                    courrierDA.deleteCourrier(c);
                }

            } catch (SQLException e) {
                e.printStackTrace();
            }
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
        response.setContentType("application/json");
        PrintWriter out = response.getWriter();
            if(request.getParameter("idCourrier") !=null){
                JSONObject json = new JSONObject();
                try {
                Courrier c = courrierDA.findCourrier(Integer.parseInt(request.getParameter("idCourrier")));
                    json.put("idCourrier",c.getIdCourrier());
                    json.put("emailCourrier",c.getEmailCourrier());
                    json.put("nomCompletCourrier",c.getNomComplet());
                    json.put("dateCourrier",c.getDateEnvoieCourrier());
                    json.put("messageCourrier",c.getMessageCourrier());
                    json.put("sujetCourrier",c.getSujetCourrier());
            } catch (SQLException e) {
                e.printStackTrace();
            } catch (JSONException e) {
                    e.printStackTrace();
                }
                out.print(json);
        }else {
                ArrayList<Courrier> list= null;
                try {
                    list = courrierDA.getCourrierList();
                    Administrateur administrateur = AdministrateurDA.getAdministrateur();
                    request.setAttribute("portfolio",administrateur.getProfile());
                    request.setAttribute("categorie", Categorie_projetDA.getCategorie_projetList());
                    request.setAttribute("administrateur",administrateur);
                } catch (SQLException e) {
                    e.printStackTrace();
                }
                request.setAttribute("courrier",list);
                request.getRequestDispatcher("admin/courrier.jsp").forward(request,response);
            }
    }
}
