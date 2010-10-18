/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */


$(document).ready(function(){
    $('.event_small div.controls').append('<a class="remove-event rounded"></a>');
    $("tr.days td div.counter").append('<a class="add-event rounded shadowmore">+</a>');
    $('.add-event').click(addEvent);
    $('.remove-event').click(removeEvent);
    $('.add-event-week').click(addEventWeek);
//$('.edit-event').click(editEvent);

       
});

function mktime() {
    var no, ma = 0, mb = 0, i = 0, d = new Date(), argv = arguments, argc = argv.length;

    if (argc > 0){
        d.setHours(0,0,0); d.setDate(1); d.setMonth(1); d.setYear(1972);
    }

    var dateManip = {
        0: function(tt){ 
            return d.setHours(tt);
        },
        1: function(tt){ 
            return d.setMinutes(tt);
        },
        2: function(tt){ 
            var set = d.setSeconds(tt); mb = d.getDate() - 1; return set;
        },
        3: function(tt){ 
            var set = d.setMonth(parseInt(tt)-1); ma = d.getFullYear() - 1972; return set;
        },
        4: function(tt){ 
            return d.setDate(tt+mb);
        },
        5: function(tt){ 
            return d.setYear(tt+ma);
        }
    };

    for( i = 0; i < argc; i++ ){
        no = parseInt(argv[i]*1);
        if (isNaN(no)) {
            return false;
        } else {
            // arg is number, let's manipulate date object
            if(!dateManip[i](no)){
                // failed
                return false;
            }
        }
    }
    return Math.floor(d.getTime()/1000);
}

function addEventCallback(data){
    alart('cane');
//var curTimeStamp=$('div.class-event-calendar').attr('title');
//$('div#main div.border-box').ez('scuolajax::event_view_calendario_monthview::1350::cane::'+curTimeStamp+'::#ff0000');
}


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
    var data=$(this).parent().attr('id').split('_');
    var nodeId=data.pop();
    var day=data.pop();
    var dayTimeStamp=data.pop();
    var fromTime=parseInt(dayTimeStamp)+3600*8;
    var toTime=fromTime+3600;
   
    var inst=this;
    var parentNodeID=$('.class-event-calendar').attr('id').split('_').pop();
    var color=$('.class-event-calendar').attr('title');
    $(this).parents('td').append('<div class="insert-form"></div');
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
function addEvent(){
    var day=$(this).parent().attr('title');
    var data=$('.calendar_heading_date').attr('title').split('_');
    var year=data.pop();
    var month=data.pop();
    var fromTime=mktime(0,0,0,month,day,year);
    var toTime=mktime(9,0,0,month,day,year);
    var inst=this;
    var parentNodeID=$('.class-event-calendar').attr('id').split('_').pop();
    var color=$('.class-event-calendar').attr('title');
    
    $(this).parents('td').append('<div class="insert-form"></div');
    $('.insert-form').ez('scuolajax::add_event_item_week',function(){

             $('#from_time').change(function(){
                 var now=parseInt($(this).children('option:selected').val())+4;
                 $(this).parent().find('#to_time option[value="'+now+'"]').attr("selected","selected");

                });


        $('input#cancel_button').click(function(){
            $(this).parents('.insert-form').remove();
        })
        $('input#add_button').click(function(){
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
                   
                var last_insert=$(inst).parents('td').append('<div id="event_'+data.content.node_id+'"class="event_small rounded" style="background:'+color+'">'
                    +'<a href="/'+data.content.url_alias+'">'+title+
                    '</a><div class="controls"></div></div>');
                last_insert.find('.controls').ez('scuolajax::edit_item::'
                    +data.content.object_id+'::'+data.content.node_id+'::'+data.content.current_language,function(){
                        last_insert.find('.remove-event').click(removeEvent);
                    });
                                    
            });
            $(this).parents('.insert-form').remove();
        }
    )
    });
}

