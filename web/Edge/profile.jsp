<%@ page import="dataAccess.ProfileDA" %>
<%@ page import="dataAccess.portfolioDA" %>
<%@ page import="model.*" %>
<!DOCTYPE html>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>

<%!
  Administrateur administrateur;
  Profile profile;
  Portfolio portfolio;
%>
<%
  profile = (Profile) request.getAttribute("profile");
  administrateur = (Administrateur) request.getAttribute("administrateur");
  portfolio = administrateur.getPortfolio();
%>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <title><%=portfolio.getNomPortfolio()%> - <%=profile.getNomProfile()%> <%=profile.getPrenomProfile()%></title>
    <meta content="IE=edge" http-equiv="X-UA-Compatible">
    <meta content="width=device-width, initial-scale=1" name="viewport">
    <meta content="Bodo - Simple One Page Personal" name="description">
    <meta content="BdgPixel" name="author">
    <!--Fav-->

    <!--styles-->
    <link href="<%=request.getContextPath()%>/Edge/css/bootstrap.min.css" rel="stylesheet">
    <link href="<%=request.getContextPath()%>/Edge/css/owl.carousel.css" rel="stylesheet">
    <link href="<%=request.getContextPath()%>/Edge/css/owl.theme.css" rel="stylesheet">
    <link href="<%=request.getContextPath()%>/Edge/css/magnific-popup.css" rel="stylesheet">
    <link href="<%=request.getContextPath()%>/Edge/css/style.css" rel="stylesheet">
    <link href="<%=request.getContextPath()%>/Edge/css/responsive.css" rel="stylesheet">
    
    <!--fonts google-->
    <link href='https://fonts.googleapis.com/css?family=Roboto+Slab:400,700' rel='stylesheet' type='text/css'>
    <link href='https://fonts.googleapis.com/css?family=Roboto:400,300,500,700' rel='stylesheet' type='text/css'>
    
    <!--[if lt IE 9]>
       <script type="text/javascript" src="js/html5shiv.min.js"></script>
    <![endif]-->
  </head>
  <body>
    <!--PRELOADER-->
    <div id="preloader">
      <div id="status">
        <img alt="logo" src="<%=request.getContextPath()%>/lib/dist/img/portfolio/<%=portfolio.getLogoPortfolio()%>">
      </div>
    </div>
    <!--/.PRELOADER END-->

    <!--HEADER -->
    <div class="header">
      <div class="for-sticky">
        <!--LOGO-->
        <div class="col-md-2 col-xs-6 logo">
          <a href="index.jsp"><%=portfolio.getNomPortfolio()%></a>
        </div>
        <!--/.LOGO END-->
      </div>
      <div class="menu-wrap">
        <nav class="menu">
          <div class="menu-list">
            <a data-scroll="" href="#home" class="active">
              <span>Home</span>
            </a>
            <a data-scroll="" href="#about">
              <span>About</span>
            </a>
            <a data-scroll="" href="#employement">
              <span>Employement</span>
            </a>
            <a data-scroll="" href="#skill">
              <span>Skills</span>
            </a>
          </div>
        </nav>
        <button class="close-button" id="close-button">Close Menu</button>
      </div>
      <button class="menu-button" id="open-button">
        <span></span>
        <span></span>
        <span></span>
      </button><!--/.for-sticky-->
    </div>
    <!--/.HEADER END-->
    
    <!--CONTENT WRAP-->
    <div class="content-wrap">
      <!--CONTENT-->
      <div class="content">
        <!--HOME-->
        <section id="home">
          <div class="container">
            <div class="row">
              <input id="salutation" type="hidden" value="I'm <%=profile.getNomProfile()%> <%=profile.getPrenomProfile()%>">
              <div class="wrap-hero-content">
                  <div class="hero-content">
                    <h1>Hello</h1>
                    <br>
                    <span class="typed"></span>
                  </div>
              </div>
              <div class="mouse-icon margin-20">
                <div class="scroll"></div>
              </div>
            </div>
          </div>
        </section>
        <!--/.HOME END-->

        <!--ABOUT-->
        <section id="about">
          <div class="col-md-6 col-xs-12 no-pad">
            <div class="bg-about">
              <input id="bg" type="hidden" value="<%=request.getContextPath()%>/lib/dist/img/profile/<%=profile.getImageProfile()%>">
            </div>
          </div>
          <div class="col-md-6 col-sm-12 col-xs-12 white-col">
            <div class="row">
              <!--OWL CAROUSEL2-->
              <div class="owl-carousel2">
                <div class="col-md-12">
                  <div class="wrap-about">
                    <div class="w-content">
                      <p class="head-about">
                        <%=profile.getBiographieProfile()%>
                      </p>
                      
                      <h5 class="name">
                        <%=profile.getNomProfile()%> <%=profile.getPrenomProfile()%>
                      </h5>
                    </div>
                  </div>
                </div>
              
                <div class="col-md-12 col-sm-12 col-xs-12 white-col">
                  <div class="row">
                    <div class="col-md-8 col-md-offset-2 col-sm-8 col-sm-offset-2 col-xs-12">
                      <div class="wrap-about">
                        <table class="w-content">
                          <tr>
                            <td class="title">Name </td>
                            <td class="break">:</td>
                            <td> <%=profile.getNomProfile()%> <%=profile.getPrenomProfile()%></td>
                          </tr>
                          <tr>
                            <td class="title">Phone </td>
                            <td class="break">:</td>
                            <td><%=profile.getTelephoneProfile()%></td>
                          </tr>
                          <tr>
                            <td class="title">Email </td>
                            <td class="break">:</td>
                            <td> <%=profile.getEmailProfile()%></td>
                          </tr>
                        </table>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <!--/.OWL CAROUSEL2 END-->
            </div>
          </div>
        </section>
        <!--/.ABOUT END-->

        <!--Cursus-->
        <section class="grey-bg" id="employement">
          <div class="container">
            <div class="row">
              <div class="col-md-2">
                <h3 class="title-small">
                  <span>Cursus</span>
                </h3>

              </div>
              <div class="col-md-10 content-right">
                <div class="row">
                  <ul class="listing-item">
                    <%for(Cursus cursus : profile.getCursus()){%>
                    <li>
                      <div class="col-md-6 col-sm-6">
                        <div class="wrap-card">
                          <div class="card">
                            <h2 class="year">
                              <%=cursus.getAnnee_debutCursus() %> - <%=cursus.getAnnee_debutCursus() %>
                            </h2>
                            <p class="job">
                              <%=cursus.getNomCursus() %>
                            </p>
                            <p class="company">
                              <%=cursus.getEtablissementCursus() %>
                            </p>
                            <hr>
                            <div class="text-detail">
                              <p>
                                <%=cursus.getRemarqueCursus() %>
                              </p>
                            </div>
                          </div>
                        </div>
                      </div>
                    </li>
                    <%}%>
                  </ul>

                </div>
              </div>
            </div>
          </div>
        </section>
        <!--/.EMPLOYEMENT END-->

        <!--SKILLS-->
        <section class="white-bg" id="skill">
          <div class="container">
            <div class="row">
              <div class="col-md-3">
                <h3 class="title-small">
                  <span>Compétance</span>
                </h3>
              </div>
              <div class="col-md-9 content-right">
                <!--SKILLST-->
                <div class="skillst">
                  <%for(Competance competance:profile.getCompetance()){%>
                  <div class="skillbar" data-percent="<%=competance.getPourcentageCompetance()%>%">
                    <div class="title head-sm">
                      <%=competance.getNomCompetance()%>
                    </div>
                    <div class="count-bar">
                      <div class="count"></div>
                    </div>
                  </div>
                  <%}%>
                </div>
                <!--/.SKILLST END-->
              </div>
            </div>
          </div>
        </section>
        <!--/.SKILLS END-->

        <!--FOOTER-->
        <footer>
          <div class="footer-top">
            <ul class="socials">
              <%for (Lien lien : profile.getLien()){%>
              <li class="twitter">
                <a href="<%=lien.getUrlLien()%>" data-hover="<%=lien.getNomLien()%>"><img width="30" src="<%=request.getContextPath()%>/lib/dist/img/lien/<%=lien.getImageLien()%>"> <%=lien.getNomLien()%></a>
              </li>
              <%}%>
            </ul>
          </div>

          <div class="footer-bottom">
            <div class="container">
              <div class="row">
                <img width="100" src="<%=request.getContextPath()%>/lib/dist/img/portfolio/<%=portfolio.getLogoPortfolio()%>" alt="logo bottom" class="center-block" />
              </div>
            </div>
          </div>
        </footer>
        <!--/.FOOTER-END-->

      <!--/.CONTENT END-->
      </div>
    <!--/.CONTENT-WRAP END-->
    </div>
    

    <script src="<%=request.getContextPath()%>/Edge/js/jquery-1.9.1.min.js" type="text/javascript"></script>
    <script src="<%=request.getContextPath()%>/Edge/js/jquery.appear.js" type="text/javascript"></script>
    <script src="<%=request.getContextPath()%>/Edge/js/bootstrap.min.js" type="text/javascript"></script>
    <script src="<%=request.getContextPath()%>/Edge/js/classie.js" type="text/javascript"></script>
    <script src="<%=request.getContextPath()%>/Edge/js/owl.carousel.min.js" type="text/javascript"></script>
    <script src="<%=request.getContextPath()%>/Edge/js/jquery.magnific-popup.min.js" type="text/javascript"></script>
    <script src="<%=request.getContextPath()%>/Edge/js/masonry.pkgd.min.js" type="text/javascript"></script>
    <script src="<%=request.getContextPath()%>/Edge/js/masonry.js" type="text/javascript"></script>
    <script src="<%=request.getContextPath()%>/Edge/js/smooth-scroll.min.js" type="text/javascript"></script>
    <script src="<%=request.getContextPath()%>/Edge/js/typed.js" type="text/javascript"></script>
    <script src="<%=request.getContextPath()%>/Edge/js/main.js" type="text/javascript"></script>
  </body>
</html>