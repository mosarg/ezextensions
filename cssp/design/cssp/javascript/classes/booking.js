function daysInMonth(iMonth, iYear)
{
    return 32 - new Date(iYear, iMonth, 32).getDate();
}

var booking  = {
    _init: function() {
        var self=this;
        var options=self.options;

        $(self.options.rooms_list).each(function(){
            self.options.rooms_hash[this.room_code]=this.room_name;
        })

        var renderInterface= function(svg){
            self._loadBookings();
            if (options.can_edit){
                self._attachEvents(svg);
            }
        }
        this._loadSvg(renderInterface);
    },
    _attachEvents:function(svg){
        var self=this;

        var $personal_bookings=$('button#personal').click(function(event){
            self._renderUserBookings(event);
        });
        var rooms_list=self.options.rooms_list;
        for (var i in rooms_list){
            $('#'+rooms_list[i].room_code,svg.root()).click(function(event){
                var $dialogContent = $("#event_edit_container");
                var calendar_node_id=self.options.calendar_node_id;
                var building_object_id=self.options.object_id;
                $dialogContent.dialog({
                    width: 500,
                    room_code: $(event.target).attr('id'),
                    time_range:{
                        start:self.options.first_day,
                        end:self.options.last_day
                    },
                    bookingmap:self.options.bookings,
                    action:'create',
                    calendar_node_id:calendar_node_id,
                    building_object_id:building_object_id
                }).show();
            }).
            mouseover(function(event){
                $(event.target).attr('style','fill:white;stroke:lime;stroke-width:2');
                self._showRoomBookings($(event.target));

            }).
            mouseout(function(event){
                $(event.target).attr('style','fill:white;stroke:blue;stroke-width:2');
                self._hideRoomBookings();
            });

        }
    },
    _renderUserBookings:function(event){
        var self=this;
        var $button=$(event.target);
        var $button_up=$button.children('img.up');
        var $button_down=$button.children('img.down')
        var user_id=self.options.user_id;
        var bookings=self.options.bookings;
        var $user_bookings= $('.building>div#user_bookings');
        if($user_bookings.hasClass('hidden')){
            $user_bookings.removeClass('hidden');
            $button_up.removeClass('hidden');
            $button_down.addClass('hidden');
            for (var i in bookings){
                if (bookings[i].ownerId==user_id)
                    self._renderBooking(bookings[i]).appendTo($user_bookings);
            }
            }else{
        $button_up.addClass('hidden');
        $button_down.removeClass('hidden');
        $user_bookings.addClass('hidden');
        $user_bookings.children().remove();
    }
},
_loadBookings: function(){
    var self=this;
    var options=self.options;
    var start=options.first_day;
    var end=options.last_day;
    var action= 'mcalendar::fetchEvents::'+options.calendar_node_id+'::'+Math.round(start.getTime()/1000)+'::'+Math.round(end.getTime()/1000)+'::ajaxweek';
    $.ez(action,{
        postdata:'ready'
    },function(data) {
        self.options.bookings=data.content;
    });
},
_showRoomBookings:function($trigger){
    var self=this;
    var rooms=self.options.rooms_hash;
    var $old_legend,$new_legend;
    var bookings=self.options.bookings;
    $old_legend=self.element.find('#legend');
        
    $new_legend=$('<div id="legend"></div>');
    $('<h3>Stanza: '+rooms[$trigger.attr('id')]+'</h3>').appendTo($new_legend);

    for (var i in bookings){
        if (bookings[i].where==$trigger.attr('id'))
            self._renderBooking(bookings[i]).appendTo($new_legend);
    }
    self.options.old_legend=$old_legend.replaceWith($new_legend);

},
_hideRoomBookings:function(){
    var $old_legend,self=this;
    $old_legend=self.element.find('#legend').hide();
    $old_legend.replaceWith(self.options.old_legend);
},
_renderBooking:function(booking_element){
    var date_start=new Date(booking_element.start*1000);
    var date_end=new Date(booking_element.end*1000);
    return $('<div><ul class="room_info"><li><span class="bold">Codice prenotazione:</span> '+booking_element.nodeId+'</li>\n\
                           <li><span>Prenotata dal:</span> '+date_start.toLocaleString() +'</li>\n\
                           <li><span>Al:</span> '+date_end.toLocaleString()+'</li>\n\
                        </ul> </div>')
},
_loadSvg:function(renderInterface){
    var self=this;
    var current_date=new Date();
    var current_month=current_date.getMonth();
    var current_year=current_date.getFullYear();
    var first_day=new Date(current_year,current_month,1);
    var last_day=new Date(current_year,current_month,daysInMonth(current_year,current_month));
    self.options.first_day=first_day;
    self.options.last_day=last_day;
    var options=self.options;
    var $container=self.element.find('#graph');
    $container.svg();
    var svg = $container.svg('get');
    svg.load(options.svg_url, {
        addTo: true,
        changeSize: false,
        onLoad: renderInterface
    });
    svg.configure({
        width:  $container.width(),
        height:  $container.height()
    });
}
};

$.widget("ui.booking", booking);

$.ui.booking.defaults ={
    svg_url:'',
    node_id:2,
    current_month:'',
    rooms_hash:new Object()
};
