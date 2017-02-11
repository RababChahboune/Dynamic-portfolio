<%@page contentType="text/html; ISO-8859-1" pageEncoding="UTF-8" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="dataAccess.*" %>
<%@ page import="model.*" %><%--
  Created by IntelliJ IDEA.
  User: Rabab Chahboune
  Date: 1/30/2017
  Time: 10:44 PM
  To change this template use File | Settings | File Templates.
--%>
<!DOCTYPE html>

<%!Administrateur administrateur;%>
<%administrateur = (Administrateur) request.getAttribute("administrateur");%>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title><%= administrateur.getPortfolio().getNomPortfolio()%></title>

    <!-- Bootstrap Core CSS -->
    <link href="<%=request.getContextPath()%>/creative/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="<%=request.getContextPath()%>/creative/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href='https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800' rel='stylesheet' type='text/css'>
    <link href='https://fonts.googleapis.com/css?family=Merriweather:400,300,300italic,400italic,700,700italic,900,900italic' rel='stylesheet' type='text/css'>

    <!-- Plugin CSS -->
    <link href="<%=request.getContextPath()%>/creative/vendor/magnific-popup/magnific-popup.css" rel="stylesheet">

    <!-- Theme CSS -->
    <link href="<%=request.getContextPath()%>/creative/css/creative.min.css" rel="stylesheet">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body id="page-top">

<nav id="mainNav" class="navbar navbar-default navbar-fixed-top">
    <div class="container-fluid">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                <span class="sr-only">Toggle navigation</span> Menu <i class="fa fa-bars"></i>
            </button>
            <a class="navbar-brand page-scroll" href="#page-top"><%=administrateur.getPortfolio().getNomPortfolio()%></a>
        </div>

        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav navbar-right">
                <li>
                    <a class="page-scroll" href="#about">A propos</a>
                </li>
                <li>
                    <a class="page-scroll" href="#membres">Membres</a>
                </li>
                <li>
                    <a class="page-scroll" href="#services">Domaine</a>
                </li>
                <li>
                    <a class="page-scroll" href="#experience">Experience</a>
                </li>
                <li>
                    <a class="page-scroll" href="#portfolio">Projet</a>
                </li>
                <li>
                    <a class="page-scroll" href="#contact">Contacter nous</a>
                </li>
            </ul>
        </div>
        <!-- /.navbar-collapse -->
    </div>
    <!-- /.container-fluid -->
</nav>

<header>
    <div class="header-content">
        <div class="header-content-inner">
            <h1 id="homeHeading"><%= administrateur.getPortfolio().getNomPortfolio() %></h1>
            <hr>
            <p><%= administrateur.getPortfolio().getSalutationPortfolio() %></p>
            <a href="#about" class="btn btn-primary btn-xl page-scroll">Find Out More</a>
        </div>
    </div>
</header>

<section class="bg-primary" id="about">
    <div class="container">
        <div class="row">
            <div class="col-lg-8 col-lg-offset-2 text-center">
                <h2 class="section-heading">A propos</h2>
                <hr class="light">
                <p class="text-faded"><%=administrateur.getPortfolio().getaProposPortfolio()%></p>
                <a href="#membres" class="page-scroll btn btn-default btn-xl sr-button">Get Started!</a>
            </div>
        </div>
    </div>
</section>

<section id="membres">
    <div class="container">
        <div class="row">
            <div class="col-lg-12 text-center">
                <h2 class="section-heading">Membres</h2>
                <hr class="primary">
            </div>
        </div>
    </div>
    <div class="container">
        <div class="row">
            <% for(Profile profile : administrateur.getProfile()){%>
            <div class="col-lg-3 col-md-6 text-center">
                <div class="service-box">
                    <%request.setAttribute("idProfile",profile.getIdProfile());%>
                    <a href="<%=request.getContextPath()%>/membreController?idProfile=<%=profile.getIdProfile()%>"><img class="img-circle" src="<%=request.getContextPath()%>/lib/dist/img/profile/<% if(!profile.getImageProfile().equals("0")) out.print(profile.getImageProfile()); else out.print("default.png");%>" width="100"></a>
                    <h2><a href="<%=request.getContextPath()%>/membreController?idProfile=<%=profile.getIdProfile()%>"><%=profile.getNomProfile()+" "+profile.getPrenomProfile()%></a></h2>
                </div>
            </div>
            <%}%>
        </div>
    </div>
