<%@ page import="model.Courrier" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="dataAccess.courrierDA" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.concurrent.TimeUnit" %>
<%--
  Author: Reda BENCHRAA
  Date: 12/12/2016
  Time: 18:08
--%>
<!-- Header File for all folders -->
<%!  ArrayList<Courrier> courriers ;
    public static long getDateDiff(Date date1, Date date2, TimeUnit timeUnit) {
        long diffInMillies = date2.getTime() - date1.getTime();
        return timeUnit.convert(diffInMillies,TimeUnit.MILLISECONDS);
    }%>
<% courriers = courrierDA.getCourrierList();%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<header class="main-header">
    <a href="home.jsp" class="logo"><img src="../lib/dist/img/logo0.png" width="45" height="45"> <h8>Dynamic Portfolio</h8></a>
    <nav class="navbar navbar-static-top">
        <a href="#" class="sidebar-toggle" data-toggle="offcanvas" role="button"><span class="sr-only">Toggle navigation</span></a>
        <div class="navbar-custom-menu">
            <ul class="nav navbar-nav">
                <li class="dropdown messages-menu">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                        <i class="fa fa-envelope-o"></i>
                        <span class="label label-success"><%= courriers.size()%></span>
                    </a>
                    <ul class="dropdown-menu">
                        <li class="header">You have <%= courriers.size()%> message</li>
                        <li>
                            <ul class="menu">
                                <% for (Courrier c : courriers){%>
                                <li>
                                    <a href="#">
                                        <h4>
                                            <%=c.getNomComplet()%>
                                            <small><i class="fa fa-clock-o"> <%=getDateDiff(new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").parse(c.getDateEnvoieCourrier().substring(0,19)),new Date(),TimeUnit.MINUTES)%></i></small>
                                        </h4>
                                        <%if (c.getMessageCourrier().length() > 21){%>
                                            <p><%=c.getMessageCourrier().substring(0,20)%>...</p>
                                        <%}else{%>
                                            <p><%=c.getMessageCourrier()%></p>
                                        <%}%>
                                    </a>
                                </li>
                                <%}%>
                            </ul>
                        </li>
                        <li class="footer"><a href="#">Voir tous les messages</a></li>
                    </ul>
                </li>
                <li>
                    <a href="../logoutController"><i class="fa fa-sign-out"></i></a>
                </li>
            </ul>
        </div>
    </nav>
</header>
