/*
 * Created by Reda BENCHRAA on 14/12/2016.
 */
$(document).ready ( function(){
    $("button").click(function(e) {
        e.preventDefault();
        $.post("../portfolioController",$('form').serialize(), function(response) {
            alert(response);
        });
    });
})