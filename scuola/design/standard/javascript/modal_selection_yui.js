/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */


YUI().use('node','collection',function(Y) {
    var nodeMaster = Y.get('.ezcca-edit-scuola');
    var selectMaster = nodeMaster.query('select'); // Node instance

//alert(selectMaster.get('options').get('selected'));
//
//     selectMaster.get("options").each( function() {
//            // this = option from the select
//                var selected = this.get('selected');
//                var value  = this.get('value');
//                 var text = this.get('text');
//                 alert(text+selected);
//});

var test=function(o){
    alert(o.get('text'));
    return o.get('selected');}

var onChange = function(e) {


alert(e.target.get('options').get('selected'));
var data=Y.Array.filter(e.target.get('options'),test);
alert(data.length);

        var nodeSlave = Y.get('.ezcca-edit-materie'); // e.target === node || #demo p em
        var selectSlave=nodeSlave.query('select');
        var options=selectSlave.get('children');
        
            };




    selectMaster.on('change', onChange);


   

    
});
