<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Tableau de bord</title>
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <link rel="stylesheet" href="../lib/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
    <link rel="stylesheet" href="../lib/dist/css/AdminLTE.css">
    <link rel="stylesheet" href="../lib/dist/css/skins/_all-skins.min.css">
    <link rel="stylesheet" href="../lib/plugins/iCheck/flat/blue.css">
    <link rel="stylesheet" href="../lib/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.min.css">
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body class="hold-transition skin-purple sidebar-mini fixed">
<jsp:include page="includes/headerAll.jsp" />
<jsp:include page="includes/sideBarAll.jsp" />
<div class="wrapper">
    <div class="content-wrapper">
        <section class="content-header">
            <h1>
                Tableau de bord
            </h1>
        </section>
        <section class="content">
            <jsp:include page="includes/headerHome.jsp" >
                <jsp:param name="nbrProjets" value="5" />
                <jsp:param name="nbrMembres" value="4" />
                <jsp:param name="nbrDomaines" value="3" />
                <jsp:param name="nbrPartenaires" value="2" />
            </jsp:include>
            <div class="row">
                <jsp:include page="includes/membresHome.jsp" >
                    <jsp:param name="listMembre" value="5" />
                </jsp:include>
                <jsp:include page="includes/projetHome.jsp" >
                    <jsp:param name="listProjet" value="5" />
                </jsp:include>
                <jsp:include page="includes/catégorieProjetHome.jsp" >
                    <jsp:param name="listCatégorieProjet" value="5" />
                </jsp:include>
                <jsp:include page="includes/domaineHome.jsp" >
                    <jsp:param name="listDomaine" value="5" />
                </jsp:include>
                <jsp:include page="includes/partenaireHome.jsp" >
                    <jsp:param name="listPartenaire" value="5" />
                </jsp:include>
            </div>
        </section>
    </div>
    <jsp:include page="includes/footerAll.jsp" />
</div>

<script src="../lib/plugins/jQuery/jquery-2.2.3.min.js"></script>
<script src="https://code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
<script>
    $.widget.bridge('uibutton', $.ui.button);
</script>
<script src="../lib/bootstrap/js/bootstrap.min.js"></script>
<script src="http://cdnjs.cloudflare.com/ajax/libs/raphael/2.1.0/raphael-min.js"></script>
<script src="../lib/plugins/morris/morris.min.js"></script>
<script src="../lib/plugins/sparkline/jquery.sparkline.min.js"></script>
<script src="../lib/plugins/jvectormap/jquery-jvectormap-1.2.2.min.js"></script>
<script src="../lib/plugins/jvectormap/jquery-jvectormap-world-mill-en.js"></script>
<script src="../lib/plugins/knob/jquery.knob.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.11.2/moment.min.js"></script>
<script src="../lib/plugins/daterangepicker/daterangepicker.js"></script>
<script src="../lib/plugins/datepicker/bootstrap-datepicker.js"></script>
<script src="../lib/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.all.min.js"></script>
<script src="../lib/plugins/slimScroll/jquery.slimscroll.min.js"></script>
<script src="../lib/plugins/fastclick/fastclick.js"></script>
<script src="../lib/dist/js/app.min.js"></script>
<script src="../lib/dist/js/pages/dashboard.js"></script>
<script src="../lib/dist/js/demo.js"></script>
</body>
</html>