</section>

<section id="services">
    <div class="container">
        <div class="row">
            <div class="col-lg-12 text-center">
                <h2 class="section-heading">Domaine</h2>
                <hr class="primary">
            </div>
        </div>
    </div>
    <div class="container">
        <div class="row">
            <% for(Domaine d: administrateur.getDomaine()){%>
            <div class="col-lg-3 col-md-6 text-center">
                <div class="service-box">
                    <img src="<%=request.getContextPath()%>/lib/dist/img/domaine/<% if(!d.getImageDomaine().equals("0")) out.print(d.getImageDomaine()); else out.print("default.png");%>" width="100">
                    <h2><%=d.getNomDomaine()%></h2>
                    <p><%=d.getDescriptionDomaine()%></p>
                </div>
            </div>
            <%}%>
        </div>
    </div>
</section>

<section id="experience">
    <div class="container">
        <div class="row">
            <div class="col-lg-12 text-center">
                <h2 class="section-heading">Experience</h2>
                <hr class="primary">
            </div>
        </div>
    </div>
    <div class="container">
        <div class="row">
            <% for(Experience e: administrateur.getExperience()){%>
            <div class="col-lg-3 col-md-6 text-center">
                <div class="service-box">
                    <img src="<%=request.getContextPath()%>/lib/dist/img/partenaire/<% if(!e.getLogoExperience().equals("0")) out.print(e.getLogoExperience()); else out.print("default.png");%>" width="100">
                    <h2><%=e.getNomExperience()%></h2>
                </div>
            </div>
            <%}%>
        </div>
    </div>
</section>

<section class="no-padding" id="portfolio">
    <div class="container-fluid">
        <div class="row no-gutter popup-gallery">
            <%for(Projet projet : administrateur.getProjet()){%>
            <div class="col-lg-4 col-sm-6">
                <a href="<%=request.getContextPath()%>/lib/dist/img/projet/<% if(!projet.getImageProjet().equals("0")) out.print(projet.getImageProjet()); else out.print("default.png");%>" class="portfolio-box">
                    <img style="height: 300px; width: 500px;" src="<%=request.getContextPath()%>/lib/dist/img/projet/<% if(!projet.getImageProjet().equals("0")) out.print(projet.getImageProjet()); else out.print("default.png");%>" class="img-responsive" alt="">
                    <div class="portfolio-box-caption">
                        <div class="portfolio-box-caption-content">
                            <div class="project-category text-faded">
                                <%=projet.getCategorie_projet().getNomProjetCategorie()%>
                            </div>
                            <div class="project-name">
                                <%=projet.getNomProjet()%>
                            </div>
                            <div class="project-name">
                                <%=projet.getProjetProjet()%>
                            </div>
                        </div>
                    </div>
                </a>
            </div>
            <%}%>
        </div>
    </div>
</section>

<section id="contact">
    <div class="container">
        <div class="row">
            <form class="form-horizontal" method="post" action="../courrierController">
                <input type="hidden" value="envoyerCourrier" name="action">
                <div class="form-group">
                    <label class="col-sm-2 control-label">Email</label>
                    <div class="col-sm-10">
                        <input type="email" class="form-control"  name="emailCourrier">
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">Nom complet</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control"  name="nomComplet">
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">Sujet</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control"  name="sujetCourrier">
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">Message</label>
                    <div class="col-sm-10">
                        <textarea class="form-control" rows="3" name="messageCourrier"></textarea>
                    </div>
                </div>
                <div class="form-group ">
                    <div class="col-sm-offset-2 col-sm-10 text-center">
                        <button type="submit" class="btn btn-default">Envoyer</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</section>

<!-- jQuery -->
<script src="vendor/jquery/jquery.min.js"></script>

<!-- Bootstrap Core JavaScript -->
<script src="vendor/bootstrap/js/bootstrap.min.js"></script>

<!-- Plugin JavaScript -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js"></script>
<script src="<%=request.getContextPath()%>/creative/vendor/scrollreveal/scrollreveal.min.js"></script>
<script src="<%=request.getContextPath()%>/creative/vendor/magnific-popup/jquery.magnific-popup.min.js"></script>

<!-- Theme JavaScript -->
<script src="<%=request.getContextPath()%>/creative/js/creative.min.js"></script>

</body>

</html>
