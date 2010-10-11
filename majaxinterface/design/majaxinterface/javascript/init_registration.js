$(document).ready(function() {

    var $user_registration_form=$('#user_registration_form');
    $user_registration_form.fancyLogin({
        texts:{
            1 : 'Troppo debole',
            2 : 'Password debole',
            3 : 'Sicurezza moderata',
            4 : 'Password sicura',
            5 : 'Password molto sicura'
        }
    });


    cancelOnUpload=true;
    $user_registration_form.submit(function(){
        cancelOnUpload=false;
    });
    $(window).removeTempUser('/user/register/');
    

});
