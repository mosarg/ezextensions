$(document).ready(function() {
   $("#event_edit_container").hide();
    var calendars_list=$('#tools_container p[title="calendars_list"]').text();
    var calendars_list_data=eval('('+calendars_list+')');
    var defView,buttons;
    var actionUrl =$('p[title="action"]').text();
    var editIcon=$('p[title="editIcon"]').text();
    var nodeId=$('p[title="node_id"]').text();
    var calendarType=$('p[title="calendar_type"]').text();
    var $calendar = $('#calendar');
    var canEdit=$('p[title="can_edit"]').text();
    var eventColor=$('p[title="event_color"]').text();
   
 
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
        defaultView: defView,
        firstDay:1,
        firstHour:7,
        minTime:7,
        maxTime:20,
        allDayDefault:false,
        header: {
            left: 'prev,next today',
            center: 'title',
            right: buttons
        },
        editable: canEdit,
        monthNames:$('p[title="month_names"]').text().split(","),
        monthNamesShort:$('p[title="month_names_short"]').text().split(","),
        dayNames:$('p[title="day_names"]').text().split(","),
        dayNamesShort:$('p[title="day_names_short"]').text().split(","),
        buttonText: {
            prev: '&nbsp;&#9668;&nbsp;',
            next: '&nbsp;&#9658;&nbsp;',
            prevYear: '&nbsp;&lt;&lt;&nbsp;',
            nextYear: '&nbsp;&gt;&gt;&nbsp;',
            today: 'Oggi',
            month: 'Mese',
            week: 'Settimana',
            day: 'Giorno'
        },
        weekMode:'variable',
         events: function(start, end, callback) {
           var action= 'mcalendar::fetchEvents::'+nodeId+'::'+Math.round(start.getTime()/1000)+'::'+Math.round(end.getTime()/1000)+'::ajaxweek';
            $.ez(action,{postdata:'ready'},function(data) {
                callback(data.content);
            });
        },
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
            else $('#loading').hide();
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
            return true;
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
            return true;
        },
        eventRender:function(calEvent,$event) {

            $event.find('a').css("background-color", eventColor);
            $event.css("background-color", eventColor);
            if(canEdit)   $event.append(renderToolbar(calEvent))  ;

        }

    });

  

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