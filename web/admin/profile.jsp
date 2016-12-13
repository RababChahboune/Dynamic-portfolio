<%--
  Author: Reda BENCHRAA
  Date: 13/12/2016
  Time: 20:16
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
                                 src="../lib/dist/img/user4-128x128.jpg" alt="User profile picture">
                            <h3 class="profile-username text-center">Nom Prenom</h3>
                            <h3 class="profile-username text-center">email</h3>
                        </div>
                    </div>
                    <div class="box box-info">
                        <div class="box-header with-border">
                            <h3 class="box-title">À propos</h3>
                        </div>
                        <div class="box-body">
                            <strong><i class="fa fa-book margin-r-5"></i> Cursus</strong>
                            <p class="text-muted">
                                Cursus 1
                            </p>
                            <p class="text-muted">
                                Cursus 2
                            </p>
                            <hr>
                            <strong><i class="fa fa-pencil margin-r-5"></i> Compétance</strong>
                            <p>
                                <span class="label label-danger">Compétance 1</span>
                                <span class="label label-warning">Compétance 2</span>
                            </p>
                            <hr>
                            <strong><i class="fa fa-map-marker margin-r-5"></i> Lien</strong>
                            <p>
                                <a href="link"><span class="label label-danger"><img width="25px"
                                                                                     src="../lib/dist/img/logo0.png"/>facebook</span></a>
                                <a href="link"><span class="label label-danger"><img width="25px"
                                                                                     src="../lib/dist/img/logo0.png"/>facebook</span></a>
                                <a href="link"><span class="label label-danger"><img width="25px"
                                                                                     src="../lib/dist/img/logo0.png"/>facebook</span></a>
                            </p>
                            <hr>
                            <strong><i class="fa fa-file-text-o margin-r-5"></i> Biographie</strong>
                            <p>Biography content</p>
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
                                <form class="form-horizontal">
                                    <div class="form-group">
                                        <label for="inputNominformation" class="col-sm-2 control-label">Nom</label>
                                        <div class="col-sm-10">
                                            <input type="text" class="form-control" id="inputNominformation"
                                                   placeholder="Nom">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="inputPrenominformation"
                                               class="col-sm-2 control-label">Prenom</label>
                                        <div class="col-sm-10">
                                            <input type="text" class="form-control" id="inputPrenominformation"
                                                   placeholder="Prenom">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="inputemailinformation" class="col-sm-2 control-label">Email</label>
                                        <div class="col-sm-10">
                                            <input type="email" class="form-control" id="inputemailinformation"
                                                   placeholder="Email">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="inputTelethoneinformation"
                                               class="col-sm-2 control-label">Telephone</label>

                                        <div class="col-sm-10">
                                            <input type="text" class="form-control" id="inputTelethoneinformation"
                                                   placeholder="Numéro du telephone">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="inputBiographieinformation" class="col-sm-2 control-label">Biographie</label>
                                        <div class="col-sm-10">
                                    <textarea  id="inputBiographieinformation" class="form-control" rows="3">
                                    </textarea>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="inputImageinformation" class="col-sm-2 control-label">Image de
                                            profile</label>
                                        <div class="col-sm-10">
                                            <input type="file" id="inputImageinformation">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="col-sm-offset-2 col-sm-10">
                                            <button type="submit" class="btn btn-info">Enregistrer les modifications
                                            </button>
                                        </div>
                                    </div>
                                </form>
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
                                                            <th>Nom</th>
                                                            <th>Début</th>
                                                            <th>Fin</th>
                                                            <th>Etablissement</th>
                                                            <th>Remarque</th>
                                                            <th>Option</th>
                                                        </tr>
                                                        </thead>
                                                        <tbody>
                                                        <tr>
                                                            <td>Software engenering</td>
                                                            <td>2015</td>
                                                            <td>Présent</td>
                                                            <td>Ensias</td>
                                                            <td>JAVA,C++</td>
                                                            <td>
                                                                <a href=""><span class="label label-info"><span
                                                                        class="fa fa-pencil"></span></span></a>
                                                                <a href=""> <span class="label label-danger"><span
                                                                        class="fa fa-times"></span></span></a>
                                                            </td>
                                                        </tr>
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-xs-4">
                                        <div class="box box-info">

                                            <div class="box-body">
                                                <form class="form-horizontal">
                                                    <div class="form-group">
                                                        <label for="inputNomCursus"
                                                               class="col-sm-2 control-label"></label>
                                                        <div class="col-sm-10">
                                                            <input type="email" class="form-control" id="inputNomCursus"
                                                                   placeholder="Nom">
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="inputDateDcursus"
                                                               class="col-sm-2 control-label"></label>
                                                        <div class="col-sm-10">
                                                            <input type="email" class="form-control"
                                                                   id="inputDateDcursus" placeholder="JJ/MM/AAAA">
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="inputDateFcursus"
                                                               class="col-sm-2 control-label"></label>
                                                        <div class="col-sm-10">
                                                            <input type="email" class="form-control"
                                                                   id="inputDateFcursus" placeholder="JJ/MM/AAAA">
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="inputEtablissementcursus"
                                                               class="col-sm-2 control-label"></label>
                                                        <div class="col-sm-10">
                                                            <input type="text" class="form-control"
                                                                   id="inputEtablissementcursus"
                                                                   placeholder="Etablissemet">
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="inputRemarquecursus"
                                                               class="col-sm-2 control-label"></label>
                                                        <div class="col-sm-10">
                                                            <input type="text" class="form-control"
                                                                   id="inputRemarquecursus" placeholder=Remarque>
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <div class="col-sm-offset-2 col-sm-10">
                                                            <button type="submit" class="btn btn-info">Enregistrer
                                                            </button>
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
                                                            <th>Nom</th>
                                                            <th>Pourcentage</th>
                                                            <th>Options</th>
                                                        </tr>
                                                        </thead>
                                                        <tbody>
                                                        <tr>
                                                            <td>Css3</td>
                                                            <td>
                                                                <div class="progress">
                                                                    <div class="progress-bar progress-bar-info progress-bar-striped"
                                                                         role="progressbar" aria-valuenow="40"
                                                                         aria-valuemin="0" aria-valuemax="100"
                                                                         style="width: 40%">
                                                                        <span class="sr-only">40% Complete (warning)</span>
                                                                    </div>
                                                                </div>
                                                            </td>
                                                            <td>
                                                                <a href=""><span class="label label-info"><span
                                                                        class="fa fa-pencil"></span></span></a>
                                                                <a href=""> <span class="label label-danger"><span
                                                                        class="fa fa-times"></span></span></a>
                                                            </td>
                                                        </tr>
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-xs-6">
                                        <form class="form-horizontal">
                                            <div class="form-group">
                                                <label for="inputNomcompétance"
                                                       class="col-sm-2 control-label">Nom</label>
                                                <div class="col-sm-10">
                                                    <input type="email" class="form-control" id="inputNomcompétance"
                                                           placeholder="Nom">
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="inputPourcentagecompétance" class="col-sm-2 control-label">Pourcentage</label>
                                                <div class="col-sm-10">
                                                    <input type="range" min="0" max="100" class="form-control"
                                                           id="inputPourcentagecompétance" placeholder="">
                                                </div>
                                            </div>
                                            <div class="col-sm-offset-2 col-sm-10">
                                                <button type="submit" class="btn btn-info">Enregistrer</button>
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
                                                            <th>Nom</th>
                                                            <th>Photo</th>
                                                        </tr>
                                                        </thead>
                                                        <tbody>
                                                        <tr>
                                                            <td>
                                                                <a target="_blank" href="https  ://github.com/redb3n">Github</a>
                                                            </td>
                                                            <td>
                                                                <img src="../lib/dist/img/logo.png" width="25px">
                                                            </td>
                                                            <td>
                                                                <a href=""><span class="label label-info"><span class="fa fa-pencil"></span></span></a>
                                                                <a href=""> <span class="label label-danger"><span class="fa fa-times"></span></span></a>
                                                            </td>
                                                        </tr>
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-xs-6">
                                        <form class="form-horizontal">
                                            <div class="form-group">
                                                <label for="inputNomlien" class="col-sm-2 control-label">Nom</label>
                                                <div class="col-sm-10">
                                                    <input type="email" class="form-control" id="inputNomlien" placeholder="Nom">
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="inputUrllien" class="col-sm-2 control-label">Url</label>
                                                <div class="col-sm-10">
                                                    <input type="email" class="form-control" id="inputUrllien" placeholder="Nom">
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="inputImagelien" class="col-sm-2 control-label">Image</label>
                                                <div class="col-sm-10">
                                                    <input type="file" class="form-control" id="inputImagelien" placeholder="">
                                                </div>
                                            </div>
                                            <div class="col-sm-offset-2 col-sm-10">
                                                <button type="submit" class="btn btn-info">Enregistrer</button>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- /.tab-content -->
                </div>
                <!-- /.nav-tabs-custom -->
            </div>
            <!-- /.col -->
        </section>

    </div>
    <jsp:include page="includes/footerAll.jsp"/>
</div>
</body>
</html>


