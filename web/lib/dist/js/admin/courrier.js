/**
 * Created by Reda BENCHRAA on 14/12/2016.
 */
$(document).ready ( function(){
    $(".mailbox-name").click(function(e) {
        e.preventDefault();
        $.get("courrierController", {idCourrier : $(this).attr('id')} , function(response) {
            $("#idCourrier").val(response.idCourrier);
            $("#emailCourrier").html(response.emailCourrier);
            $("#sujetCourrier").html(response.sujetCourrier);
            $("#nomCompletCourrier").html(response.nomCompletCourrier);
            $("#dateCourrier").html(response.dateCourrier);
            $("#messageCourrier").html(response.messageCourrier);
        });
    });
    $("#deleteButton").click(function(e) {
        $.post("courrierController", {idCourrier : $("#idCourrier").val(),action:"supprimerCourrier"} , function(response) {
            $(location).attr('href', 'courrierController')
        });
    });
    $("#deleteAll").click(function(e) {
        var allVals = [];
        $('#idCour :checked').each(function() {
            allVals.push($(this).val());
        });
        $.post("courrierController", {idCourrier : allVals.join(","),action:"supprimerCourrier"} , function(response) {
            $(location).attr('href', 'courrierController')
        });
    });

})
