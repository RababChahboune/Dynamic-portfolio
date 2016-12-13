package controlleur;

import dataAccess.AdministrateurDA;
import model.Administrateur;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

/**
 * Created by Reda BENCHRAA on 11/12/2016.
 */
public class loginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String action = request.getParameter("action");
        try {
            Administrateur admin = AdministrateurDA.getAdministrateur();
            response.setContentType("text/html");
            PrintWriter out = response.getWriter();
            if(action.equals("login")){
                if(admin.getUsername().equals(username) && admin.getPassword().equals(password)){
                    HttpSession session = request.getSession();
                    session.setAttribute("counter", username);
                    out.print("logged");
                    request.getRequestDispatcher("admin.jsp").forward(request,response);
                }else{
                    out.print("wrong password");
                }
            }
            else if(action.equals("lockScreen")){
                if(admin.getPassword().equals(password)){
                    HttpSession session = request.getSession();
                    session.setAttribute("counter", username);
                    out.print("logged");
                    request.getRequestDispatcher("admin.jsp").forward(request,response);
                }else{
                    out.print("wrong password");
                }
            }
            out.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
