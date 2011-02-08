/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */


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
