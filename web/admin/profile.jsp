<%@ page import="model.Profile" %>
<%@ page import="dataAccess.ProfileDA" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="model.Cursus" %>
<%@ page import="model.Competance" %>
<%@ page import="model.Lien" %>
<%--
  Author: Reda BENCHRAA
  Date: 13/12/2016
  Time: 20:16
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%!
    Profile profile;
%>
<%
    try {
        profile = ProfileDA.findProfile(Integer.parseInt(request.getParameter("id")));
    } catch (SQLException e) {
        e.printStackTrace();
    }
    if(profile == null) profile = new Profile(0);
%>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>information du portfolio</title>
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
    <!-- info: Respond.js doesn't work if you view the page via file:// -->
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
    <script src="../lib/dist/js/admin/profile.js"></script>
</head>
<body class="hold-transition skin-purple sidebar-mini fixed">
<jsp:include page="includes/headerAll.jsp"/>
<jsp:include page="includes/sideBarAll.jsp"/>
<div class="wrapper">
    <div class="content-wrapper">
        <section class="content-header">
            <div class="callout callout-info">
                <h5>Profile</h5>
            </div>
        </section>
        <section class="content">
            <div class="row">
                <div class="col-md-3">
                    <div class="box box-info">
                        <div class="box-body box-profile">
                            <img class="profile-user-img img-responsive img-circle"
                                 src="../lib/dist/img/profile/<%=profile.getImageProfile()%>" alt="User profile picture">
                            <h3 class="profile-username text-center"><%=profile.getNomProfile()%> <%=profile.getPrenomProfile()%></h3>
                            <h3 class="profile-username text-center"><%=profile.getEmailProfile()%></h3>
                        </div>
                    </div>
                    <div class="box box-info">
                        <div class="box-header with-border">
                            <h3 class="box-title">À propos</h3>
                        </div>
                        <div class="box-body">
                            <strong><i class="fa fa-book margin-r-5"></i> Cursus</strong>
                            <% for(Cursus c : profile.getCursus()){%>
                                <p class="text-muted">
                                    <%=c.getNomCursus()%>
                                </p>
                            <%}%>
                            <hr>
                            <strong><i class="fa fa-pencil margin-r-5"></i> Compétance</strong>
                            <p>
                                <%for(Competance c:profile.getCompetance()){%>
                                <span class="label label-danger"><%=c.getNomCompetance()%></span>
                                <%}%>
                            </p>
                            <hr>
                            <strong><i class="fa fa-map-marker margin-r-5"></i> Lien</strong>
                            <p>
                                <%for(Lien l : profile.getLien()){%>
                                <a href="<%=l.getUrlLien()%>"><span class="label label-danger">
                                    <img width="25px" src="../lib/dist/img/lien/<%=l.getImageLien()%>"/><%=l.getNomLien()%></span></a>
                                <%}%>
                            </p>
                            <hr>
                            <strong><i class="fa fa-file-text-o margin-r-5"></i> Biographie</strong>
                            <p><%=profile.getBiographieProfile()%></p>
                        </div>
                    </div>
                </div>
                <div class="col-md-9">
                    <div class="nav-tabs-custom">
                        <ul class="nav nav-tabs">
                            <li class="active"><a href="#information" data-toggle="tab">information</a></li>
                            <li><a href="#cursus" data-toggle="tab">Cursus</a></li>
                            <li><a href="#compétance" data-toggle="tab">Compétance</a></li>
                            <li><a href="#lien" data-toggle="tab">Lien</a></li>
                        </ul>
                        <div class="tab-content">
                            <div class="active tab-pane" id="information">
                                <div class="row">
                                    <form class="formInformation" method="POST" action="../profileController"  enctype="multipart/form-data">
                                        <input hidden name="idProfile" value="<%=request.getParameter("id")%>">
                                        <input hidden name="action" value="modifierProfile">
                                        <div class="form-group">
                                            <label class="col-sm-2 control-label">Nom</label>
                                            <div class="col-sm-10">
                                                <input type="text" class="form-control" name="nomProfile" value="<%=profile.getNomProfile()%>" placeholder="Nom">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-2 control-label">Prenom</label>
                                            <div class="col-sm-10">
                                                <input type="text" class="form-control" name="prenomProfile" value="<%=profile.getPrenomProfile()%>" placeholder="Nom">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-2 control-label">Email</label>
                                            <div class="col-sm-10">
                                                <input type="text" class="form-control" name="emailProfile" value="<%=profile.getEmailProfile()%>" placeholder="Nom">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-2 control-label">Telephone</label>
                                            <div class="col-sm-10">
                                                <input type="text" class="form-control" name="telephoneProfile" value="<%=profile.getTelephoneProfile()%>" placeholder="Nom">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-2 control-label">Biographie</label>
                                            <div class="col-sm-10">
                                                <textarea  name="biographieProfile" class="form-control" rows="3"><%=profile.getBiographieProfile()%></textarea>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-2 control-label">Image de profile</label>
                                            <div class="col-sm-10">
                                                <input type="file" name="imageProfile">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="col-sm-offset-2 col-sm-10">
                                                <button name="submitInformation" type="submit" class="btn btn-info">Enregistrer les modifications</button>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                            <div class="tab-pane" id="cursus">
                                <div class="row">
                                    <div class="col-xs-8">
                                        <div class="box box-info">
                                            <div class="box-body">
                                                <div class="table-responsive">
                                                    <table class="table no-margin">
                                                        <thead>
                                                        <tr>
                                                            <th hidden>idCursus</th>
                                                            <th>Nom</th>
                                                            <th>Début</th>
                                                            <th>Fin</th>
                                                            <th>Etablissement</th>
                                                            <th>Remarque</th>
                                                            <th>Option</th>
                                                        </tr>
                                                        </thead>
                                                        <tbody>
                                                        <%for(Cursus c : profile.getCursus()){%>
                                                        <tr>
                                                            <td hidden><%=c.getId_cursus()%></td>
                                                            <td><%=c.getNomCursus()%></td>
                                                            <td><%=c.getAnnee_debutCursus()%></td>
                                                            <td><%=c.getAnnee_finCursus()%></td>
                                                            <td><%=c.getEtablissementCursus()%></td>
                                                            <td><%=c.getRemarqueCursus()%></td>
                                                            <td>
                                                                <a href="#" class="modifierCursus" ><span class="label label-info"><span class="fa fa-pencil"></span></span></a>
                                                                <a href="#" class="supprimerCursus" > <span class="label label-danger"><span class="fa fa-times"></span></span></a>
                                                            </td>
                                                        </tr>
                                                        <%}%>
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-xs-4">
                                        <div class="box box-info">
                                            <div class="box-body">
                                                <form class="formCursus" class="form-horizontal" action="../cursusController" method="POST">
                                                    <input hidden name="actionCursus" value="ajouterCursus">
                                                    <input hidden name="idProfile" value=<%=request.getParameter("id")%>>
                                                    <input hidden name="idCursus" value="0">
                                                    <div class="form-group">
                                                        <div class="col-sm-10">
                                                            <input type="text" class="form-control" name="nomCursus" placeholder="Nom">
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <div class="col-sm-10">
                                                            <input type="text" class="form-control" name="anneeDebutCursus" placeholder="Année de début">
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <div class="col-sm-10">
                                                            <input type="text" class="form-control" name="anneeFinCursus" placeholder="Année de fin">
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <div class="col-sm-10">
                                                            <input type="text" class="form-control" name="etablissementCursus" placeholder="Etablissemet">
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <div class="col-sm-10">
                                                            <input type="text" class="form-control" name="remarqueCursus" placeholder=Remarque>
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <div class="col-sm-offset-2 col-sm-10">
                                                            <button name="submitCursus" type="submit" class="btn btn-info">Enregistrer</button>
                                                        </div>
                                                    </div>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="tab-pane" id="compétance">
                                <div class="row">
                                    <div class="col-xs-6">
                                        <div class="box box-info">
                                            <div class="box-body">
                                                <div class="table-responsive">
                                                    <table class="table no-margin">
                                                        <thead>
                                                        <tr>
                                                            <th hidden>idContétance</th>
                                                            <th>Nom</th>
                                                            <th>Pourcentage</th>
                                                            <th>Options</th>
                                                        </tr>
                                                        </thead>
                                                        <tbody>
                                                        <%for(Competance c :profile.getCompetance()){%>
                                                        <tr>
                                                            <td hidden><%=c.getIdCompetance()%></td>
                                                            <td><%=c.getNomCompetance()%></td>
                                                            <td>
                                                                <div class="progress">
                                                                    <div class="progress-bar progress-bar-info progress-bar-striped" role="progressbar" aria-valuenow="<%=c.getPourcentageCompetance()%>" aria-valuemin="0" aria-valuemax="100" style="width: <%=c.getPourcentageCompetance()%>%">
                                                                        <span class="sr-only"><%=c.getPourcentageCompetance()%>% Complete</span>
                                                                    </div>
                                                                </div>
                                                            </td>
                                                            <td>
                                                                <a class="modifierCompetance" href="#"><span class="label label-info"><span class="fa fa-pencil"></span></span></a>
                                                                <a class="supprimerCompetance" href="#"> <span class="label label-danger"><span class="fa fa-times"></span></span></a>
                                                            </td>
                                                        </tr>
                                                        <%}%>
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-xs-6">
                                        <form class="formCursus" class="form-horizontal" action="../competanceController" method="POST">
                                            <div style="display: none;" class="form-group">
                                                <input hidden name="actionCompetance" value="ajouterCompetance">
                                                <input hidden name="idProfile" value=<%=request.getParameter("id")%>>
                                                <input hidden name="idCompetance" value="0">
                                            </div>
                                            <div class="form-group">
                                                <label class="col-sm-2 control-label">Nom</label>
                                                <div class="col-sm-10">
                                                    <input type="text" class="form-control" name="nomCompetance" placeholder="Nom">
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-sm-2 control-label">Pourcentage</label>
                                                <div class="col-sm-10">
                                                    <input type="range" min="0" max="100" class="form-control" name="pourcentageCompetance" placeholder="">
                                                </div>
                                            </div>
                                            <div class="col-sm-offset-2 col-sm-10">
                                                <button name="submitCompetance" type="submit" class="btn btn-info">Enregistrer</button>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                            <div class="tab-pane" id="lien">
                                <div class="row">
                                    <div class="col-xs-6">
                                        <div class="box box-info">
                                            <div class="box-body">
                                                <div class="table-responsive">
                                                    <table class="table no-margin">
                                                        <thead>
                                                        <tr>
                                                            <th hidden>id</th>
                                                            <th>Nom</th>
                                                            <th>Photo</th>
                                                        </tr>
                                                        </thead>
                                                        <tbody>
                                                        <%for(Lien l : profile.getLien()){%>
                                                        <tr>
                                                            <td hidden><%=l.getIdLien()%></td>
                                                            <td>
                                                                <span hidden><%=l.getUrlLien()%></span>
                                                                <a target="_blank" href="<%=l.getUrlLien()%>" ><%=l.getNomLien()%></a>
                                                            </td>
                                                            <td>
                                                                <img src="../lib/dist/img/lien/<%=l.getImageLien()%>"  width="25px">
                                                            </td>
                                                            <td>
                                                                <a class="modifierLien" href=""><span class="label label-info"><span class="fa fa-pencil"></span></span></a>
                                                                <a class="supprimerLien" href=""> <span class="label label-danger"><span class="fa fa-times"></span></span></a>
                                                            </td>
                                                        </tr>
                                                        <%}%>
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-xs-6">
                                        <form class="formlien" class="form-horizontal" action="../lienController" method="POST" enctype="multipart/form-data">
                                            <div style="display: none;" class="form-group">
                                                <input hidden name="actionLien" value="ajouterLien">
                                                <input hidden name="idProfile" value="<%=request.getParameter("id")%>">
                                                <input hidden name="idLien" value="0">
                                            </div>
                                            <div class="form-group">
                                                <label class="col-sm-2 control-label">Nom</label>
                                                <div class="col-sm-10">
                                                    <input type="text" class="form-control" name="nomLien" placeholder="Nom">
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-sm-2 control-label">Url</label>
                                                <div class="col-sm-10">
                                                    <input type="text" class="form-control" name="urlLien" placeholder="Url">
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="col-sm-2 control-label">Image</label>
                                                <div class="col-sm-10">
                                                    <input type="file" class="form-control" name="imageLien" placeholder="">
                                                </div>
                                            </div>
                                            <div class="col-sm-offset-2 col-sm-10">
                                                <button id="submitLink" type="submit" class="btn btn-info">Enregistrer</button>
                                            </div>
                                        </form>
                                    </div>
                                </div>
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


