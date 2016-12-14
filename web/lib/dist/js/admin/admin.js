/**
 * Created by Reda BENCHRAA on 14/12/2016.
 */
$(document).ready ( function(){
    $("#submit").click(function(e) {
        e.preventDefault();
        $.post("../administrateurController",$('form').serialize(), function(response) {
            alert(response);
            $("input[name=oldUsername]").val("");
            $("input[name=oldPassword]").val("");
            $("input[name=newUsername]").val("");
            $("input[name=newPassword]").val("");
        });
    });
    $("#return").click(function(e) {
        e.preventDefault();
        $(location).attr('href', '../admin/home.jsp')
    });
})