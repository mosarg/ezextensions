
$(document).ready(function() {
   var $svg=$('#svgmap');
   var svgurl=$('#config p[title="svg_url"]').text();
   var nodeid=$('#config p[title="node_id"]').text();
   var objectid=$('#config p[title="object_id"]').text();
   var calendarnodeid=$('#config p[title="calendar_node_id"]').text();
   var userid=$('#config p[title="user_id"]').text();
   var canedit=$('#config p[title="can_edit"]').text();
   var roomslist=$('#config p[title="rooms_list"]').text();
   var roomslist_data=eval('('+roomslist+')');


   $svg.booking({
       svg_url:svgurl,
       node_id:nodeid,
       calendar_node_id:calendarnodeid,
       rooms_list:roomslist_data,
       object_id:objectid,
       user_id:userid,
       can_edit:canedit
   });

});
