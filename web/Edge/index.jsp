<%@ page contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>
<%@ page import="dataAccess.AdministrateurDA" %>
<%@ page import="model.*" %>
<!DOCTYPE html>
<%!
  Administrateur administrateur;
  Portfolio portfolio;
%>
<%
  administrateur = AdministrateurDA.getAdministrateur();
  portfolio = administrateur.getPortfolio();
%>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <title><%=portfolio.getNomPortfolio()%></title>
    <meta content="IE=edge" http-equiv="X-UA-Compatible">
    <meta content="width=device-width, initial-scale=1" name="viewport">
    <meta content="Bodo - Simple One Page Personal" name="description">
    <meta content="BdgPixel" name="author">

    <!--styles-->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/owl.carousel.css" rel="stylesheet">
    <link href="css/owl.theme.css" rel="stylesheet">
    <link href="css/magnific-popup.css" rel="stylesheet">
    <link href="css/style.css" rel="stylesheet">
    <link href="css/responsive.css" rel="stylesheet">
    
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
        <img alt="logo" src="../lib/dist/img/portfolio/<%=portfolio.getLogoPortfolio()%>">
      </div>
    </div>
    <!--/.PRELOADER END-->

    <!--HEADER -->
    <div class="header">
      <div class="for-sticky">
        <!--LOGO-->
        <div class="col-md-2 col-xs-6 logo">
          <a href="index.jsp"><img alt="logo" class="logo-nav" src="../lib/dist/img/portfolio/<%=portfolio.getLogoPortfolio()%>"></a>
        </div>
        <!--/.LOGO END-->
      </div>
      <div class="menu-wrap">
        <nav class="menu">
          <div class="menu-list">
            <a data-scroll="" href="#home" class="active">
              <span>Home</span>
            </a>
            <a data-scroll="" href="#work">
              <span>Work</span>
            </a>
             <a data-scroll="" href="#services">
              <span>Services</span>
            </a>
            <a data-scroll="" href="#testimonial">
              <span>Partenaires</span>
            </a>
            <a data-scroll="" href="#blog">
              <span>Membres</span>
            </a>
            <a data-scroll="" href="#contact">
              <span>Contact</span>
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
              <div class="wrap-hero-content">
                  <div class="hero-content">
                    <h1>Hello</h1>
                    <br>
                    <input id="salutation" type="hidden" value="<%=portfolio.getSalutationPortfolio()%>">
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

        <!--WORK-->
        <section class="grey-bg mar-tm-10" id="work">
          <div class="container">
            <div class="row">
              <div class="col-md-3">
                <h3 class="title-small">
                  <span>Work</span>
                </h3>

              </div>
              <div class="col-md-9 content-right">
                <!--PORTFOLIO IMAGE-->
                <ul class="portfolio-image">
                  <%for(Projet cp : administrateur.getProjet()){%>
                  <li class="col-md-6">
                    <a href="../lib/dist/img/projet/<%=cp.getImageProjet()%>"><img alt="image" src="../lib/dist/img/projet/<%=cp.getImageProjet()%>">
                      <div class="decription-wrap">
                        <div class="image-bg">
                           <p class="desc"><%=cp.getDescriptionProjet()%></p>
                        </div>

                      </div>
                    </a>
                  </li>
                  <%}%>
                </ul>
                <!--/.PORTFOLIO IMAGE END-->
              </div>
            </div>
          </div>
        </section>
        <!--/.WORK END-->

        <!--SERVICES-->
        <section class="white-bg" id="services">
          <div class="container">
            <div class="row">
              <div class="col-md-1">
                <h3 class="title-small">
                  <span>Services</span>
                </h3>
              </div>
              <div class="col-md-11 content-right">
                <div class="row">
                  <ul class="listing-item">
                    <%for(Domaine domaine : administrateur.getDomaine()){%>
                    <li>
                      <div class="col-md-4 col-sm-4">
                        <img width="30" src="../lib/dist/img/domaine/<%=domaine.getImageDomaine()%>">
                        <p class="head-sm">
                          <%=domaine.getNomDomaine()%>
                        </p>
                        <p class="text-grey">
                          <%=domaine.getDescriptionDomaine()%>
                        </p>
                      </div>
                    </li>
                    <%}%>
                  </ul>


                </div>
              </div>
            </div>
          </div>
        </section>
        <!--/.SERVICES END-->

        <!--experience-->
        <section id="testimonial">
          <div class="container">
            <div class="row wrap-testimonial">
              <div class="col-md-10 col-md-offset-1">
                <div class="owl-carousel">
                  <%for(Experience experience : administrateur.getExperience()){%>
                  <div class="list-testimonial">
                    <div class="content-testimonial">
                      <img width="100px" src="../lib/dist/img/partenaire/<%=experience.getLogoExperience()%>">
                      <p class="people">
                        <%=experience.getNomExperience()%>
                      </p>
                    </div>
                  </div>
                  <%}%>
                </div>
              </div>
            </div>
          </div>
          <div class="mask-testimonial"></div>
        </section>
        <!--/.experience END-->

        <!--Members-->
        <section class="grey-bg" id="blog">
          <div class="container">
            <div class="row">
              <div class="col-md-12">
                <h3 class="title-small-center text-center">
                  <span>Les Membres</span>
                </h3>
                <!--GRID Membres-->
                <div class="grid">
                  <%for(Profile profile : administrateur.getProfile()){%>
                  <div class="grid-item">
                    <div class="wrap-article">
                      <img alt="blog-1" class="img-circle text-center" src="../lib/dist/img/profile/<%=profile.getImageProfile()%>">
                      <p class="subtitle fancy">
                        <span><%=profile.getEmailProfile()%></span>
                      </p>
                      <a href="#">
                        <h3 class="title">
                         <a href="profile.jsp?id=<%=profile.getIdProfile()%>"> <%=profile.getNomProfile()%> <%=profile.getPrenomProfile()%></a>
                        </h3>
                      </a>
                      <p class="content-blog"><%=profile.getBiographieProfile()%> </p>
                    </div>
                  </div>
                  <%}%>
                </div>
                <!--/.GRID BLOG END-->
              </div>
            </div>
          </div>
        </section>
        <!-- Members END-->

        <!--CONTACT-->
        <section id="contact" class="white-bg">
          <div class="container">
            <div class="row">
              <div class="col-md-3">
                <h3 class="title-small">
                  <span>Contact</span>
                </h3>
              </div>
              <div class="col-md-9 content-right">
                <form>
                  <div class="group">
                    <input required="" type="text"><span class="highlight"></span><span class="bar"></span><label>Name</label>
                  </div>
                  <div class="group">
                    <input required="" type="email"><span class="highlight"></span><span class="bar"></span><label>Email</label>
                  </div>
                  <div class="group">
                    <textarea required=""></textarea><span class="highlight"></span><span class="bar"></span><label>Message</label>
                  </div>
                  <input id="sendMessage" name="sendMessage" type="submit" value="Send Message">
                </form>
              </div>
            </div>
          </div>
        </section>
        <!--/.CONTACT END-->
        
        <!--FOOTER-->
        <footer>
          <div class="footer-bottom">
            <div class="container">
              <div class="row">
                <img width="100" src="../lib/dist/img/portfolio/<%=portfolio.getLogoPortfolio()%>" alt="logo bottom" class="center-block" />
              </div>
            </div>
          </div>
        </footer>
        <!--/.FOOTER-END-->

      <!--/.CONTENT END-->
      </div>
    <!--/.CONTENT-WRAP END-->
    </div>
    

    <script src="js/jquery-1.9.1.min.js" type="text/javascript"></script>
    <script src="js/jquery.appear.js" type="text/javascript"></script>
    <script src="js/bootstrap.min.js" type="text/javascript"></script>
    <script src="js/classie.js" type="text/javascript"></script>
    <script src="js/owl.carousel.min.js" type="text/javascript"></script>
    <script src="js/jquery.magnific-popup.min.js" type="text/javascript"></script>
    <script src="js/masonry.pkgd.min.js" type="text/javascript"></script>
    <script src="js/masonry.js" type="text/javascript"></script>
    <script src="js/smooth-scroll.min.js" type="text/javascript"></script>
    <script src="js/typed.js" type="text/javascript"></script>
    <script src="js/main.js" type="text/javascript"></script>
  </body>
</html>