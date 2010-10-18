/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */


$(document).ready(function() {
   var $subscription=$('#subscription');
   var available_exams=$('#config p[title="available_exams"]').text();

   $subscription.substate({
       courseId:$('#config p[title="object_id"]').text(),
       tableHeader:{
        'username':'Nome login',
        'email':'Email',
        'select':'Seleziona',
        'user_firstname':'Nome',
        'user_surname':'Cognome',
        'user_id':'Id utente',
        'actions':'Azioni'
        },
        user_login:$('#config p[title="user_login"]').text(),
        admin:Boolean($('#config p[title="can_edit"]').text()),
        max_subscribers:$('#config p[title="max_subscribers"]').text(),
        subscription_state:$('#config p[title="subscription_state"]').text(),
        subscribed_users:$('#config p[title="subscribed_users"]').text(),
        available_exams:eval('('+available_exams+')'),
        module_url:$('#config p[title="module_url"]').text()
   });

});