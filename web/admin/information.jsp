<%@ page import="model.Portfolio" %>
<%@ page import="dataAccess.portfolioDA" %>
<%@ page import="model.Domaine" %>
<%@ page import="dataAccess.domaineDA" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.util.ArrayList" %><%--
  Author: Reda BENCHRAA
  Date: 12/12/2016
  Time: 21:51
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="includes/verificationAll.jsp"/>
<%!
    ArrayList<Domaine> d;
    Portfolio p;
%>
<%
    try {
        p = portfolioDA.getPortfolio();
        d = domaineDA.getDomaineList();
    } catch (SQLException e) {
        e.printStackTrace();
    }
%>
>>>>>>> 48ada0d59f7b0eb6d01bcb29f809ca5f09f656fd
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Information du portfolio</title>
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
    <script src="../lib/dist/js/admin/information.js"></script>
    <script src="../lib/dist/js/jqeury.form.js"></script>
</head>
<body class="hold-transition skin-purple sidebar-mini fixed">
<jsp:include page="includes/headerAll.jsp"/>
<jsp:include page="includes/sideBarAll.jsp"/>
<div class="wrapper">
    <div class="content-wrapper">
        <section class="content-header">
            <div class="callout callout-warning">
                <h5>Information du portfolio</h5>
            </div>
        </section>
        <section class="content">
            <div class="row">
                <div class="col-md-4">
                    <div class="box box-warning">
                        <div class="box-body box-profile">
                            <img class="profile-user-img img-responsive img-"
                                 src="../lib/dist/img/portfolio/<%=p.getLogoPortfolio()%>" alt="User profile picture">
                            <h3 class="profile-username text-center"><%=p.getNomPortfolio()%></h3>
                        </div>
                    </div>
                    <div class="box box-warning">
                        <div class="box-header with-border">
                            <h3 class="box-title">Informations</h3>
                        </div>
                        <div class="box-body">
                            <strong><i class="fa fa-book margin-r-5"></i> Salutation</strong>
                            <p class="text-muted"><%=p.getSalutationPortfolio()%></p>
                            <hr>
                            <strong><i class="fa fa-file-text-o margin-r-5"></i> A propos</strong>
                            <p class="text-muted"><%=p.getaProposPortfolio()%></p>
                            <hr>
                            <strong><i class="fa fa-pencil margin-r-5"></i> Domaines</strong>
                            <p>
                                <%for(Domaine domaine : d){%>
                                <span class="label label-danger"><%=domaine.getNomDomaine()%></span>
                                <%}%>
                            </p>
                        </div>
                    </div>
                </div>
                <div class="col-md-8">
                    <div class="box box-warning">
                        <div class="box-header with-border">
                            <h3 class="box-title">Modifier les informations</h3>
                        </div>
                        <form method="POST" action="../portfolioController"  enctype="multipart/form-data">
                            <div class="box-body">
                                <div class="form-group">
                                    <label>Nom</label>
                                    <input name="nomPortfolio" type="text" class="form-control" placeholder="Entrer le nom du protfolio" value="<%=p.getNomPortfolio()%>">
                                </div>
                                <div class="form-group">
                                    <label>Salutation</label>
                                    <input name="salutationPortfolio" type="text" class="form-control" placeholder="Entrer la salutation" value="<%=p.getSalutationPortfolio()%>">
                                </div>
                                <div class="form-group">
                                    <label>A propos </label>
                                    <textarea name="aProposPortfolio" class="form-control" rows="3" placeholder="Entrer des information sur vous"><%=p.getaProposPortfolio()%></textarea>

                                </div>
                                <div class="form-group">
                                    <label>Logo</label>
                                    <input type="file" name="logoPortfolio" />
                                </div>
                            </div>
                            <div class="box-footer">
                                <button type="submit" class="btn btn-warning">Enregistrer</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </section>
    </div>
    <jsp:include page="includes/footerAll.jsp"/>
</div>
</body>
</html>
