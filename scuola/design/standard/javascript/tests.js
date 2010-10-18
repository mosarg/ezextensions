/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */


YUI().use('node','event', 'io-ez', function(Y) {
    
var kind='1';
 
var contextObj = {
        name: "context"
    };

var div = Y.Node.get('#container');

//A function handler to use for successful requests:
var handleSuccess = function(ioId, o){
    Y.log(arguments);

    if(o.responseText !== undefined){




        var content = o.responseText.split(',')
            var s='';
        for (var i in content){
            s +=  "<li>"+content[i] + "</li>";
            
        }
        div.set("innerHTML", s);
        //var s =  "<li>PHP response: " + o.responseText + "</li>";
        //div.set("innerHTML", s);
    }
};

//A function handler to use for failed requests:
var handleFailure = function(ioId, o){
    Y.log("The failure handler was called.  Id: " + ioId + ".", "info", "example");
    if(o.responseXML !== undefined){
        var s = "<li>Transaction id: " + ioId + "</li>";
        s += "<li>HTTP status: " + o.status + "</li>";
        s += "<li>Status code message: " + o.statusText + "</li>";
        div.set("innerHTML", s);
    }
};

//Subscribe our handlers to IO's global custom events:
Y.on('io:success', handleSuccess);
Y.on('io:failure', handleFailure);
var cfg = {
 
    };

//Handler to make our XHR request when the button is clicked:
function makeRequest(e,kind){
    div.set("innerHTML", "Loading data from new request...");
    var request = Y.io.ez('scuola::enabledUsers::'+kind+'::xml', cfg);
    Y.log("Initiating request; Id: " + request.id + "."+kind+'xml', "info", "example");
}
// Make a request when the button is clicked:
Y.on("click", makeRequest,"#requestButton",contextObj,kind);

});







//YUI().use('node', 'event', 'io-ez', function( Y ){
//
//
//
//           var pippo=function (id,content){
//                alert(id);
//                alert(content.length);}
//
//        Y.io.ez.call('scuola::enabledUsers',pippo);
//
//          Y.on("click",pippo, "#demo");
//
//        }
//            );

