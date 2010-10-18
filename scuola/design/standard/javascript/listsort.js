/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */


$(document).ready(function(){
      $('#sortbuttonup').click(function(){
           $('.content-view-line').tsort({order:'asc'});
       });
       $('#sortbuttondown').click(function(){
           $('.content-view-line').tsort({order:'desc'});
       });
       $('#timesortup').click(function(){
           $('.content-view-line').tsort('p.time',{order:'desc'});
       });
       $('#timesortdown').click(function(){
           $('.content-view-line').tsort('p.time',{order:'asc'});
       });
       });