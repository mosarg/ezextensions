$(document).ready(function() {
    var action_url=$('p#action').text();
    var redirect=$('p#redirect').text();
    var $edit_form=$('#editform');
    $('#page').find('a').hide();
    $edit_form.find('a').show();
    
    cancelOnUpload=true;

    $edit_form.fancyLogin({
        texts:{
            1 : 'Troppo debole',
            2 : 'Password debole',
            3 : 'Sicurezza moderata',
            4 : 'Password sicura',
            5 : 'Password molto sicura'
        }
    });

    $edit_form.submit(function(){
        cancelOnUpload=false;
    });

    $(window).removeTempContent(action_url,redirect);
});


