<%@ page import="model.Projet" %>
<%@ page import="model.Administrateur" %>
<%@ page import="dataAccess.AdministrateurDA" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="dataAccess.ProjetDA" %><%--
  Author: Reda BENCHRAA
  Date: 12/12/2016
  Time: 18:41
--%>
<!-- Project list in dashboard -->
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%!
    Administrateur administrateur;
%>
<%
    administrateur = AdministrateurDA.getAdministrateur();
    System.out.printf(administrateur.getProjet().size()+"");
%>
<div class="col-md-8">
    <div class="box box-info">
        <div class="box-header with-border">
            <h3 class="box-title">Les projets</h3>
            <div class="box-tools pull-right">
                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
                </button>
            </div>
        </div>
        <div class="box-body menu">
            <div class="table-responsive">
                <table class="table no-margin">
                    <thead>
                    <tr>
                        <th>Nom projet</th>
                        <th>Description</th>
                        <th>Eloilé</th>
                        <th>Catégorie</th>
                        <th>Options</th>
                    </tr>
                    </thead>
                    <tbody>
                    <% for(Projet p: administrateur.getProjet()){ %>

                    <tr>
                        <td><%=p.getNomProjet()%></td>
                        <td><%=p.getDescriptionProjet()%></td>
                        <td><a href=""><span class="label label-<% if(p.isEtoileProjet()) out.print("warning");else out.print("default");%>"><span class="fa fa-star"></span></span></a></td>
                        <td><%=p.getCategorie_projet().getNomProjetCategorie()%></td>
                        <td>
                            <a href="projet.jsp?action=modifierProjet&id=<%=p.getIdProjet()%>"><span class="label label-info"><span class="fa fa-pencil"></span></span></a>
                            <a href="/DynamicPortfolio/projectController?action=supprimerProjet&id=<%=p.getIdProjet()%>"> <span class="label label-danger"><span class="fa fa-times"></span></span></a>
                        </td>
                    </tr>
                    <%}%>
                    </tbody>
                </table>
            </div>
        </div>
        <div class="box-footer clearfix">
            <a href="projet.jsp?action=ajouterProjet" class="btn btn-sm btn-default btn-flat pull-right">Ajoter un projet</a>
        </div>
    </div>
</div>
