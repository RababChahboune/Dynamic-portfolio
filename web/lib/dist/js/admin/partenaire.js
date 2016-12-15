/**
 * Created by Reda BENCHRAA on 15/12/2016.
 */
$(document).ready ( function(){
    $('form').ajaxForm(function(respond) {
        alert(respond);
        $(location).attr('href', '../admin/home.jsp')
    });
})