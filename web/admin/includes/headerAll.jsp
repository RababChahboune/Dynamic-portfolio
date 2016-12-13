<%--
  Author: Reda BENCHRAA
  Date: 12/12/2016
  Time: 18:08
--%>
<!-- Header File for all folders -->
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<header class="main-header">
    <a href="home.jsp" class="logo"><img src="../lib/dist/img/logo.png" width="32" height="32"> Dynamic Portfolio</a>
    <nav class="navbar navbar-static-top">
        <a href="#" class="sidebar-toggle" data-toggle="offcanvas" role="button"><span class="sr-only">Toggle navigation</span></a>
        <div class="navbar-custom-menu">
            <ul class="nav navbar-nav">
                <li class="dropdown messages-menu">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                        <i class="fa fa-envelope-o"></i>
                        <span class="label label-success">1</span>
                    </a>
                    <ul class="dropdown-menu">
                        <li class="header">You have 1 message</li>
                        <li>
                            <ul class="menu">
                                <li>
                                    <a href="#">
                                        <h4>
                                            Reda Benchraa
                                            <small><i class="fa fa-clock-o"></i> 2 days</small>
                                        </h4>
                                        <p>Hi there</p>
                                    </a>
                                </li>
                            </ul>
                        </li>
                        <li class="footer"><a href="#">Voir tous les messages</a></li>
                    </ul>
                </li>
                <li>
                    <a href="logoutController"><i class="fa fa-sign-out"></i></a>
                </li>
            </ul>
        </div>
    </nav>
</header>
