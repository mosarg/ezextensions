var legend={
    _init: function() {
         var options=this.options;
         this._renderInferface();
         this._setupEventDelegation();
    },
    _renderInferface:function(){
        var legend,$legend,$calendar;
        var options=this.options;
        legend='<div class="legend_box"></div>';
        $legend=$(legend).appendTo(this.element);
        for (var i in options.list){
         $calendar=$('<div class="calendar_element"><span class="rounded">'+options.list[i].calendar_name+
                    '</span><input checked="checked" class="cal_toggle" type="checkbox" value="'+options.list[i].calendar_id+'"/></div>').appendTo($legend);
         $calendar.css('background', options.list[i].event_color);
        }
     },
     _changeCalendarState:function($target){
        var j=0;
        var cal_id=$target.val();
        var list=this.options.list;
        var fetches=this.options.calendarFetches;
         //calendarFetches structure:{[],func1,func2,...}
         for (var i in list){
             j=Number(i)+1;
             if(list[i].calendar_id==cal_id){

                 if ($target.is(':checked'))
                 this.options.calendar.fullCalendar('addEventSource',fetches[j]);
                 else
                 this.options.calendar.fullCalendar('removeEventSource',fetches[j]);
                 break;
            }
        }
     },
     _setupEventDelegation : function() {
        var self = this;
        this.element.click(function(event){
            var $target=$(event.target);
            if ($target.hasClass('cal_toggle')) {
                self._changeCalendarState($target)
            }
       });
    }
}
$.widget("ui.legend", legend);

$.ui.legend.defaults ={
    list:'',
    calendar:'',
    calendarFetches:''
}