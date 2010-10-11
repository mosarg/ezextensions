$(document).ready(function() {
   var $filter=$('#facetes');
   var av_facetes=$('#config-filter-scuole p[title="facetes"]').text().split(',');
   var parent_node_id=$('#config-filter-scuole p[title="node_id"]').text();
   var facetes_names=$('#config-filter-scuole p[title="facetes_hash"]').text();
   var facetes_names_data= eval('('+ facetes_names +')');


   $filter.schoolfilter({
       facetes:av_facetes,
       parentNodeId:parent_node_id,
       facetesNames:facetes_names_data
   });

});
