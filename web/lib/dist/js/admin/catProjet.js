/**
 * Created by Rabab Chahboune on 12/15/2016.
 */
$(document).ready ( function(){
    $('form').ajaxForm(function(respond) {
        alert(respond);
        $(location).attr('href', '../admin/home.jsp')
    });
})
