<%@ page import="model.Administrateur" %>
<%@ page import="dataAccess.AdministrateurDA" %>
<%@ page import="model.Profile" %>
<%--
  Author: Reda BENCHRAA
  Date: 12/12/2016
  Time: 18:40
--%>
<!-- -->
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%!
    Administrateur administrateur;
%>
<%
    administrateur = AdministrateurDA.getAdministrateur();
%>
<div class="col-md-12">
    <!-- USERS LIST -->
    <div class="box box-info">
        <div class="box-header with-border">
            <h3 class="box-title">Les membres</h3>
            <div class="box-tools pull-right">
                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
                </button>
            </div>
        </div>
        <!-- /.box-header -->
        <div class="box-body no-padding">
            <ul class="users-list clearfix menu">
                <% for(Profile p : administrateur.getProfile()){%>
                <li>
                    <img src="../lib/dist/img/profile/<% if(!p.getImageProfile().equals("0")) out.print(p.getImageProfile()); else out.print("default.png");%>" width="100" alt="User Image">
                    <a class="users-list-name" href="profile.jsp?id=<%=p.getIdProfile()%>"><%=p.getNomProfile()%> <%=p.getPrenomProfile()%></a>
                    <span class="users-list-date"><%=p.getEmailProfile()%></span>
                </li>
                <% } %>
            </ul>
            <!-- /.users-list -->
        </div>
        <!-- /.box-body -->
        <div class="box-footer text-center">
            <a href="ajouterProfile.jsp" class="btn btn-sm btn-default btn-flat pull-right">Ajoter un membre</a>
        </div>
        <!-- /.box-footer -->
    </div>
    <!--/.box -->
</div>
