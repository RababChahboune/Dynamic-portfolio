package utility;

import com.sun.deploy.net.HttpRequest;
import dataAccess.AdministrateurDA;
import model.Administrateur;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;

/**
 * Created by Reda BENCHRAA on 2/10/2017.
 */
public class verifySession {
    public static boolean check(HttpServletRequest request, HttpServletResponse response) throws IOException, SQLException {
        Administrateur a = null;
        Cookie[] cookies;
        cookies = request.getCookies();
        HttpSession session = request.getSession();
        if (session.getAttribute("username") == null) {
            System.out.println("no session detected");
            if (cookies != null) {
                a = AdministrateurDA.getAdministrateur();
                for (Cookie c : cookies) {
                    if (c.getName().equals("username"))
                        if (c.getValue().equals(a.getUsername()))
                            return true;
                }
                return false;
            }
        }
        return true;
    }
}
