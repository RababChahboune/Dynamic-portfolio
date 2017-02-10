<%@ page import="model.Administrateur" %>
<%@ page import="dataAccess.AdministrateurDA" %>
<%@ page import="model.Experience" %><%--
  Author: Reda BENCHRAA
  Date: 12/12/2016
  Time: 18:42
--%>
<!-- Partner list in dashboard -->
<%@ page contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />

<%Administrateur administrateur = (Administrateur) request.getAttribute("administrateur");%>
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
                    <a href="<%=request.getContextPath()%>/experienceController?action=supprimerExperience&id=<%=experience.getIdExperience()%>"><span class="label label-danger pull-right"><span class="fa fa-times"></span></span></a>
                    <a href="<%=request.getContextPath()%>/experienceController?action=modifierExperience&id=<%=experience.getIdExperience()%>"><span class="label label-info pull-right"><span class="fa fa-pencil"></span></span></a>
                    <img src="<%=request.getContextPath()%>/lib/dist/img/partenaire/<% if(!experience.getLogoExperience().equals("0")) out.print(experience.getLogoExperience()); else out.print("default.png");%>" width=150 alt="partenaire Image">
                    <a class="users-list-name" href="#"><%=experience.getNomExperience()%></a>
                </li>
                <%}%>
            </ul>
        </div>
        <div class="box-footer text-center">
            <a href="<%=request.getContextPath()%>/experienceController?action=ajouterExperience" class="btn btn-sm btn-default btn-flat pull-right">Ajoter un partenaire</a>
        </div>
    </div>
</div>
