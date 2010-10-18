

  //timeslotsPerDay:30,
  //millisPerTimeslot:1800000,
//  cformatDate: function(date,format) {
//                    return formatDate(date, options.timeFormat.agenda,options);
//
//                },
//                getTimeslotTimes : function(date) {
//
//                    var firstHourDisplayed = options.firstHour;
//                    var startDate = new Date(date.getFullYear(), date.getMonth(), date.getDate(), firstHourDisplayed);
//                    var times = []
//                    var startMillis = startDate.getTime();
//                    for(var i=0; i < options.timeslotsPerDay; i++) {
//                        var endMillis = startMillis + options.millisPerTimeslot;
//                        times[i] = {
//                            start: new Date(startMillis),
//                            startFormatted: formatDate(new Date(startMillis), options.timeFormat.agenda,options),
//                            end: new Date(endMillis),
//                            endFormatted: formatDate(new Date(endMillis),options.timeFormat.agenda,options)
//                        };
//                        startMillis = endMillis;
//                    }
//
//                    return times;
//                },