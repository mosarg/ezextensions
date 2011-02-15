function daysInMonth(iMonth, iYear)
{
    return 32 - new Date(iYear, iMonth, 32).getDate();
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
      
        self.element.find('.upper-button').click(
            function(event){
                self._slideUp($(event.target));
            }
            );
        self.element.find('.lower-button').click(
            function(){
                self._slideDown();
            }
            );
    },
    _slideUp:function($button){
       
        var self=this;
        var $events=self.element.find('ul.events');
        var ev_container_height=self.options.ev_container_height,length,event;
        var old_date=new Date(),temp_date=new Date();
        var step=self.options.event_height,top_position=$events.position().top;

    
        //self.element.find('div.position').text(parseInt($events.position().top)+parseInt(ev_container_height));
        

        if (parseInt($events.position().top)+parseInt(ev_container_height)<self.options.window_height+self.options.event_height) {
            $button.hide();
            $button.siblings('div.loading').show();
            event=self.element.find('ul.events li').last().data('event');
            old_date.setTime(event.end*1000);
            temp_date.setFullYear(old_date.getFullYear(),old_date.getMonth()+1,1);
            self._setupTimeInterval(temp_date);
            self._addMonthInfo();
            self._fetchEvents();

        }

        $events.css({
            "top":parseInt(top_position)-2*parseInt(step)+"px"
            });
    //        $events.animate({
    //            "top":parseInt(top_position)-parseInt(step)+"px"
    //        },50);
        
    },
    _slideDown:function(){
        var self=this;
        var $events=self.element.find('ul.events');
        var ev_container_height=self.options.ev_container_height;
        //self.element.find('div.position').text(parseInt($events.position().top)+parseInt(ev_container_height));
        if (parseInt($events.position().top) <=self.options.event_height){
            var step=self.options.event_height,top_position=$events.position().top;
            self.element.find('ul.events').css({
                "top":parseInt(top_position)+parseInt(step)+"px"
                } );
        }
    //        self.element.find('ul.events').animate({
    //            "top":parseInt(top_position)+parseInt(step)+"px"
    //        },200);}
    },
    _addMonthInfo:function(){
        var self=this;
        var $container=this.element.find('ul.events');
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
        var short_months=options.short_months;
        var temp_date=new Date();
        //short_months[temp_date.getMonth()]
        for (var i in events){
            temp_date.setTime(events[i].start*1000);
            $('<li><span class="date_block" style="background:'+options[events[i].parentNodeId]+'"></span> \n\
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

        for (var i in calendars){
            var action= 'mcalendar::fetchEvents::'+calendars[i].node_id+'::'+Math.round(start.getTime()/1000)+'::'+Math.round(end.getTime()/1000)+'::ajaxweek';
            options[calendars[i].node_id]=calendars[i].color;
            $.ez(action,{
                postdata:'ready'
            },function(data) {
                self._renderEvents(data.content);
                self._updateDimensions();
                self._showCommands();
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