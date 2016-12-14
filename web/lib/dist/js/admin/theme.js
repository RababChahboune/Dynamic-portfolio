/**
 * Created by Reda BENCHRAA on 14/12/2016.
 */
$(document).ready ( function(){
    $("button").click(function() {
        $.post("../themeController", {'themeName':  $('select').find(":selected").text() }, function(response) {
            $("#themeImg").attr("src","../lib/dist/img/theme/"+response);
        });
    });
})