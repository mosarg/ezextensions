

$(document).ready(function(){

    var data='';
        data=data+'State leggendo queste pagine con <strong>Internet Explorer</strong> vi consigliamo di passare ad un browser più sicuro e funzionale.';
        data=data+'Potete scegliere tra </br> <a href="http://getfirefox.it">Firefox | </a>';
        data=data+'<a href="http://www.google.it/chrome"> Google Chrome | </a>';
        data=data+'<a href="http://www.apple.com/it/safari/">Apple Safari | </a>';
        data=data+'<a href="http://www.opera.com/">Opera</a>';
        
 if(jQuery.browser.msie && jQuery.browser.version >6){
        $('div#iesucks').html('<p>'+data+'</p>').show();
        }else{
        var datablock='';
        datablock=datablock+'Sito in costruzione la versione 6 di Internet Explorer NON è supportata. ';
        datablock=datablock+'Per poter Visualizzare i contenuti di questo sito è necessario installare uno dei seguenti browser:';
        datablock=datablock+'</br> <a href="http://getfirefox.it">Firefox | </a>';
        datablock=datablock+'<a href="http://www.google.it/chrome"> Google Chrome | </a>';
        datablock=datablock+'<a href="http://www.apple.com/it/safari/">Apple Safari | </a>';
        datablock=datablock+'<a href="http://www.opera.com/">Opera</a>';
        $('div#iesucks').html('<p>'+data+'</p>').show();
}
      

});