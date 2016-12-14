<%@ page import="model.Administrateur" %>
<%@ page import="dataAccess.AdministrateurDA" %><%--
  Author: Reda BENCHRAA
  Date: 11/12/2016
  Time: 22:11
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%!
    Administrateur a;
    Cookie[] cookies;
    boolean foundCookie;
%>
<%
    cookies = request.getCookies();
    if(cookies!=null){
        a = AdministrateurDA.getAdministrateur();
        foundCookie = false;
        for(Cookie c : cookies){
            if(c.getName().equals("username"))
                if(c.getValue().equals(a.getUsername()))
                    foundCookie = true;
        }
        if(foundCookie){
            response.sendRedirect("home.jsp");
        }
    }

%>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Log in</title>
    <!-- Tell the browser to be responsive to screen width -->
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <!-- Bootstrap 3.3.6 -->
    <link rel="stylesheet" href="../lib/bootstrap/css/bootstrap.min.css">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
    <!-- Ionicons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
    <!-- Theme style -->
    <link rel="stylesheet" href="../lib/dist/css/AdminLTE.css">
    <!-- iCheck -->
    <link rel="stylesheet" href="../lib/plugins/iCheck/square/blue.css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body class="hold-transition login-page">
<div class="login-box">

    <!-- /.login-logo -->
    <div class="login-box-body">
        <div class="login-logo">
            <img src="../lib/dist/img/logo.png" width="156" height="156">
        </div>
        <p class="login-box-msg">Dynamic Portfolio</p>

        <form action="../loginController" method="post">
            <input name="action" value="login" hidden>
            <div class="form-group has-feedback">
                <input type="text" class="form-control" placeholder="Nom d'utilisateur" name="username">
                <span class="glyphicon glyphicon-user form-control-feedback"></span>
            </div>
            <div class="form-group has-feedback">
                <input type="password" class="form-control" placeholder="Mot de passe" name="password">
                <span class="glyphicon glyphicon-lock form-control-feedback"></span>
            </div>
            <div class="row">

                <!-- /.col -->
                <div class="col-xs-6">
                    <button type="submit" class="btn btn-primary btn-block btn-flat">Connexion</button>
                </div>
                <!-- /.col -->
                <div class="col-xs-6">
                    <div class="checkbox icheck">
                        <label>
                            <input type="checkbox" name="rememberMe"> Se souvenir de moi
                        </label>
                    </div>
                </div>
            </div>
        </form>
    </div>
    <!-- /.login-box-body -->
</div>
<!-- /.login-box -->

<!-- jQuery 2.2.3 -->
<script src="../lib/plugins/jQuery/jquery-2.2.3.min.js"></script>
<!-- Bootstrap 3.3.6 -->
<script src="../lib/bootstrap/js/bootstrap.min.js"></script>
<!-- iCheck -->
<script src="../lib/plugins/iCheck/icheck.min.js"></script>
<script>
    $(function () {
        $('input').iCheck({
            checkboxClass: 'icheckbox_square-blue',
            radioClass: 'iradio_square-blue',
            increaseArea: '10%' // optional
        });
    });
</script>
</body>
</html>
