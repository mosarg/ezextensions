function daysInMonth(iMonth, iYear)
{
    return 32 - new Date(iYear, iMonth, 32).getDate();
}

var inventary  = {
    _init: function() {
        var self=this;
        self._renderInterface();
        self._fetchRelations();
    },
    _renderInterface:function(){
        var self=this;
        var $dialogContent = $("#event_edit_container");
        var calendar_node_id=self.options.calendar_node_id;

        $('<button class="sub">Prenota </button>').appendTo(self.element).
        click(function(event){
            $dialogContent.dialog({
                width: 500,
                item_name: self.options.item_name,
                time_range:{
                    start:self.options.first_day,
                    end:self.options.last_day
                },
                bookingmap:self.options.bookings,
                action:'create',
                calendar_node_id:calendar_node_id,
                object_id:self.options.object_id,
                related_events:self.options.related_events,
                inventary:self
            }).show();
        });
        $('<div id="related_events"></div>').appendTo(self.element);

    },
    _fetchRelations:function(){
        var self=this;
        var options=self.options;
        var ezaction='cssp::fetchRelations::'+options.object_id
        $.ez(ezaction,{
            postdata: 'ready'
        },
        function(data){
            self.options.related_events=data.content;
            self._renderRelatedObjects(data.content);
        });
    },
    _updateRelatedObjects:function(){
        
        var self=this;
        var options=self.options;
        var events=options.related_events;
        var new_event=events.pop(),start_date,end_date;
        var $list,$related_events=self.element.find('#related_events');
        $related_events.find('p').remove();
        $list=$related_events.find('ul');

         start_date=new Date(new_event.start*1000);
         end_date=new Date(new_event.end*1000);

                $('<li><a href="/'+new_event.url_alias+'">'+new_event.name+'</a>\n\
                    <span class="time_start">Dal '+start_date.toLocaleString()+'</span>\n\
                    <span class="time_end">Al '+end_date.toLocaleString()+'\n\
                    </li>').appendTo($list);

        
    },
    _renderRelatedObjects:function(events){
        var self=this;
        var $list,$related_events=self.element.find('#related_events');
        var start_date,end_date;
         $list=$('<ul></ul>').appendTo($related_events);
        if(events.length>0){
           
            for (var i in events){
                
                start_date=new Date(events[i].start*1000);
                end_date=new Date(events[i].end*1000);

                $('<li><a href="/'+events[i].url_alias+'">'+events[i].name+'</a>\n\
                    <span class="time_start">Dal '+start_date.toLocaleString()+'</span>\n\
                    <span class="time_end">Al '+end_date.toLocaleString()+'\n\
                    </li>').appendTo($list);
            }
        }else{
            $('<p>Nessuna prenotazione</p>').appendTo($related_events);
        }
    }

}

$.widget("ui.inventary", inventary);

$.ui.inventary.defaults ={
    node_id:2,
    object_id:2,
    current_month:''
};