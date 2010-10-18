
$(document).ready(function() {
    
    var $blockcalendar = $('.calendar-ajax-block');
    var calendars_list,calendars_list_data;

    //var calendars_list=$('#config p[title="calendars_list"]').text();
    //var calendars_list_data=eval('('+calendars_list+')');


    $blockcalendar.each(
        function(){
            var current_block_id=$(this).attr('id');
            calendars_list=$(this).find('#config-'+current_block_id+' p[title="calendars_list"]').text();
            calendars_list_data=eval('('+calendars_list+')');

            $(this).blockcalendar(
            {
                days: ['Lun', 'Mar', 'Mer', 'Gio', 'Ven', 'Sab', 'Dom'],
                months: ['Gennaio', 'Febbraio', 'Marzo', 'Aprile', 'Maggio', 'Giugno', 'Luglio', 'Agosto',
                'Settembre', 'Ottobre', 'Novembre', 'Dicembre'],
                calendars_list:calendars_list_data
            })
        }
        );

   
});


