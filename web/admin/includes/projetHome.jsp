<%--
  Author: Reda BENCHRAA
  Date: 12/12/2016
  Time: 18:41
--%>
<!-- Project list in dashboard -->
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
                    <tr>
                        <td>Fancy</td>
                        <td>shit</td>
                        <td><a href=""><span class="label label-warning"><span class="fa fa-star"></span></span></a></td>
                        <td>3D</td>
                        <td>
                            <a href=""><span class="label label-info"><span class="fa fa-pencil"></span></span></a>
                            <a href=""> <span class="label label-danger"><span class="fa fa-times"></span></span></a>
                        </td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </div>
        <div class="box-footer clearfix">
            <a href="projet.jsp" class="btn btn-sm btn-default btn-flat pull-right">Ajoter un projet</a>
        </div>
    </div>
</div>
