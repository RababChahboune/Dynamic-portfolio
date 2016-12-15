/**
 * Created by Reda BENCHRAA on 15/12/2016.
 */
$(document).ready ( function(){
    $('form').ajaxForm(function(respond) {
        alert(respond);
        location.reload();
    });
    $(".modifierCursus").click(function (e) {
        var $item = $(this).closest("tr");
        $("input[name=idCursus]").val($item.find('td').eq(0).text());
        $("input[name=actionCursus]").val("modifierCursus");
        $("input[name=nomCursus]").val($item.find('td').eq(1).text());
        $("input[name=anneeDebutCursus]").val($item.find('td').eq(2).text());
        $("input[name=anneeFinCursus]").val($item.find('td').eq(3).text());
        $("input[name=etablissementCursus]").val($item.find('td').eq(4).text());
        $("input[name=remarqueCursus]").val($item.find('td').eq(5).text());
    });
    $(".supprimerCursus").click(function (e) {
        var $item = $(this).closest("tr");
        alert(1);
        $.post("/DynamicPortfolio/cursusController", {actionCursus:"supprimerCursus",idCursus:$item.find('td').eq(0).text()},function(data, status){
            alert("Data: " + data + "\nStatus: " + status);
            location.reload();
        });
    })
    $(".modifierCompetance").click(function (e) {
        var $item = $(this).closest("tr");
        $("input[name=idCompetance]").val($item.find('td').eq(0).text());
        $("input[name=actionCompetance]").val("modifierCompetance");
        $("input[name=nomCompetance]").val($item.find('td').eq(1).text());
        $("input[name=pourcentageCompétance]").val($item.find('td').eq(2).text());
    });
    $(".supprimerCompetance").click(function (e) {
        var $item = $(this).closest("tr");
        alert(1);
        $.post("/DynamicPortfolio/cursusController", {actionCursus:"supprimerCursus",idCursus:$item.find('td').eq(0).text()},function(data, status){
            alert("Data: " + data + "\nStatus: " + status);
            location.reload();
        });
    })
})