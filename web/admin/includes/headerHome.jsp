<%@ page import="model.Administrateur" %><%--
  Author: Reda BENCHRAA
  Date: 12/12/2016
  Time: 18:09
--%>
<!-- Header Dashboard -->
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="row">
    <div class="col-lg-3 col-xs-6">
        <!-- small box -->
        <div class="small-box bg-purple">
            <div class="inner">
                <h3><%=request.getParameter("nbrProjet")%></h3>
                <p>Projets</p>
            </div>
            <div class="icon">
                <i class="ion ion-ios-folder"></i>
            </div>
            <a href="#" class="small-box-footer">Plus d'informations <i class="fa fa-arrow-circle-right"></i></a>
        </div>
    </div>
    <div class="col-lg-3 col-xs-6">
        <!-- small box -->
        <div class="small-box bg-green">
            <div class="inner">
                <h3><%=request.getParameter("nbrMembres")%></h3>
                <p>Membres</p>
            </div>
            <div class="icon">
                <i class="ion ion-ios-people"></i>
            </div>
            <a href="#" class="small-box-footer">Plus d'informations <i class="fa fa-arrow-circle-right"></i></a>
        </div>
    </div>
    <div class="col-lg-3 col-xs-6">
        <!-- small box -->
        <div class="small-box bg-yellow">
            <div class="inner">
                <h3><%=request.getParameter("nbrDomaines")%></h3>

                <p>Domaines</p>
            </div>
            <div class="icon">
                <i class="ion ion-android-apps"></i>
            </div>
            <a href="#" class="small-box-footer">Plus d'informations <i class="fa fa-arrow-circle-right"></i></a>
        </div>
    </div>
    <div class="col-lg-3 col-xs-6">
        <!-- small box -->
        <div class="small-box bg-aqua">
            <div class="inner">
                <h3><%=request.getParameter("nbrExperiences")%></h3>
                <p>Partenaires</p>
            </div>
            <div class="icon">
                <i class="ion ion-android-globe"></i>
            </div>
            <a href="#" class="small-box-footer">Plus d'informations <i class="fa fa-arrow-circle-right"></i></a>
        </div>
    </div>
</div>
