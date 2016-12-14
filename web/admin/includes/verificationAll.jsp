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
    if(cookies!=null){
        for(Cookie c : cookies){
            if(c.getName().equals("username"))
                if(c.getValue().equals(a.getUsername()))
                    foundCookie = true;
        }
    }
    if(!foundCookie){
        if(session.getAttribute("username") == null || session.getAttribute("username").equals("")){
            System.out.println("login redirect");
            //response.sendRedirect("login.jsp");
            request.getRequestDispatcher("login.jsp").forward(request,response);
        }else{
            System.out.println("session found");
        }
    }else{
        System.out.println("Cookie found");
    }
    System.out.println("fin");
%>
