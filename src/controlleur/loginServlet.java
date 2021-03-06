package controlleur;

import dataAccess.AdministrateurDA;
import model.Administrateur;
import utility.Check;
import utility.verifySession;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

/**
 * Created by Reda BENCHRAA on 11/12/2016.
 */
public class loginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = Check.checkInput(request.getParameter("username"));
        String password = Check.checkInput(request.getParameter("password"));
        String rememberMe = Check.checkInput(request.getParameter("rememberMe"));
        String action = request.getParameter("action");
        try {
            Administrateur admin = AdministrateurDA.getAdministrateur();
            if(action.equals("login")){
                if(admin.getUsername().equals(username) && admin.getPassword().equals(password)){
                    if(rememberMe.equals("on")) {
                        Cookie c = new Cookie("username", username);
                        c.setMaxAge(24*60*60);
                        response.addCookie(c);
                    }
                    HttpSession session = request.getSession();
                    session.setAttribute("username", username);
                    response.sendRedirect("homeServlet");
                }else{
                    response.sendRedirect("admin/login.jsp?status=wrong");
                }
            }
            else if(action.equals("lockScreen")){
                if(admin.getPassword().equals(password)){
                    HttpSession session = request.getSession();
                    session.setAttribute("username", username);
                    response.sendRedirect("homeServlet");
                }else{
                    response.sendRedirect("admin/lockScreen.jsp");
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html; charset=UTF-8");

        try {
            if(verifySession.check(request,response)){
                response.sendRedirect("homeServlet");
            }else{
                response.sendRedirect("login.jsp");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        //doPost(request,response);
    }
}
