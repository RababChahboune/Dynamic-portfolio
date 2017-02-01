<%@ page import="dataAccess.portfolioDA" %>
<%@ page import="dataAccess.AdministrateurDA" %>
<%@ page import="model.*" %>
<%@ page import="dataAccess.lienDA" %>
<%@ page import="dataAccess.Categorie_projetDA" %>
<%!
	Administrateur administrateur;
	Portfolio portfolio;
%>
<%
	administrateur = AdministrateurDA.getAdministrateur();
	portfolio = administrateur.getPortfolio();
%>
<html>
<head>
	<title><%=portfolio.getNomPortfolio()%></title>
	<!-- META TAGS -->
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.ico">
	<meta name="author" content="Tanislav Robert">
	<meta name="description" content="KARMO is a creative and modern template for digital agencies">

	<!-- STYLES -->
	<link rel="stylesheet" href="assets/css/bootstrap.min.css">
	<link rel="stylesheet" href="assets/css/flexslider.css">
	<link rel="stylesheet" href="assets/css/animsition.min.css">
	<link rel="stylesheet" href="assets/css/style.css">
	<link rel="stylesheet" href="assets/css/owl.carousel.css">
	<link rel="stylesheet" href="assets/css/owl.theme.css">

	<!-- Fontawesome -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.1/css/font-awesome.min.css">
	<link rel="stylesheet" href="https://cdn.linearicons.com/free/1.0.0/icon-font.min.css">
</head>

