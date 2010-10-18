$(document).ready(function() {


   var $svg=$('#svgmap');
   var svgurl=$('#config-provincia-map p[title="svg_map"]').text();
   var nodeid=$('#config-provincia-map p[title="node_id"]').text();
   var objectid=$('#config-provincia-map p[title="object_id"]').text();
   var ticketslist=$('#config-provincia-map p[title="ticket_s_list"]').text();
   var ticketslist_data=eval('('+ticketslist+')');

   $svg.svgloader({
       svg_url:svgurl,
       node_id:nodeid,
       active_elements_list:ticketslist_data,
       object_id:objectid
       });

});
