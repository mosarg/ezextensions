$(document).ready(function() {
    var action_url=$('p#action').text();
    var redirect=$('p#redirect').text();
    var $edit_form=$('#editform');
    $('#page').find('a').hide();
    $edit_form.find('a').show();
    cancelOnUpload=true;

    $edit_form.submit(function(){
        cancelOnUpload=false;
    });

    
    $('input[name="PreviewButton"]').click(function(){
        cancelOnUpload=false;
    });
    $('input[name="StoreExitButton"]').click(function(){
        cancelOnUpload=false;
    });
    $('input[name="PublishButton"]').click(function(){
        cancelOnUpload=false;
    });
    $('input[name="VersionsButton"]').click(function(){
        cancelOnUpload=false;
    });
     $('input[name="FromLanguageButton"]').click(function(){
        cancelOnUpload=false;
    });

   
    $(window).removeTempContent(action_url,redirect);

});

