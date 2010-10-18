/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */


$(document).ready(function(){
    $('.event_small div.controls').append('<a class="remove-event rounded"></a>');
    $("tr.days td").prepend('<a class="add-event-week rounded shadowmore">+</a>');
    $('.remove-event').click(removeEvent);
    $('.add-event-week').click(addEventWeek);
    
});
function editEvent(){

    $('div.calendar-month-view').prepend('<div id="ajax-edit"></div>');
    // $("#ajax-edit").ez('scuola::editEvent');

    $.ajax({
        url : "http://ez.hell.pit/utils/edit",
        type: "POST",
        data:"EditButton=1&NodeID=1482&ContentNodeID=1482&ContentObjectID=1785&ContentObjectLanguageCode=ita-IT",
        error: function (xhr, desc, exceptionobj) {
            $("#ajax-edit").html(xhr.responseText);
        },
        success : function (data) {
            $("#ajax-edit").html(data);
        }
    });
}
function removeEvent(){
    var eventID=$(this).parents('.event_small').attr('id').split('_').pop();
    var action='scuola::removeEvent::'+eventID;
    $.ez(action);
    $(this).parents('.event_small').remove();
    $("div[id*='"+eventID+"']").remove();

}
function addEventWeek(){
    var data=$(this).siblings('.timespan').attr('id').split('_');
    var parentNodeID=data.pop();
    var day=data.pop();
    var dayTimeStamp=data.pop();
    var fromTime=parseInt(dayTimeStamp);
    var inst=this;
    var color=$('.class-event-calendar').attr('title');
    $(this).parents('td').prepend('<div class="insert-form"></div');
    $('.insert-form').ez('scuolajax::add_event_item_week',function(){
         $('#from_time').change(function(){
                 var now=parseInt($(this).children('option:selected').val())+4;
                 $(this).parent().find('#to_time option[value="'+now+'"]').attr("selected","selected");

                });
        $('input#cancel_button').click(function(){
            $(this).parents('.insert-form').remove();
        })
        $('input#add_button').click(
            function(){
                var text=$(inst).parents('td').find('#text').val();
                var title=$(inst).parents('td').find('#short_title').val();
                var from_time=$(inst).parents('td').find('#from_time option:selected').val();
               
                var to_time=$(inst).parents('td').find('#to_time option:selected').val();
                var to_time_text=$(inst).parents('td').find('#to_time option:selected').text();
                var from_time_text=$(inst).parents('td').find('#from_time option:selected').text();
                from_time=fromTime+parseInt(from_time)*900;
                to_time=fromTime+parseInt(to_time)*900;
                if(to_time<from_time){to_time=from_time+3600;}
                if(title==''){
                    title='Modifica titolo evento';
                }
                var action='scuola::addEvent::'+parentNodeID+'::'+from_time+'::'+to_time+'::'+text+'::'+title;
                $.ez(action,{
                    postData: 'hi!'
                },function(data){
                    var last_insert=$(inst).siblings('.timespan').append('<div id="event_'+data.content.node_id+'"class="event_small rounded" style="background:'+color+'">'
                        +from_time_text+' '+to_time_text+
                        '<a href="/'+data.content.url_alias+'">'+title+
                        '</a><div class="controls"></div></div>');
                       last_insert.find('.controls').ez('scuolajax::edit_item::'
                        +data.content.object_id+'::'+data.content.node_id+'::'+data.content.current_language,function(){
                       last_insert.find('.remove-event').click(removeEvent);
                        });

                });
                $(this).parents('.insert-form').remove();
            }

            );
    });

}


