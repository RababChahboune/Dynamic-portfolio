/*
 * Created by Reda BENCHRAA on 14/12/2016.
 */
$(document).ready ( function(){
    $('form').ajaxForm(function(respond) {
        alert(respond);
        $(location).attr('href', 'portfolioController')
    });
})