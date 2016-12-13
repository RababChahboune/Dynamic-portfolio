<%--
  Author: Reda BENCHRAA
  Date: 12/12/2016
  Time: 18:42
--%>
<!-- Project category list in dashboard -->
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
                    <tr>
                        <td>Fancy</td>
                        <td>shit</td>
                        <td>
                            <a href=""><span class="label label-info">Modifier</span></a>
                            <a href=""> <span class="label label-danger">Supprimer</span></a>
                        </td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </div>
        <div class="box-footer clearfix">
            <a href="catégorieProjet.jsp" class="btn btn-sm btn-default btn-flat pull-right">Ajouter une catégories</a>
        </div>
    </div>
</div>
