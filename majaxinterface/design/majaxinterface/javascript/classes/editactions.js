(function($){
    $.fn.removeTempContent = function(user_module,redirect) {
        if(user_module!=''){
            this.bind('beforeunload', function() {
                if (cancelOnUpload){
                    $.ajax({
                        async:false,
                        url:user_module,
                        type:'POST',
                        data:{
                            DiscardButton:'Discard',
                            RedirectIfDiscarded:redirect,
                            DiscardConfirm:'0'
                        },
                        success:function(){
                            cancelOnUpload=false;
                        }
                    });
                }
            }
            );
        }
    }
})(jQuery)