<body class="animsition">
	<!-- Border -->
	<span class="frame-line top-frame visible-lg"></span>
	<span class="frame-line right-frame visible-lg"></span>
	<span class="frame-line bottom-frame visible-lg"></span>
	<span class="frame-line left-frame visible-lg"></span>
	<!-- HEADER  -->
	<header class="main-header">
		<div class="container-fluid">
				<!-- box header -->
				<div class="box-header">
						<div class="box-logo">
								<a href="index.jsp"><img src="../lib/dist/img/portfolio/<%=portfolio.getLogoPortfolio()%>" width="80" alt="Logo"></a>
						</div>
						<!-- box-nav -->
						<a class="box-primary-nav-trigger" href="#0">
								<span class="box-menu-icon"></span>
						</a>
						<!-- box-primary-nav-trigger -->
				</div>
				<!-- end box header -->

				<!-- nav -->
				<nav>
						<ul class="box-primary-nav">
							<li class="box-label"><%=portfolio.getNomPortfolio()%></li>
							<li><a href="#">Accueil</a></li>
							<li><a href="#services">Apropos</a></li>
							<li><a href="#Statistique">Statistique</a></li>
							<li><a href="#Equipe">Equipe</a></li>
							<li><a href="#Service">Service</a></li>
							<li><a href="#Portfolio">Portfolio</a></li>
							<li><a href="#Client">Client</a></li>


								<li class="box-social"><a href="#0"><i class="fa fa-facebook" aria-hidden="true"></i></a></li>
								<li class="box-social"><a href="#0"><i class="fa fa-behance" aria-hidden="true"></i></a></li>
								<li class="box-social"><a href="#0"><i class="fa fa-twitter" aria-hidden="true"></i></a></li>
								<li class="box-social"><a href="#0"><i class="fa fa-dribbble" aria-hidden="true"></i></a></li>
						</ul>
				</nav>
				<!-- end nav -->

				<!-- box-intro -->
				<section class="box-intro bg-film">
						<div class="table-cell">

								<h3  style="color:white" class="box-headline letters rotate-2">
										<span class="box-words-wrapper">
												<b class="is-visible"><%=portfolio.getSalutationPortfolio()%></b>
												<b><%=portfolio.getSalutationPortfolio()%></b>
										</span>
								</h3>
								<h1 style="color:white" >WE ARE <%=portfolio.getNomPortfolio()%></h1>

						</div>

						<div class="mouse">
								<div class="scroll"></div>
						</div>
				</section>
				<!-- end box-intro -->
		</div>
	</header>

	<!-- HISTORY OF AGENCY -->
	<section id="about" class="about mt-150 mb-50">
		<div class="container">
			<div class="row center">
				<div class="col-md-8 col-md-offset-2">
					<img src="assets/img/about.png" alt="Khaki HTML Template" width="300">
					<div class="km-space"></div>
					<h5 class="lead"><%=portfolio.getaProposPortfolio()%></h5>
				</div>
			</div><!-- description text -->
		</div>
	</section>

	<!-- FACTS  -->
	<div id="facts" class="facts mt-100 mbr-box mbr-section mbr-section--relative">
		<div class="container">
			<div class="row text-center">
			    <div class="col-xs-12 col-lg-3 col-md-3">
                    <div class="count-item">
                        <i class="lnr lnr-clock"></i>
                        <div class="numscroller" data-slno='1' data-min='0' data-max='<%=administrateur.getProjet().size()%>' data-delay='1' data-increment="10"><%=administrateur.getProjet().size()%></div>
                        <div class="count-name-intro">Projets</div>
                    </div>
                </div>
                <div class="col-xs-12  col-lg-3 col-md-3">
                    <div class="count-item">
                        <i class="lnr lnr-rocket"></i>
                        <div class="numscroller" data-slno='1' data-min='0' data-max='<%=administrateur.getProfile().size()%>' data-delay='1' data-increment="1"><%=administrateur.getProfile().size()%></div>
                        <div class="count-name-intro">Membres</div>
                    </div>
                </div>
                <div class="col-xs-12  col-lg-3 col-md-3">
                    <div class="count-item">
                        <i class="lnr lnr-coffee-cup"></i>
                        <div class="numscroller" data-slno='1' data-min='0' data-max='<%=administrateur.getDomaine().size()%>' data-delay='1' data-increment="1"><%=administrateur.getDomaine().size()%></div>
                        <div class="count-name-intro">Domaines</div>
                    </div>
                </div>
                <div class="col-xs-12 col-lg-3 col-md-3">
                    <div class="count-item">
                        <i class="lnr lnr-camera"></i>
                        <div class="numscroller" data-slno='1' data-min='0' data-max='<%=administrateur.getExperience().size()%>' data-delay='1' data-increment="10"><%=administrateur.getExperience().size()%></div>
                        <div class="count-name-intro">Partenaires</div>
                    </div>
                </div>
        	</div>
		</div>
	</div>

	<!-- TEAM -->
	<section id="team" class="team mbr-box mbr-section mbr-section--relative">
		<svg preserveAspectRatio="none" viewBox="0 0 100 102" height="100" width="100%" version="1.1" xmlns="http://www.w3.org/2000/svg">
			<path d="M0 0 L50 100 L100 0 Z" fill="#ffeedb" stroke="#ffeedb"></path>
		</svg>
		<div class="container">
			<div class="col-md-8 col-md-offset-2 col-sm-12">
				<div class="row center mb-100">
					<div class="section-title-parralax">
						<div class="process-numbers">01</div>
						<h2>Notre equipe</h2>
					</div>
				</div>
			</div>
			<div class="row">
				<%for(Profile profile : administrateur.getProfile()){%>
                <!-- single member -->
                <div class="team-member col-md-3 col-sm-3 text-center">
                    <div class="member-thumb">
                    	<div class="cover"><div class="cover-inner-left"></div></div>
                        <img src="../lib/dist/img/profile/<%=profile.getImageProfile()%>" alt="Team Member" class="img-responsive">
                        <div class="team_cover"><div class="team_cover_inner"></div></div>
                            <div class="overlay">
                                <div class="social-links">
									<% for(Lien lien : lienDA.getLienList(profile)){%>
                                    <a href="<%=lien.getUrlLien()%>"><img src="../lib/dist/img/lien/<%=lien.getImageLien()%>"></a>
									<%}%>
                                </div>
                            </div>
                    </div>
                        <h6><%=profile.getNomProfile()%> <%=profile.getPrenomProfile()%></h6>
                        <span><%=profile.getEmailProfile()%></span>
                </div>
                <!-- end single member -->
            	<%}%>
			</div>
		</div>
		<div class="bottom-separator hidden-xs"></div>
	</section>

	<!-- SERVICES PARALAX -->
	<section id="services" class="services mbr-box mbr-section mbr-section--relative mbr-section--fixed-size mbr-section--full-height mbr-section--bg-adapted mbr-parallax-background"  style="background-image: url(assets/img/services.jpg);">
		<div class="section-overlay"></div>
		<div class="container">
			<div class="row center">
				<div class="col-md-8 col-md-offset-2 col-sm-12">
					<div class="section-title-parralax">
						<div class="process-numbers">02</div>
						<h2>services</h2>
					</div>
				</div>
			</div>
			<div class="row">
				<%for(Domaine domaine : administrateur.getDomaine()){%>
				<div class="col-lg-3 right col-full right-0">
					<img width="100px" src="../lib/dist/img/domaine/<%=domaine.getImageDomaine()%>">
					<h6><%=domaine.getNomDomaine()%></h6>
					<p><%=domaine.getDescriptionDomaine()%></p>
				</div>
				<%}%>
			</div>
		</div>
	</section>

	<!-- PORTFOLIO -->
	<section class="portfolio">
		<div class="top-right-separator hidden-xs"></div>
		<div class="container">
			<div class="col-md-8 col-md-offset-2 col-sm-12">
				<div class="row center">
					<div class="section-title mb-100">
						<div class="process-numbers">03</div>
						<h2>portfolio</h2>
					</div>
				</div>
			</div>
			<!-- categories  -->
			<div class="col-md-3">
				<div class="row categories-grid">
					<nav class="categories">
						<ul class="portfolio_filter">
							<li><a href="" class="active" data-filter="*">Tous</a></li>
							<%for(Categorie_projet cp : Categorie_projetDA.getCategorie_projetList()){%>
							<li><a href="" data-filter=".<%=cp.getNomProjetCategorie()%>"><%=cp.getNomProjetCategorie()%></a></li>
							<%}%>
						</ul>
					</nav>
				</div>
			</div>

			<!-- all works -->
			<div class="col-md-9">
				<div class="row portfolio_container">
					<%for(Projet cp : administrateur.getProjet()){%>
					<!-- single work -->
					<div class="col-md-4 <%=cp.getCategorie_projet().getNomProjetCategorie()%>">
						<a href="single-project.jsp?id=<%=cp.getIdProjet()%>" class="portfolio_item work-grid">
							<img src="../lib/dist/img/projet/<%=cp.getImageProjet()%>" alt="image">
							<div class="portfolio_item_hover">
								<div class="item_info">
									<span><%=cp.getNomProjet()%></span>
									<em><%=cp.getCategorie_projet().getNomProjetCategorie()%></em>
								</div>
							</div>
						</a>
					</div>
					<!-- end single work -->
					<%}%>
				</div>
				<!-- end row -->
			</div>
			<!-- all works end -->
		</div>
		<!-- end container -->
	</section>
	<!-- portfolio -->

	<!-- CLIENTS -->
	<div id="clients" class="clients mt-100 mbr-box mbr-section mbr-section--relative">
		<svg preserveAspectRatio="none" viewBox="0 0 100 102" height="100" width="100%" version="1.1" xmlns="http://www.w3.org/2000/svg">
			<path d="M0 0 L50 100 L100 0 Z" fill="#fff" stroke="#fff"></path>
		</svg>
		<div class="container">
			<div class="row">
						<div class="col-md-12">
						</div>
						<div id="owl-demo">
							<%for(Experience experience : administrateur.getExperience()){%>
								<div class="item"><img width="100px" src="../lib/dist/img/partenaire/<%=experience.getLogoExperience()%>" alt="<%=experience.getNomExperience()%>"></div>
							<%}%>
						</div>
				</div>
		</div>
	</div>
	<!-- Contact -->
	<section id="contact" class="contact mbr-box mbr-section mbr-section--relative mbr-section--bg-adapted">
		<div class="container">
			<div class="col-md-6 col-sm-12">
				<div class="row">
					<h4>Travaillons ensemble</h4>
					<a href="contact.jsp" class="default-btn"> Contacter <i class="fa fa-angle-double-right" aria-hidden="true"></i></a>
				</div>
			</div>

			<!-- Subscribe block -->
			<div class=" col-md-offset-1 col-md-5 col-sm-12">
				<div class="row center">
					<div class="newsletter">
						<h4>SUBSCRIBE</h4>
						<p class="libre-text mb-50">
							Restez informé grâce à notre newsletter
						</p>
						<form action="#" method="post">
							<div class="input_1">
								<input type="text" name="email">
								<span>Entrez votre adresse email</span>
							</div>
							<button id="submit_btn" class="default-btn"> Send <i class="fa fa-angle-double-right" aria-hidden="true"></i></button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</section>

	<!-- Footer -->
	<footer class="main-footer">
		<svg preserveAspectRatio="none" viewBox="0 0 100 102" height="100" width="100%" version="1.1" xmlns="http://www.w3.org/2000/svg" class="svgcolor-light">
			<path d="M0 0 L50 100 L100 0 Z" fill="#fff" stroke="#fff"></path>
		</svg>
            <div class="container">
                <div class="row mt-100 mb-50 footer-widgets">
                    <!-- Start Contact Widget -->
                    <div class="col-md-6 col-xs-12">
                        <div class="footer-widget contact-widget">
                            <img width="100px" src="../lib/dist/img/portfolio/<%=portfolio.getLogoPortfolio()%>" class="logo-footer img-responsive" alt="Footer Logo" />
                            <ul class="social-icons">
                                <li>
                                    <a class="facebook" href="#"><i class="fa fa-facebook"></i></a>
                                </li>
                                <li>
                                    <a class="twitter" href="#"><i class="fa fa-twitter"></i></a>
                                </li>
                                <li>
                                    <a class="google" href="#"><i class="fa fa-google-plus"></i></a>
                                </li>
                                <li>
                                    <a class="dribbble" href="#"><i class="fa fa-dribbble"></i></a>
                                </li>
                                <li>
                                    <a class="linkdin" href="#"><i class="fa fa-linkedin"></i></a>
                                </li>
                                <li>
                                    <a class="flickr" href="#"><i class="fa fa-flickr"></i></a>
                                </li>
                                <li>
                                    <a class="tumblr" href="#"><i class="fa fa-tumblr"></i></a>
                                </li>
                                <li>
                                    <a class="instgram" href="#"><i class="fa fa-instagram"></i></a>
                                </li>
                                <li>
                                    <a class="vimeo" href="#"><i class="fa fa-vimeo-square"></i></a>
                                </li>
                                <li>
                                    <a class="skype" href="#"><i class="fa fa-skype"></i></a>
                                </li>
                            </ul>
                        </div>
                    </div><!-- .col-md-3 -->
                    <!-- End Contact Widget -->


                    <!-- Start Flickr Widget -->
                    <div class="col-md-6 col-xs-12">
                        <div class="footer-widget company-links">
                            <h4><%=portfolio.getNomPortfolio()%></h4>
							<ul class="footer-links">
                                <li><a href="#">Apropos</a></li>
                                <li><a href="#">Statistique</a></li>
								<li><a href="#">Equipe</a></li>
								<li><a href="#">Service</a></li>
                                <li><a href="#">Portfolio</a></li>
                                <li><a href="#">Client</a></li>
							</ul>
                        </div>
                    </div><!-- .col-md-3 -->
                    <!-- End Flickr Widget -->
                </div><!-- .row -->

                <!-- Start Copyright -->
                <div class="copyright-section">
                    <div class="row">
                        <div class="col-md-6">
                            <p>&copy; 2016 BENCHRAA Mohamed Reda  -  CHAHBOUNE Rabab </p>
                        </div><!-- .col-md-6 -->
                    </div><!-- .row -->
                </div>
                <!-- End Copyright -->
            </div>
	</footer>

	<!-- SCRIPTS -->
	<script type="text/javascript" src="assets/js/jquery-2.2.3.min.js"></script>
	<script type="text/javascript" src="assets/js/animated-headline.js"></script>
	<script type="text/javascript" src="assets/js/menu.js"></script>
	<script type="text/javascript" src="assets/js/modernizr.js"></script>
	<script type="text/javascript" src="assets/js/isotope.pkgd.min.js"></script>
	<script type="text/javascript" src="assets/js/jquery.flexslider-min.js"></script>
	<script type="text/javascript" src="assets/js/jquery.animsition.min.js"></script>
	<script type="text/javascript" src="assets/js/init.js"></script>
	<script type="text/javascript" src="assets/js/main.js"></script>
	<script type="text/javascript" src="assets/js/smooth-scroll.js"></script>
	<script type="text/javascript" src="assets/js/numscroller.js"></script>
	<script type="text/javascript" src="assets/js/wow.min.js"></script>
	<script type="text/javascript" src="assets/js/owl.carousel.min.js"></script>

	<script type="text/javascript">
		$(window).load(function() {
			new WOW().init();

			// initialise flexslider
			$('.flexslider').flexslider({
				animation: "fade",
				directionNav: true,
				controlNav: false,
				keyboardNav: true,
				slideToStart: 0,
				animationLoop: true,
				pauseOnHover: false,
				slideshowSpeed: 4000,
			});

			smoothScroll.init();

			// initialize isotope
			var $container = $('.portfolio_container');
			$container.isotope({
				filter: '*',
			});

			$('.portfolio_filter a').click(function(){
				$('.portfolio_filter .active').removeClass('active');
				$(this).addClass('active');

				var selector = $(this).attr('data-filter');
				$container.isotope({
					filter: selector,
					animationOptions: {
						duration: 500,
						animationEngine : "jquery"
					}
				});
				return false;
			});
		});
	</script>
</body>
</html>
