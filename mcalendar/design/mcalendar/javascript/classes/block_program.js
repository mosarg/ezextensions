function daysInMonth(iMonth, iYear)
{
    return 32 - new Date(iYear, iMonth, 32).getDate();
}

function compareDates(a,b){
    return a.start-b.start
}

var blockprogram={
    _init:function(){
        this._setupTimeInterval();
        this._setupEventDelegation();
        this._fetchEvents();
        this._renderCalInterface();
       
    },
    _updateDimensions:function(){
        var self=this;

        //var event_height=self.options.event_height;
        
        var event_height=self.element.find('ul.events li').innerHeight();
        self.options.event_height=event_height;
        var events_number=self.element.find('ul.events li').length;
        
        //var events_number=self.element.find('ul.events li').css({
        //    "height":event_height+"px"
        //}).length;
        self.options.window_height=self.element.find('div.visible-window').height();
        self.options.ev_container_height=events_number*event_height;
        self.element.find('ul.events').css({
            "height":self.options.ev_container_height+"px"
        });
    },
    _renderCalInterface:function(){
        var self=this;
        var temp_date=new Date();
        var months=self.options.months;
        self.element.find('div.month-name').text(months[temp_date.getMonth()]).data('month-date',temp_date.getTime());
        self.element.find('.next-button').click(
            function(event){
                self._slideUp($(event.target));
            }
            );
        self.element.find('.previous-button').click(
            function(event){
                self._slideDown($(event.target));
            }
            );
    },
    _slideUp:function($button){
       
        var self=this;
        var months=self.options.months;
        var $events=self.element.find('ul.events');
        var ev_container_height=self.options.ev_container_height,length,event;
        var old_date=new Date(),temp_date=new Date();
        var step=self.options.event_height,top_position=$events.position().top;
        
       
       
        
        if (parseInt($events.position().top)+parseInt(ev_container_height)<self.options.window_height+self.options.event_height) {
            $button.hide();
            $button.siblings('div.loading').show();
            event=self.element.find('ul.events li').last().data('event');
            old_date.setTime(event.end*1000);
            temp_date.setFullYear(old_date.getFullYear(),old_date.getMonth()+1,1);
            $button.siblings('div.month-name').text(months[temp_date.getMonth()]).data('month-date',temp_date.getTime());
            self._setupTimeInterval(temp_date);
            self._addMonthInfo();
            self._fetchEvents();

        }
        $events.css({
                "top":parseInt(top_position)-2*parseInt(step)+"px"
            } );
    
           
    },
    _slideDown:function($button){
        var self=this;
        var months=self.options.months;
        var today=new Date();
        var old_date=new Date();
        var temp_date=new Date();
        var $month_label=$button.siblings('div.month-name');
        old_date.setTime($month_label.data('month-date'))
        var $events=self.element.find('ul.events');
               
        var step=self.options.event_height,top_position=$events.position().top;
              
        var ev_container_height=self.element.find('div.position').text(parseInt($events.position().top)+parseInt(ev_container_height));
                
        if (parseInt(top_position) < 0){
           
            temp_date.setFullYear(old_date.getFullYear(),old_date.getMonth()-1,1);
            $month_label.text(months[temp_date.getMonth()]).data('month-date',temp_date.getTime());
            $events.css('top',function(){
            if (parseInt(top_position)+2*parseInt(step)>0){
                $month_label.text(months[today.getMonth()]).data('month-date',today.getTime());
                return 0;
            }else{
                return parseInt(top_position)+parseInt(step)+"px";
            }            
        });
     
            
            
        }

    },
    _addMonthInfo:function(){
        var self=this;
        var $container=self.element.find('ul.events');
        var start=self.options.start;
        var end=self.options.end;
        var event={
            id:666,
            title:'Fake Event',
            start: start.getTime()/1000,
            end:end.getTime()/1000,
            isMain:true,
            frequency:0
        };
        $('<li class="noevent">'+self.options.months[start.getMonth()]+' '+start.getFullYear()+'</li>').appendTo($container).data('event',event);
    },
    _renderEvents:function(events){
        var $container=this.element.find('ul.events');
        var options=this.options;
        var months=options.months;
        var temp_date=new Date();
               
        for (var i in events){
            //alert(events[i].toSource());
            temp_date.setTime(events[i].start*1000);
            $('<li><a class="date_block" href="'+options[events[i].parentNodeId][1]+'" style="background:'+options[events[i].parentNodeId][0]+'"></a> \n\
                  <span class="title">'+events[i].title+'</span>\n\
                  <span class="day_month">'+temp_date.getDate()+'</span></li>').appendTo($container).data('event',events[i]);
        }
        
    },
    _setupTimeInterval:function(new_date){
        if (typeof(new_date)!='undefined'){
            var current_date=new_date;
        }else{
            var current_date=new Date();
        }
        this.options.start=new Date(current_date.getFullYear(),current_date.getMonth(),1);
        this.options.end=new Date( current_date.getFullYear(), current_date.getMonth(),daysInMonth(current_date.getMonth(),current_date.getFullYear()) );
    },
    _setupEventDelegation:function(){

    },
    _showCommands:function(){
        this.element.find('.commands .loading').hide();
        this.element.find('.commands .arrow').show();      
    }
    ,
    _fetchEvents: function(){
        
        var self=this;
        var options=self.options;
        var start=options.start;
        var end=options.end;
        var calendars=options.calendars_list;
 
        var calendar_index=0;
     
        self.element.data('events',[]);
        for (var i in calendars){
            var action= 'mcalendar::fetchEvents::'+calendars[i].node_id+'::'+Math.round(start.getTime()/1000)+'::'+Math.round(end.getTime()/1000)+'::ajaxweek';
            options[calendars[i].node_id]=[calendars[i].color,calendars[i].url_alias];
            $.ez(action,{
                postdata:'ready'
            },function(data) {
  
  
             
                self.element.data('calendar_index',calendar_index++)
             
                if (data.content.length==0){
                         
                    data.content.push({
                        parentNodeId:calendars[self.element.data('calendar_index')].node_id,
                        title:'Il calendario non contiene nessun evento',
                        start: start.getTime()/1000,
                        end:end.getTime()/1000,
                        isMain:true,
                        frequency:0
                    });
                }
                
                self.element.data('events',self.element.data('events').concat(data.content));
                       
                if(calendar_index==calendars.length){
                    self._renderEvents(self.element.data('events').sort(compareDates));
                    self._updateDimensions();
                    self._showCommands();
                }
            });
        }
      
    }


}

$.widget("ui.blockprogram", blockprogram);

$.ui.blockprogram.defaults ={
    days: ['Mon', 'Tue', 'Wen', 'Thu', 'Fri', 'Sat', 'Sun'],
    months: ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August',
    'September', 'Oktober', 'November', 'December'],
    short_months:['Jan','Feb','Mar','Apr','Jun','Jul','Aug','Sep','Okt','Nov','Dec'],
    linkFormat: null,
    dateFormat: '{%dd}.{%mm}.{%yyyy}',
    onSelect: null,
    showYear: false,
    prevArrow: '&laquo;',
    nextArrow: '&raquo;',
    event_height:40,
    event_padding:1
}