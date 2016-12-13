<%--
  Author: Reda BENCHRAA
  Date: 12/12/2016
  Time: 21:51
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
                                 src="../lib/dist/img/logo.png" alt="User profile picture">
                            <h3 class="profile-username text-center">RR LAB</h3>
                        </div>
                    </div>
                    <div class="box box-warning">
                        <div class="box-header with-border">
                            <h3 class="box-title">Informations</h3>
                        </div>
                        <div class="box-body">
                            <strong><i class="fa fa-book margin-r-5"></i> Salutation</strong>
                            <p class="text-muted">BEYOND IMAGINATION</p>
                            <hr>
                            <strong><i class="fa fa-file-text-o margin-r-5"></i> A propos</strong>
                            <p class="text-muted">We're the best</p>
                            <hr>
                            <strong><i class="fa fa-pencil margin-r-5"></i> Domaines</strong>
                            <p>
                                <span class="label label-danger">3D</span>
                                <span class="label label-primary">3D</span>
                            </p>
                        </div>
                    </div>
                </div>
                <div class="col-md-8">
                    <div class="box box-warning">
                        <div class="box-header with-border">
                            <h3 class="box-title">Modifier les informations</h3>
                        </div>
                        <form role="form">
                            <div class="box-body">
                                <div class="form-group">
                                    <label for="nom">Nom</label>
                                    <input type="text" class="form-control" id="nom" placeholder="Entrer le nom du protfolio">
                                </div>
                                <div class="form-group">
                                    <label for="Salutation">Salutation</label>
                                    <input type="text" class="form-control" id="Salutation" placeholder="Entrer la salutation">
                                </div>
                                <div class="form-group">
                                    <label>A propos </label>
                                    <textarea class="form-control" rows="3" placeholder="Entrer des information sur vous"></textarea>
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
