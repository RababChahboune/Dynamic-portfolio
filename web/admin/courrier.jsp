<%@ page import="model.Courrier" %>
<%@ page import="dataAccess.courrierDA" %>
<%@ page import="java.util.ArrayList" %>
<%--
  Author: Reda BENCHRAA
  Date: 12/12/2016
  Time: 22:58
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="includes/verificationAll.jsp"/>
<%!
    ArrayList<Courrier> list;
%>
<%
    list= courrierDA.getCourrierList();
%>
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
    <script src="../lib/dist/js/admin/courrier.js"></script>
</head>
<body class="hold-transition skin-purple sidebar-mini fixed">
<jsp:include page="includes/verificationAll.jsp" />
<jsp:include page="includes/headerAll.jsp"/>
<jsp:include page="includes/sideBarAll.jsp"/>
<div class="wrapper">
    <div class="content-wrapper">
        <section class="content-header">
            <div class="callout callout-success">
                <h5>2 Courriers reçus</h5>
            </div>
        </section>
        <section class="content">
            <div class="row">
                <div class="col-md-5">
                    <div class="box box-success">
                        <div class="box-header with-border">
                            <h3 class="box-title">Boîte de réception</h3>
                            <div class="box-tools pull-right">
                                <div class="has-feedback">
                                    <input type="text" class="form-control input-sm" placeholder="Search Mail">
                                    <span class="glyphicon glyphicon-search form-control-feedback"></span>
                                </div>
                            </div>
                            <button type="button" id="deleteAll" class="btn btn-default btn-sm "><i class="fa fa-trash-o"></i></button>
                        </div>
                        <div class="box-body no-padding">
                            <div class="table-responsive mailbox-messages">
                                <table class="table table-hover table-striped">
                                    <tbody id="idCour">
                                    <% for(Courrier cr : list){%>
                                    <tr>
                                        <td><input type="checkbox"  value="<%=cr.getIdCourrier()%>"></td>
                                        <td class="mailbox-name" id="<%=cr.getIdCourrier()%>"><a href="#"><%=cr.getNomComplet()%></a></td>
                                        <td class="mailbox-date"><%=cr.getDateEnvoieCourrier()%></td>
                                    </tr>
                                    <%}%>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-7">
                    <div class="box box-success">
                        <div class="box-header with-border">
                            <h3 class="box-title">Lire le courrier</h3>
                            <input hidden type="text" name="idCourrier" id="idCourrier">
                            <div class="box-tools pull-right">
                                <a href="#" class="btn btn-box-tool" data-toggle="tooltip" title="Précédent"><i class="fa fa-chevron-left"></i></a>
                                <a href="#" class="btn btn-box-tool" data-toggle="tooltip" title="Suivant"><i class="fa fa-chevron-right"></i></a>
                            </div>
                        </div>
                        <div class="box-body no-padding">
                            <div class="mailbox-read-info">
                                <h3>Sujet : <span id="sujetCourrier"></span></h3>
                                <h5>De : <span id="nomCompletCourrier"></span> - <span id="emailCourrier"></span><span class="mailbox-read-time pull-right" id="dateCourrier"></span></h5>
                            </div>
                            <div class="mailbox-read-message" id="messageCourrier">

                            </div>
                        </div>
                        <div class="box-footer">
                            <a id="deleteButton" class="btn btn-default" href=""><i class="fa fa-trash-o"></i> Delete</a>
                            <button id="printButton"type="button" class="btn btn-default"><i class="fa fa-print"></i> Print</button>
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
