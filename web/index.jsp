<%@ page import="model.Portfolio" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="dataAccess.portfolioDA" %><%--
  Author: Reda BENCHRAA
  Date: 1/30/2017
  Time: 10:32 PM
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%!
    Portfolio p;
%>
<%
    try {
        p = portfolioDA.getPortfolio();
        response.sendRedirect(p.getTheme().getNomTheme()+"/");

    } catch (SQLException e) {
        e.printStackTrace();
    }
%>


