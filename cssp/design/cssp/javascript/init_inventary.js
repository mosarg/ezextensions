$(document).ready(function() {
   var $inventary=$('#inv_item_interface');
   var nodeid=$('#config_inv_item p[title="node_id"]').text();
   var objectid=$('#config_inv_item p[title="object_id"]').text();
   var calendarnodeid=$('#config_inv_item p[title="calendar_node_id"]').text();
   var itemname=$('#config_inv_item p[title="item_name"]').text();
   var nodeurlalias=$('#config_inv_item p[title="node_url_alias"]').text();

   
   $inventary.inventary({
       node_id:nodeid,
       object_id:objectid,
       calendar_node_id:calendarnodeid,
       item_name:itemname,
       node_url_alias:nodeurlalias
   });

});