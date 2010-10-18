
$(document).ready(function() {
   var $tickets=$('#tickets');
   var nodeid=$('#config-ticket-system p[title="node_id"]').text();
   var objectid=$('#config-ticket-system p[title="object_id"]').text();
   var currentusername=$('#config-ticket-system p[title="current_user_name"]').text();
   var stateoptions=$('#config-ticket-system p[title="state_options"]').text();
   var stateoptionsdata= eval('('+ stateoptions +')');

   $tickets.ticketsystem({
       node_id:nodeid,
       object_id:objectid,
       current_user_name:currentusername,
       state_options:stateoptionsdata
   });

});