<%@ page import="model.Administrateur" %>
<%@ page import="dataAccess.AdministrateurDA" %>
<%@ page import="model.Domaine" %><%--
  Author: Reda BENCHRAA
  Date: 12/12/2016
  Time: 18:44
--%>
<!-- Domaine list in dashboard -->
<%@ page contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />

<%!
    Administrateur administrateur;
%>
<%
    administrateur = AdministrateurDA.getAdministrateur();
%>
<div class="col-md-4">
    <!-- PRODUCT LIST -->
    <div class="box box-primary">
        <div class="box-header with-border">
            <h3 class="box-title">Les domaines</h3>
            <div class="box-tools pull-right">
                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
                </button>
            </div>
        </div>
        <div class="box-body">
            <ul class="products-list product-list-in-box menu">
                <% for(Domaine d: administrateur.getDomaine()){ %>
                <li class="item">
                    <a href="<%=request.getContextPath()%>/domaineController?action=supprimerDomaine&id=<%=d.getIdDomaine()%>"><span class="label label-danger pull-right"><span class="fa fa-times"></span></span></a>
                    <a href="<%=request.getContextPath()%>/domaineController?action=modifierDomaine&id=<%=d.getIdDomaine()%>"><span class="label label-info pull-right"><span class="fa fa-pencil"></span></span></a>
                    <div class="product-img">
                        <img src="<%=request.getContextPath()%>/lib/dist/img/domaine/<% if(!d.getImageDomaine().equals("0")) out.print(d.getImageDomaine()); else out.print("default.png");%>" alt="domaine Image">
                    </div>
                    <div class="product-info">
                        <a href="javascript:void(0)" class="product-title">
                            <%=d.getNomDomaine()%>
                        </a>
                        <span class="product-description"><%=d.getDescriptionDomaine()%></span>
                    </div>
                </li>
                <%}%>
            </ul>
        </div>
        <div class="box-footer text-center">
            <a href="<%=request.getContextPath()%>/domaineController?action=ajouterDomaine" class="btn btn-sm btn-default btn-flat pull-right">Ajoter un domaine</a>
        </div>
    </div>
</div>

