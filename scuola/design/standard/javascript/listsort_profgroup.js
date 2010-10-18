/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */


$(document).ready(function(){
       $('div.sortbuttons').show();
       $('#sortbuttonup').click(function(){
           $('.content-view-line').tsort('h4 a',{order:'desc'});
       });
       $('#sortbuttondown').click(function(){
           $('.content-view-line').tsort('h4 a',{order:'asc'});
       });
       $('#refillbutton').click(function(){
           $('.content-view-line').refill('b');
       });
       $('#telefonobutton').click(function(){
           $('.content-view-line').tsort('.telefono');
       });
       $('#emailbutton').click(function(){
           $('.content-view-line').tsort('.email');
       });
       $('#ruolobutton').click(function(){
           $('.content-view-line').tsort('.ruolo');
       });
 });