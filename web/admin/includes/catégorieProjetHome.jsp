<%@ page import="model.Categorie_projet" %>
<%@ page import="model.Administrateur" %>
<%@ page import="dataAccess.AdministrateurDA" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="dataAccess.Categorie_projetDA" %><%--
  Author: Reda BENCHRAA
  Date: 12/12/2016
  Time: 18:42
--%>
<!-- Project category list in dashboard -->
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%!
    ArrayList<Categorie_projet> cat;
%>
<%
    cat = Categorie_projetDA.getCategorie_projetList();
%>
<div class="col-md-4">
    <div class="box box-info">
        <div class="box-header with-border">
            <h3 class="box-title">Les catégories des projets</h3>
            <div class="box-tools pull-right">
                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
                </button>
            </div>
        </div>
        <!-- /.box-header -->
        <div class="box-body menu">
            <div class="table-responsive">
                <table class="table no-margin">
                    <thead>
                    <tr>
                        <th>Nom catégories</th>
                        <th>Description</th>
                        <th>Options</th>
                    </tr>
                    </thead>
                    <tbody>
                    <% for(Categorie_projet p : cat){%>
                    <tr>
                        <td><%=p.getNomProjetCategorie()%></td>
                        <td><%=p.getDescriptionProjetCategorie()%></td>
                        <td>
                            <a href="categorieProjet.jsp?action=modifierCategorieProjet&id=<%=p.getIdProjetCategorie()%>"><span class="label label-info"> <span class="fa fa-pencil"></span></span></a>
                            <a href="categorieProjet.jsp?action=supprimerCategorieProjet&id=<%=p.getIdProjetCategorie()%>"> <span class="label label-danger"><span class="fa fa-times"></span></span></a>
                        </td>
                    </tr>
                    <%}%>
                    </tbody>
                </table>
            </div>
        </div>
        <div class="box-footer clearfix">
            <a href="categorieProjet.jsp?action=ajouterCategorieProjet" class="btn btn-sm btn-default btn-flat pull-right">Ajouter une catégories</a>
        </div>
    </div>
</div>
