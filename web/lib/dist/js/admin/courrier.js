/**
 * Created by Reda BENCHRAA on 14/12/2016.
 */
$(document).ready ( function(){
    $(".mailbox-name").click(function(e) {
        e.preventDefault();
        alert($(this).attr('id'));
        $.get("../courrierController", {idCourrier : $(this).attr('id')} , function(response) {
            $("#emailCourrier").html(response.emailCourrier);
            $("#sujetCourrier").html(response.sujetCourrier);
            $("#nomCompletCourrier").html(response.nomCompletCourrier);
            $("#dateCourrier").html(response.dateCourrier);
            $("#messageCourrier").html(response.messageCourrier);
            alert(response.emailCourrier);
        });
    });
})
