<%@ page import="model.Projet" %>
<%@ page import="dataAccess.ProjetDA" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="model.Categorie_projet" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="dataAccess.Categorie_projetDA" %><%--
  Author: Reda BENCHRAA
  Date: 13/12/2016
  Time: 02:33
--%>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>
<%
    Projet p = (Projet) request.getAttribute("projet");
    ArrayList<Categorie_projet> cps = (ArrayList<Categorie_projet>) request.getAttribute("cps");
%>

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
    <link rel="stylesheet" href="<%=request.getContextPath()%>/lib/plugins/iCheck/all.css">
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
    <script src="<%=request.getContextPath()%>/lib/dist/js/jqeury.form.js"></script>
    <script src="<%=request.getContextPath()%>/lib/dist/js/admin/projet.js"></script>
</head>
<body class="hold-transition skin-purple sidebar-mini fixed">
<jsp:include page="includes/headerAll.jsp"/>
<jsp:include page="includes/sideBarAll.jsp"/>
<div class="wrapper">
    <div class="content-wrapper">
        <section class="content-header">
            <div class="callout callout-info">
                <h5>Projet</h5>
            </div>
        </section>
        <section class="content">
            <div class="box box-primary">
                <div class="box-header with-border">
                    <% if(request.getParameter("action").equals("ajouterProjet")){ %>
                    <h3 class="box-title">Ajoter un projet</h3>
                    <%}else{%>
                    <h3 class="box-title">Modifier un projet</h3>
                    <%}%>
                    <div class="box-tools pull-right">
                        <button type="button" class="btn btn-box-tool" data-widget="collapse"><i
                                class="fa fa-minus"></i>
                        </button>
                    </div>
                </div>
                <div class="box-body">
                    <div class="col-md-12">
                        <form method="POST" action="<%=request.getContextPath()%>/projectController" enctype="multipart/form-data">
                            <input type="text" name="idProjet" value="<%=p.getIdProjet()%>" hidden>
                            <input type="text" name="action" value="<%=request.getParameter("action")%>" hidden >
                            <div class="form-group">
                                <label for="nom">Nom</label>
                                <input type="text" class="form-control" id="nom" placeholder="" name ="nomProjet" value="<%=p.getNomProjet()%>">
                            </div>
                            <div class="form-group">
                                <label for="intro">Introduction sur le projet</label>
                                <input type="text" class="form-control" id="intro" placeholder="" name="projetProjet" value="<%=p.getProjetProjet()%>">
                            </div>
                            <div class="box">
                                <div class="box-header">
                                    <h3 class="box-title">Description du projet</h3>
                                </div>
                                <div class="box-body pad">
                                    <textarea class="textarea" placeholder="Place some text here"
                                              style="width: 100%; height: 200px; font-size: 14px; line-height: 18px; border: 1px solid #dddddd; padding: 10px;" name="descriptionProjet" ><%=p.getDescriptionProjet()%></textarea>
                                </div>
                            </div>

                            <div class="form-group">
                                <label for="exampleInputFile">Image</label>
                                <input type="file" id="exampleInputFile" name="imageProjet">
                            </div>
                            <label>

                                <input type="checkbox" class="icheckbox_minimal-pink" name="etoileProjet" <%if(p.isEtoileProjet()){out.println("checked");}%>>     Etoilé
                            </label>
                            <div class="form-group">
                                <label>Catégorie</label>
                                <select class="form-control select2" style="width: 100%;" name="idProjetCategorie">
                                    <%for (Categorie_projet cp : cps){
                                        if(p.categorie_projet!=null) {
                                            if(cp.getIdProjetCategorie()==p.categorie_projet.getIdProjetCategorie()){%>
                                                <option value="<%=cp.getIdProjetCategorie()%>" selected><%=cp.getNomProjetCategorie()%></option>
                                            <%}else{%>
                                                <option value="<%=cp.getIdProjetCategorie()%>"><%=cp.getNomProjetCategorie()%></option>
                                    <%}
                                        }
                                        else{%>
                                                <option value="<%=cp.getIdProjetCategorie()%>"><%=cp.getNomProjetCategorie()%></option>
                                        <%}
                                    }%>
                                </select>
                            </div>
                            <div class="form-group">
                                <% if(request.getParameter("action").equals("ajouterProjet")){ %>
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


