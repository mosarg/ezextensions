(function($) {
    $.fn.extend($.ui.dialog.prototype,{
        _original_init : $.ui.dialog.prototype._init,
        _init: function() {
            var self=this;
            var dialogElements={};
            var options=self.options;

          
            var calevent={
                id:Math.floor(100000+Math.random()*10000),
                title:'Prenotazione...',
                start:0,
                end:3600,
                isMain:true,
                frequency:0
            };
            options.calevent=calevent;

            if (options.action=='edit'){
                options.buttons['delete']=function(){
                    $(this).dialog('delete');
                }
            }
            self._original_init();
            self.element.find('#datepicker').datepicker({
                dateFormat: 'yy/mm/dd',
                onSelect: function(dateText, inst) {
                    var new_date=new Date(dateText);
                    var new_month=new_date.getMonth();
                    var new_year=new_date.getFullYear();
                    var first_day=new Date(new_year,new_month,1);
                    var last_day=new Date(new_year,new_month,daysInMonth(new_year,new_month));
                    options.time_range.start=first_day;
                    options.time_range.end=last_day;
                    options.chosenDate=dateText;
                   
                }

            });
            dialogElements=this.dialogElements={
                fieldstart:self.element.find("input#start").val('08:00'),
                fieldend:self.element.find("input#end").val('17:00'),
                fieldbody:self.element.find("textarea[name='body']")
            };

            self.element.find('.timechooser').timeEntry(
            {
                spinnerImage:$('#config p[title="clock_image"]').text(),
                useMouseWheel:true,
                show24Hours:true,
                defaultTime:new Date(1979,3,10,8,0),
                minTime:new Date(1979,3,10,7,0),
                maxTime:new Date(1979,3,10,22,0)
            }
            );
       
            
        },
        close:function(event,postCloseAction){
            var self=this;
            var options=self.options;
            self.element.find('#datepicker').datepicker('destroy');
            self.element.find('input').val('');
            self.destroy();

            switch(postCloseAction){
                case 'delete':
                   
                    break;
                case 'cancel':
                    if (options.action=='create') ;
                    break;
            }

        },
        "delete" : function(event){
            var self=this;
            var options=self.options;
            var $calendar=options.params.calendar;
            var calevent=options.params.calevent;
            var view=$calendar.fullCalendar('getView');
            var ezaction='mcalendar::removeEvent::'+calevent.nodeId+'::'+calevent.parentNodeId+'::'+self._toTimestamp(view.visStart)+'::'+self._toTimestamp(view.visEnd);
            $.ez(ezaction,{
                postdata:'ready'
            });
            $calendar.fullCalendar('removeEvents',calevent.id);
            self.close(event,'delete');
        },
        save : function(event){



            var self=this;
            var ezaction,post_data;
            var options=self.options;

            if (options.chosenDate=='') return false;


            var time_range=options.time_range;
            var current_bookings=options.bookingmap;
            var calevent=options.calevent;
            var node_id=options.calendar_node_id;
            var object_id=options.building_object_id;
            var start_time= $('#start').val();
            var end_time=$('#end').val();
            calevent.start = new Date(options.chosenDate+','+start_time);
            calevent.end =   new Date(options.chosenDate+','+end_time);
            calevent.title = 'Prenotazione stanza '+options.room_code;
            calevent.body = self.dialogElements.fieldbody.val();
           
            post_data=JSON.stringify({
                'short_title':calevent.title,
                'text':calevent.body,
                'where':options.room_code,
                'id':calevent.id
            });
         
            switch(options.action){

                case 'create':
                  
                    ezaction='mcalendar::addEventAjax::'+node_id+'::'+self._toTimestamp(calevent.start)+'::'+self._toTimestamp(calevent.end)
                    ezaction+='::'+self._toTimestamp(time_range.start)+'::'+self._toTimestamp(time_range.end);
                    $.ez(ezaction,{
                        postdata: post_data
                    },function(data){
                        var post=JSON.stringify({
                            'subject':'prima_email',
                            'body':'Testo email'
                         });
                         var eznotification='cssp::sendNotification::'+object_id;
                         $.ez(eznotification,{
                        postdata: post});

                        current_bookings.push(data.content);
                    });
                    break;
                case 'edit':
                    
                    //                    ezaction='mcalendar::updateEventAjax::'+calevent.objectId+'::'+self._toTimestamp(calevent.start)+'::'+self._toTimestamp(calevent.end);
                    //                    ezaction+='::'+calevent.parentNodeId+'::'+self._toTimestamp(view.visStart)+'::'+self._toTimestamp(view.visEnd);
                    //                    $.ez(ezaction,{
                    //                        postdata: post_data
                    //                    },function(data){
                    //                        $calendar.fullCalendar("updateEvent", data.content);
                    //
                    //                    });
                    break;
            }
            self.close(event,'save');
            
        },
        cancel : function(event){
            var self=this;
            var options=self.options;
            self.close(event,'cancel')
        },
        _toTimestamp:function(date){
            return Math.round(date.getTime()/1000);
        }
    });

    

    $.fn.extend($.ui.dialog.defaults,{
        action:'',
        modal:true,
        chosenDate:'',
        params:{},
        buttons:{
            save:function(){
                $(this).dialog('save');
            },
            cancel:function(){
                $(this).dialog('cancel');
            }
        }
    });
})(jQuery);