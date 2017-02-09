<%@ page import="model.Administrateur" %>
<%@ page import="dataAccess.AdministrateurDA" %><%--
  Created by IntelliJ IDEA.
  User: Rabab Chahboune
  Date: 12/14/2016
  Time: 10:23 PM
  To change this template use File | Settings | File Templates.
--%>
<%!
    Administrateur a;
    Cookie[] cookies;
    boolean foundCookie;
%>
<%
    foundCookie = false;
    cookies = request.getCookies();
    if(session.getAttribute("username") == null){
        if(cookies!=null){
            a = AdministrateurDA.getAdministrateur();
            foundCookie = false;
            for(Cookie c : cookies){
                if(c.getName().equals("username"))
                    if(c.getValue().equals(a.getUsername()))
                        foundCookie = true;
            }
            if(!foundCookie)
                response.sendRedirect("login.jsp");
        }
    }
%>