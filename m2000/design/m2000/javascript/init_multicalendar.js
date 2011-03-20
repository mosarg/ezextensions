$(document).ready(function() {
    $("#event_edit_container").hide();
    var calendars_list=$('#config p[title="calendars_list"]').text();
    var calendars_list_data=eval('('+calendars_list+')');
    var actionUrl =$('p[title="action"]').text();
    var defView,buttons;
    var calendarType=$('p[title="calendar_type"]').text();
    var editIcon=$('p[title="editIcon"]').text();
    var eventColors=new Object();
    var $calendarLegend=$('<div id="calendar_legend" ></div>').appendTo('#sidemenu');
    var $calendar = $('#calendar');
    var canEdit=$('p[title="can_edit"]').text();
    var $page=$('#page');
    
    var calendarsToFetch=createCalendarsFetchList(calendars_list_data);
    
    var content_end=parseInt($page.offset().left)+parseInt($page.css('width'));

    $(window).resize(function(){
        content_end=parseInt($page.offset().left)+parseInt($page.css('width'));
    });
    
    switch(calendarType){
        case 'vista_settimana':
            defView='agendaWeek';
            buttons='agendaWeek';
            break;
        case 'vista_mese':
            defView='month';
            buttons='mese';
            break;
        case 'vista_multipla':
            defView='month';
            buttons='month,agendaWeek,agendaDay';
            break;
        case 'programma':
            defView='agendaDay';
            buttons='agendaDay';
            break;
    }
    
    
    
    $calendar.fullCalendar({
        defaultView: 'month',
        firstDay:1,
        firstHour:7,
        minTime:7,
        maxTime:20,
        timeslotsPerDay:30,
        allDayDefault:false,
        header: {
            left: 'prev,next today',
            center: 'title',
            right: 'month,agendaWeek,agendaDay'
        },
        editable: canEdit,
        eventSources:calendarsToFetch,
        eventResize:function(event, dayDelta, minuteDelta, revertFunc, jsEvent, ui, view){
            var ezaction;
            var start=Math.round(event.start.getTime()/1000),
            end=Math.round(event.end.getTime()/1000);

            ezaction='mcalendar::updateEventTimeSlot::'+event.objectId+'::'+start+'::'+end+'::'+event.parentNodeId;
            $.ez(ezaction,{postdata:'ready'});
        },
        eventDrop: function(event, delta) {
            var ezaction;
            var start=Math.round(event.start.getTime()/1000),
            end=Math.round(event.end.getTime()/1000);
            ezaction='mcalendar::updateEventTimeSlot::'+event.objectId+'::'+start+'::'+end+'::'+event.parentNodeId;
            $.ez(ezaction,{postdata:'ready'});
        },
        loading: function(bool) {
            if (bool) $('#loading').show();
            else {$('#loading').hide();
                        
            $calendarLegend.legend({list:calendars_list_data,
                                   calendar:$calendar,
                                   calendarFetches:calendarsToFetch});}
        },
        dayClick: function(dayDate, allDay, jsEvent, view){
            if(!canEdit)return false;
            var timestamp=dayDate.getTime()/1000;
            var calEvent={
                id:Math.floor(100000+Math.random()*10000),
                title:'New Event',
                start: timestamp,
                end:timestamp+3600,
                isMain:true,
                frequency:0
            };
            $calendar.fullCalendar('renderEvent',calEvent,true);
            var $dialogContent = $("#event_edit_container");
            var dialogParams={
                calendar:$calendar,
                list:calendars_list_data,
                calevent:calEvent,
                timeslottimes:$calendar.fullCalendar("getTimeslotTimes", calEvent.start)
            }
            $dialogContent.dialog({
                action:'create',
                params:dialogParams
            }).show();

        },
        eventClick:function(calEvent, jsEvent, view){
            if(!canEdit)return false;
            if ($(jsEvent.target).hasClass('editbutton')) return true;
            var $dialogContent = $("#event_edit_container");
            var dialogParams={
                calendar:$calendar,
                list:calendars_list_data,
                calevent:calEvent,
                timeslottimes:$calendar.fullCalendar("getTimeslotTimes", calEvent.start)
            }
            $dialogContent.dialog({
                action:'edit',
                params:dialogParams
            }).show();
        }, eventMouseover:function(event, jsEvent, view){
            
            var $event=$(jsEvent.target);
            var shown=false;
            if(!$event.is('div.fc-event')){
                $event=$event.parents('div.fc-event');
            }
            if(!canEdit) {
                 $('.event-info-box').remove();
       
                $event.children('.event-info-box').each(function(){
                    shown=true;
                });
                if(!shown){
                    $(jsEvent.target).css('z-index',100);
                    var $infobox=$('<div class="event-info-box  rounded shadow" style="z-index:1000" ><div class="ajax-load-big"></div></div>').
                    appendTo($event).hide().fadeIn(600);
                   
                    var ezaction='content/view/embed/'+event.nodeId;
                    if($event.offset().left+$infobox.outerWidth()>content_end){
                    $infobox.offset({
                            left:$infobox.offset().left-($infobox.outerWidth()-$event.width())
                            });
                     }
               if($event.data('content')===undefined){
                $.ezrun(ezaction,{
                        postdata:'ready'
                    },function(data){
                        $infobox.html(data);
                        $event.data('content',data);
                        
                    });
               }else{
                   $infobox.html($event.data('content'));
               }

                }
            }

           
        },
        eventMouseout:function(event,jsEvent,view){
            $('.event-info-box').remove();
            $(jsEvent.target).css('z-index',8);
        },
        eventRender:function(calEvent,$event) {
                    

            $event.css('padding','1em');
            $event.addClass('rounded');    
            $event.find('a').css("background-color", eventColors[calEvent.parentNodeId]);
            $event.css("background-color", eventColors[calEvent.parentNodeId]);
            
            if (canEdit) $event.append(renderToolbar(calEvent));
          }
    });
    function createCalendarsFetchList( calendars) {
        var calendarsFetches=new Array();
             function createFetchFunction(calendar_id,color){
              return function(start, end, callback){
               eventColors[calendar_id]=color;
               $.ez('mcalendar::fetchEvents::'+calendar_id+'::'+Math.round(start.getTime()/1000)+'::'+Math.round(end.getTime()/1000)+'::ajaxweek',{postdata:'ready'},function(data) {
                    callback(data.content);
                });
            }
        }
        for ( var i in calendars) {
           calendarsFetches[i]=createFetchFunction(calendars[i].calendar_id,calendars[i].event_color);
        }
        
        return calendarsFetches;
    }
    function renderToolbar(calEvent)
    {
        var tools='<div id="tools"> <form action='+actionUrl+' method="post">';
        tools+='<input value="test" class="editbutton" type="image" name="EditButton" src='+editIcon+' alt="Edit" />';
        tools+='<input type="hidden" name="ContentObjectLanguageCode" value="'+calEvent.currentLanguage+'"/>';
        tools+='<input type="hidden" name="ContentObjectID" value="'+calEvent.objectId+'"/>';
        tools+='<input type="hidden" name="NodeID" value="'+calEvent.nodeId+'" />';
        tools+='<input type="hidden" name="ContentNodeID" value="'+calEvent.nodeId+'" />';
        tools+='</form></div>';
        return tools;
    }


});