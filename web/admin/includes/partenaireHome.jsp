<%@ page import="model.Administrateur" %>
<%@ page import="dataAccess.AdministrateurDA" %>
<%@ page import="model.Experience" %><%--
  Author: Reda BENCHRAA
  Date: 12/12/2016
  Time: 18:42
--%>
<!-- Partner list in dashboard -->
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%!
    Administrateur administrateur;
%>
<%
    administrateur = AdministrateurDA.getAdministrateur();
%>
<div class="col-md-8">
    <div class="box box-info">
        <div class="box-header with-border">
            <h3 class="box-title">Les partenaires</h3>
            <div class="box-tools pull-right">
                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>
            </div>
        </div>
        <div class="box-body no-padding" >
            <ul class="users-list clearfix menu">
                <% for(Experience experience : administrateur.getExperience()){ %>
                <li>
                    <a href="partenaire.jsp?action=supprimerExperience&id=<%=experience.getIdExperience()%>"><span class="label label-danger pull-right"><span class="fa fa-times"></span></span></a>
                    <a href="partenaire.jsp?action=modifierExperience&id=<%=experience.getIdExperience()%>"><span class="label label-info pull-right"><span class="fa fa-pencil"></span></span></a>
                    <img src="../lib/dist/img/partenaire/<% if(!experience.getLogoExperience().equals("0")) out.print(experience.getLogoExperience()); else out.print("default.png");%>" width=150 alt="partenaire Image">
                    <a class="users-list-name" href="#"><%=experience.getNomExperience()%></a>
                </li>
                <%}%>
            </ul>
        </div>
        <div class="box-footer text-center">
            <a href="partenaire.jsp?action=ajouterPartenaire" class="btn btn-sm btn-default btn-flat pull-right">Ajoter un partenaire</a>
        </div>
    </div>
</div>
