<%--
  Author: Reda BENCHRAA
  Date: 12/12/2016
  Time: 23:30
--%>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Information du portfolio</title>
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/lib/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/lib/dist/css/AdminLTE.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/lib/dist/css/skins/_all-skins.min.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/lib/plugins/iCheck/flat/blue.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/lib/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.min.css">
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
    <script src="<%=request.getContextPath()%>/lib/plugins/jQuery/jquery-2.2.3.min.js"></script>
    <script src="https://code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
    <script>
        $.widget.bridge('uibutton', $.ui.button);
    </script>
    <script src="<%=request.getContextPath()%>/lib/bootstrap/js/bootstrap.min.js"></script>
    <script src="http://cdnjs.cloudflare.com/ajax/libs/raphael/2.1.0/raphael-min.js"></script>
    <script src="<%=request.getContextPath()%>/lib/plugins/morris/morris.min.js"></script>
    <script src="<%=request.getContextPath()%>/lib/plugins/sparkline/jquery.sparkline.min.js"></script>
    <script src="<%=request.getContextPath()%>/lib/plugins/jvectormap/jquery-jvectormap-1.2.2.min.js"></script>
    <script src="<%=request.getContextPath()%>/lib/plugins/jvectormap/jquery-jvectormap-world-mill-en.js"></script>
    <script src="<%=request.getContextPath()%>/lib/plugins/knob/jquery.knob.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.11.2/moment.min.js"></script>
    <script src="<%=request.getContextPath()%>/lib/plugins/daterangepicker/daterangepicker.js"></script>
    <script src="<%=request.getContextPath()%>/lib/plugins/datepicker/bootstrap-datepicker.js"></script>
    <script src="<%=request.getContextPath()%>/lib/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.all.min.js"></script>
    <script src="<%=request.getContextPath()%>/lib/plugins/slimScroll/jquery.slimscroll.min.js"></script>
    <script src="<%=request.getContextPath()%>/lib/plugins/fastclick/fastclick.js"></script>
    <script src="<%=request.getContextPath()%>/lib/dist/js/app.min.js"></script>
    <script src="<%=request.getContextPath()%>/lib/dist/js/pages/dashboard.js"></script>
    <script src="<%=request.getContextPath()%>/lib/dist/js/demo.js"></script>
    <script src="<%=request.getContextPath()%>/lib/dist/js/admin/admin.js"></script>
</head>
<body class="hold-transition skin-purple sidebar-mini fixed">
<jsp:include page="includes/headerAll.jsp"/>
<jsp:include page="includes/sideBarAll.jsp"/>
<div class="wrapper">
    <div class="content-wrapper">
        <section class="content-header">
            <div class="callout callout-danger">
                <h5>Administrateur</h5>
            </div>
        </section>
        <section class="content">
            <div class="example-modal">
                <div class="modal">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h4 class="modal-title">Modifier les information de l'administrateur </h4>
                            </div>
                            <div class="modal-body">
                                <form method="POST" action="<%=request.getContextPath()%>/administrateurController" role="form">
                                    <div class="box-body">
                                        <div class="row">
                                            <div class="col-xs-6">
                                                <input type="text" class="form-control" name="oldUsername"placeholder="Ancient nom d'utilisateur">
                                            </div>
                                            <div class="col-xs-6">
                                                <input type="password" class="form-control" name="oldPassword"placeholder="Ancient mot de passe">
                                            </div>
                                            </div><br>
                                        <div class="row">
                                            <div class="col-xs-6">
                                                <input type="text" class="form-control" name="newUsername"placeholder="Nouveau nom d'utilisateur">
                                            </div>
                                            <div class="col-xs-6">
                                                <input type="password" class="form-control" name="newPassword"placeholder="Nouveau mot de passe">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="box-footer">
                                        <button id="submit" type="submit" class="btn btn-danger pull-right">Sauvgarder les changements</button>
                                        <button id="return" type="button" class="btn btn-default pull-left" data-dismiss="modal">Retour</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>
    <jsp:include page="includes/footerAll.jsp"/>
</div>
</body>
</html>
