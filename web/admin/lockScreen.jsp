<%--
  Author: Reda BENCHRAA
  Date: 11/12/2016
  Time: 23:44
--%>
<%@ page contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>
<html>
<head>
    <title>Title</title>
</head>
<body>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Log in</title>
    <!-- Tell the browser to be responsive to screen width -->
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <!-- Bootstrap 3.3.6 -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/lib/bootstrap/css/bootstrap.min.css">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
    <!-- Ionicons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
    <!-- Theme style -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/lib/dist/css/AdminLTE.css">
    <!-- iCheck -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/lib/plugins/iCheck/square/blue.css">

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
            <img src="<%=request.getContextPath()%>/lib/dist/img/logo.png" width="164" height="164">
        </div>
        <form action="<%=request.getContextPath()%>/loginController" method="post">
            <div class="form-group has-feedback">
                <input type="text" value="lockScreen" name ="action" hidden>
                <input type="password" class="form-control" placeholder="Mot de passe" name="password">
                <span class="glyphicon glyphicon-user form-control-feedback"></span>
            </div>

            <div class="row">

                <!-- /.col -->
                <div class="col-xs-12">
                    <button type="submit" class="btn btn-primary btn-block btn-flat">Ouvrir la session</button>
                </div>
            </div>
        </form>
    </div>
    <!-- /.login-box-body -->
</div>
<!-- /.login-box -->

<!-- jQuery 2.2.3 -->
<script src="<%=request.getContextPath()%>/lib/plugins/jQuery/jquery-2.2.3.min.js"></script>
<!-- Bootstrap 3.3.6 -->
<script src="<%=request.getContextPath()%>/lib/bootstrap/js/bootstrap.min.js"></script>
<!-- iCheck -->
<script src="<%=request.getContextPath()%>/lib/plugins/iCheck/icheck.min.js"></script>
</body>
</html>

</body>
</html>
