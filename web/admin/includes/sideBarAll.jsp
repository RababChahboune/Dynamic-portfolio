<%--
  Author: Reda BENCHRAA
  Date: 12/12/2016
  Time: 18:07
--%>
<!-- Side bar for all files -->
<%@ page contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />

    <title>Title</title>
</head>
<body>

</body>
</html>
<aside class="main-sidebar">
    <!-- sidebar: style can be found in sidebar.less -->
    <section class="sidebar">

        <!-- /.search form -->
        <!-- sidebar menu: : style can be found in sidebar.less -->
        <ul class="sidebar-menu">
            <li class="header">Gestion</li>
            <li>
                <a href="homeServlet">
                    <i class="fa fa-area-chart"></i> <span>Tableau de bord</span>
                </a>
            </li>
            <li>
                <a href="portfolioController">
                    <i class="fa fa-info"></i> <span>Information</span>
                </a>
            </li>
            <li>
                <a href="courrierController">
                    <i class="fa fa-envelope"></i> <span>Courrier</span>
                    <span class="pull-right-container">
                        </span>
                </a>
            </li>
            <li class="header">Configuration</li>
            <li><a href="administrateurController"><i class="fa fa-gear"></i> <span>Administrateur</span></a></li>
            <li><a href="themeController"><i class="fa fa-flash"></i> <span>Thème</span></a></li>
        </ul>
    </section>
    <!-- /.sidebar -->
</aside>
