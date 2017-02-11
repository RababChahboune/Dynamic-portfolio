<%@ page import="model.Projet" %>
<%@ page import="model.Administrateur" %>
<%!
	Administrateur administrateur;
	Projet project;
%>
<%
	administrateur = (Administrateur) request.getAttribute("administrateur");
	project = (Projet) request.getAttribute("projet");
%>
<html>
<head>
	<title><%=administrateur.getPortfolio().getNomPortfolio()%></title>
	<!-- META TAGS -->
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.ico">
	<meta name="author" content="Tanislav Robert">
	<meta name="description" content="KARMO is a creative and modern template for digital agencies">

	<!-- STYLES -->
	<link rel="stylesheet" href="<%=request.getContextPath()%>/karmo/assets/css/bootstrap.min.css">
	<link rel="stylesheet" href="<%=request.getContextPath()%>/karmo/assets/css/flexslider.css">
	<link rel="stylesheet" href="<%=request.getContextPath()%>/karmo/assets/css/animsition.min.css">
	<link rel="stylesheet" href="<%=request.getContextPath()%>/karmo/assets/css/style.css">
	<link rel="stylesheet" href="<%=request.getContextPath()%>/karmo/assets/css/owl.carousel.css">
	<link rel="stylesheet" href="<%=request.getContextPath()%>/karmo/assets/css/owl.theme.css">

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
								<a href="index.jsp"><img src="<%=request.getContextPath()%>/lib/dist/img/portfolio/<%=administrateur.getPortfolio().getLogoPortfolio()%>" width="80" alt="Logo"></a>
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
					<li class="box-label"><%=administrateur.getPortfolio().getNomPortfolio()%></li>
					<li><a href="#">Accueil</a></li>
					<li><a href="#Apropos">Apropos</a></li>
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
		</div>
	</header>

	<!-- HERO SECTION  -->
	<div class="site-hero_2">
		<div class="section-overlay"></div>
		<div class="page-title">
			<h2 style="color: #fff;"><%=project.getNomProjet()%></h2>
			<div  style="color: #fff;" class="small-title">home / portfolio </div>
		</div>
	</div>


	<section class="project_descr">
		<div class="container mt-100">
			<div class="row center">
			<div class="col-md-8 col-md-offset-2 col-sm-12">
				<div class="section-title">
					<h2 class="mb-50"><%=project.getProjetProjet()%></h2>
				</div>
			</div>
			</div>

			<div class="row mt-50">
				<div class="col-md-9 wow fadeInUp">
					<%=project.getDescriptionProjet()%>
				</div>
				<div class="col-md-3 wow fadeInUp" data-wow-delay=".1s">
					<ul class="project_list">
						<li><%=project.getCategorie_projet().getNomProjetCategorie()%></li>
					</ul>
					<h5 class="share-title">Partager</h5>
					<ul class="social-icons" style="margin-top:20px;">
						<li><a href="javasript:void(0);" data-social="fb"><i class="fa fa-facebook-square" aria-hidden="true"></i></a></li>
						<li><a href="javasript:void(0);" data-social="tw"><i class="fa fa-linkedin-square" aria-hidden="true"></i></a></li>
						<li><a href="javasript:void(0);" data-social="ln"><i class="fa fa-twitter" aria-hidden="true"></i></a></li>
						<li><a href="javasript:void(0);" data-social="pt"><i class="fa fa-google-plus-square" aria-hidden="true"></i></a></li>
						<li><a href="javasript:void(0);" data-social="fb"><i class="fa fa-youtube" aria-hidden="true"></i></a></li>
						<li><a href="javasript:void(0);" data-social="fb"><i class="fa fa-pinterest" aria-hidden="true"></i></a></li>
						<li><a href="javasript:void(0);" data-social="fb"><i class="fa fa-behance" aria-hidden="true"></i></a></li>
					</ul>
				</div>
			</div>
		</div><!-- end container -->
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
						<img width="100px" src="<%=request.getContextPath()%>/lib/dist/img/portfolio/<%=administrateur.getPortfolio().getLogoPortfolio()%>" class="logo-footer img-responsive" alt="Footer Logo" />
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
						<h4><%=administrateur.getPortfolio().getNomPortfolio()%></h4>
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
						<p>&copy; 2016-2017 BENCHRAA Mohamed Reda  -  CHAHBOUNE Rabab </p>
					</div><!-- .col-md-6 -->
				</div><!-- .row -->
			</div>
			<!-- End Copyright -->
		</div>
	</footer>

	<!-- SCRIPTS -->
	<script type="text/javascript" src="<%=request.getContextPath()%>/karmo/assets/js/jquery-2.2.3.min.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/karmo/assets/js/animated-headline.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/karmo/assets/js/menu.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/karmo/assets/js/modernizr.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/karmo/assets/js/isotope.pkgd.min.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/karmo/assets/js/jquery.flexslider-min.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/karmo/assets/js/jquery.animsition.min.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/karmo/assets/js/init.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/karmo/assets/js/main.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/karmo/assets/js/smooth-scroll.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/karmo/assets/js/numscroller.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/karmo/assets/js/wow.min.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/karmo/assets/js/owl.carousel.min.js"></script>

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
