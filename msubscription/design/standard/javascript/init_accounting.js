/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */


$(document).ready(function() {
   var $form=$('#accounting');
   var rules_labels=$('#rules p[title="rules_labels"]').text();
   var rules_content=$('#rules p[title="rules_content"]').text();
   var prices=$('#config p[title="prices"]').text();

   $form.accounting({
        accounting_structure:$('#config p[title="accounting_structure"]').text(),
        user_login:$('#config p[title="user_login"]').text(),
        admin:Boolean($('#config p[title="can_edit"]').text()),
        center_location:$('#config p[title="center_location"]').text(),
        object_id:$('#config p[title="object_id"]').text(),
        module_url:$('#config p[title="module_url"]').text(),
        rules_labels:eval('('+rules_labels+')'),
        rules_content:eval('('+rules_content+')'),
        prices:eval('('+prices+')')
    });

});