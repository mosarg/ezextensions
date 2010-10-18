
$(document).ready(function() {

    var $blockcalendar = $('.program-ajax-block');
    var calendars_list,calendars_list_data;
    
    $blockcalendar.each(
        function(){
            var current_block_id=$(this).attr('id');
            calendars_list=$(this).find('#config-'+current_block_id+' p[title="calendars_list"]').text();
            calendars_list_data=eval('('+calendars_list+')');
            
            $(this).blockprogram(
            {
                calendars_list:calendars_list_data
            })
        }
        );

});


