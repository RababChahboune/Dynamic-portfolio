package controlleur;

import dataAccess.courrierDA;
import model.Courrier;
import org.json.JSONException;
import org.json.JSONObject;
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
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        else if(action.equals("supprimerCourrier")){
            try {
                String[] idsCourrier = request.getParameterValues("idCourrier");
                for (String id : idsCourrier){
                    int idCourrier = Integer.parseInt(id);
                    c = courrierDA.findCourrier(idCourrier);
                    courrierDA.deleteCourrier(c);
                }

            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        request.getRequestDispatcher("home.jsp").forward(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("application/json");
        PrintWriter out = response.getWriter();
            if(!request.getParameter("idCourrier").equals("")){
                JSONObject json = new JSONObject();
                try {
                Courrier c = courrierDA.findCourrier(Integer.parseInt(request.getParameter("idCourrier")));
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
        }
    }
}
