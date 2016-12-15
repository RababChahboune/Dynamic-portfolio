package controlleur;

import dataAccess.AdministrateurDA;
import model.Administrateur;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

/**
 * Created by Reda BENCHRAA on 11/12/2016.
 */
public class logoutServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session=request.getSession();
        session.invalidate();
        Cookie[] cookies= request.getCookies();
        Administrateur a;
        try {
            a = AdministrateurDA.getAdministrateur();
            boolean foundCookie = false;
            for(int i = 0; i < cookies.length; i++) {
                if (cookies[i].getName().equals("username"))
                {
                    if(cookies[i].getValue().equals(a.getUsername())){
                        cookies[i].setMaxAge(0);
                        response.addCookie(cookies[i]);
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        response.sendRedirect("admin/login.jsp");
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
