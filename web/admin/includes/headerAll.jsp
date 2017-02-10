<%@ page import="model.Courrier" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="dataAccess.courrierDA" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.concurrent.TimeUnit" %>
<%@ page import="utility.UtilHelper" %>
<%--
  Author: Reda BENCHRAA
  Date: 12/12/2016
  Time: 18:08
--%>
<!-- Header File for all folders -->
<% ArrayList<Courrier> courriers = (ArrayList<Courrier>) request.getAttribute("courrier");%>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />

<header class="main-header">
    <a href="home.jsp" class="logo"><img src="<%=request.getContextPath()%>/lib/dist/img/logo0.png" width="45" height="45"> <h8>Dynamic Portfolio</h8></a>
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
                                            <small><i class="fa fa-clock-o"> <%=UtilHelper.getDateDiff(new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").parse(c.getDateEnvoieCourrier().substring(0,19)),new Date(),TimeUnit.MINUTES)%></i></small>
                                        </h4>
                                        <%if (c.getMessageCourrier().length() > 21){%>
                                            <p><%=c.getMessageCourrier().substring(0,20)%><%=request.getContextPath()%>.</p>
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
                    <a href="<%=request.getContextPath()%>/logoutController"><i class="fa fa-sign-out"></i></a>
                </li>
            </ul>
        </div>
    </nav>
</header>
