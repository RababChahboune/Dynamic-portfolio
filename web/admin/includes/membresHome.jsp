<%--
  Author: Reda BENCHRAA
  Date: 12/12/2016
  Time: 18:40
--%>
<!-- Members list in dashboard -->
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="col-md-12">
    <!-- USERS LIST -->
    <div class="box box-danger">
        <div class="box-header with-border">
            <h3 class="box-title">Les membres</h3>
            <div class="box-tools pull-right">
                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
                </button>
            </div>
        </div>
        <div class="box-body no-padding">
            <ul class="users-list clearfix menu">
                <li>
                    <img src="../lib/dist/img/user3-128x128.jpg" alt="User Image">
                    <a class="users-list-name" href="#">Nadia</a>
                    <span class="users-list-date">15 Jan</span>
                </li>
            </ul>
        </div>
        <div class="box-footer text-center">
            <a href="membre.jsp" class="btn btn-sm btn-default btn-flat pull-right">Ajoter un membre</a>
        </div>
    </div>
</div>
