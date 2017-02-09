<%@ page import="model.Categorie_projet" %>
<%@ page import="dataAccess.Categorie_projetDA" %>
<%@ page import="java.sql.SQLException" %><%--
  Author: Reda BENCHRAA
  Date: 13/12/2016
  Time: 03:12
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%!
    Categorie_projet cp;
%>
<%
    cp = new Categorie_projet("","","");
    if(request.getParameter("action") != null){
        if(request.getParameter("action").equals("modifierCategorieProjet")){
            try {
                cp = Categorie_projetDA.findCategorie_projet("idProjetCategorie",Integer.parseInt(request.getParameter("id")));
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }else{
        request.getRequestDispatcher("categorieProjet.jsp?action=ajouterCategorieProjet").forward(request,response);
    }
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
    <link rel="stylesheet" href="../lib/plugins/iCheck/all.css">
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
    <script src="../lib/dist/js/jqeury.form.js"></script>
    <script src="../lib/dist/js/admin/catProjet.js"></script>
</head>
<body class="hold-transition skin-purple sidebar-mini fixed">
<jsp:include page="includes/verificationAll.jsp" />
<jsp:include page="includes/headerAll.jsp"/>
<jsp:include page="includes/sideBarAll.jsp"/>
<div class="wrapper">
    <div class="content-wrapper">
        <section class="content-header">
            <div class="callout callout-info">
                <h5>Catégorie projet</h5>
            </div>
        </section>
        <section class="content">
            <div class="box box-primary">
                <div class="box-header with-border">
                    <% if(request.getParameter("action").equals("ajouterCategorieProjet")){ %>
                    <h3 class="box-title">Ajoter une catégorie projet</h3>
                    <%}else{%>
                    <h3 class="box-title">Modifier une catégorie projet</h3>
                    <%}%>
                    <div class="box-tools pull-right">
                        <button type="button" class="btn btn-box-tool" data-widget="collapse"><i
                                class="fa fa-minus"></i>
                        </button>
                    </div>
                </div>
                <div class="box-body">
                    <div class="col-md-12">
                        <form method="POST" action="../catProjectController"  enctype="multipart/form-data">
                            <input type="text" name="idProjetCategorie" value="<%=cp.getIdProjetCategorie()%>" hidden>
                            <input type="text" name="action" value="<%=request.getParameter("action")%>" hidden >
                            <div class="form-group">
                                <label for="nom">Nom</label>
                                <input type="text" class="form-control" id="nom" placeholder="" name="nomProjetCategorie" value="<%=cp.getNomProjetCategorie()%>">
                            </div>
                            <div class="form-group">
                                <label for="Description">Description</label>
                                <input type="text" class="form-control" id="Description" placeholder="" name="descriptionProjetCategorie" value="<%=cp.getDescriptionProjetCategorie()%>">
                            </div>
                            <div class="form-group">
                                <label for="exampleInputFile">Image</label>
                                <input type="file" id="exampleInputFile" name="imageProjetCategorie">
                            </div>
                            <div class="form-group">
                                <% if(request.getParameter("action").equals("ajouterCategorieProjet")){ %>
                                <button type="submit" class="btn btn-sm btn-info btn-flat pull-right">Ajouter</button>
                                <%}else{%>
                                <button type="submit" class="btn btn-sm btn-info btn-flat pull-right">Modifier</button>
                                <%}%>
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


