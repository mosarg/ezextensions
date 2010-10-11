var ajaxlogin  = {
    _init: function() {
        var self=this;
        var options=self.options;
        var $page=$('#page');
        options.content_end=parseInt($page.offset().left)+parseInt($page.css('width'));
        
        self._attachEvents();
        self._setupEventDelegation();

    },
    _attachEvents:function(){
        var self=this;
        var options=self.options;
        $('li#registeruser').mouseenter(function(event){
            self._destroyLoginWindow();
            options.login_visible=false;
        }
    );
        self.element.children('a#login_link').mouseenter(
            function(){
                if(!options.login_visible){
                    self._renderLoginWindow();
                    options.login_visible=true;
                }
                
            }).mouseout(function(event){
                 var offset_exit_x=$('a#login_link').innerWidth();
                 if(event.pageX > options.content_end-10) {
                 self._destroyLoginWindow();
                 options.login_visible=false;
             }
            });
        self.element.find('#ajax_login_form').mouseout(function(event){

             $('div#debug_one').html(event.pageX);

             if((event.pageX > options.content_end-20)||(event.pageX<options.login_window_offset_x+10)||
                    (event.pageY>options.login_window_offset_y)) {
                 self._destroyLoginWindow();
                 options.login_visible=false;
             }
        });
    },
    _renderLoginWindow:function(){
        var self=this;
        var options=self.options;
        var $login_form=self.element.find('#ajax_login_form');
        var $login_wrapper=self.element.find('#login_wrapper');
        var $links=$('div#links');
        var action='majaxinterfacetemplate::login_form';
        
        function  loginpos(formcontent){
            options.loaded=1;
            $login_form.html(formcontent);
            $login_wrapper.css({
                height:$login_form.outerHeight(),
                width:$login_form.outerWidth()
            });

            var height=$login_form.outerHeight();
            var width=$login_form.outerWidth();       
            options.login_window_width=width;
            var new_offset_x=parseInt(options.content_end)-parseInt(width);
            var new_offset_y=$links.outerHeight()+$links.offset().top;

            options.login_window_offset_x=new_offset_x;
            options.login_window_offset_y=height+$links.offset().top;

            $login_wrapper.offset({
                left:new_offset_x,top:new_offset_y
            });//For some strange reason you must

            $login_wrapper.offset({
                left:new_offset_x,top:new_offset_y
            });//set offset twice in some browsers(webkit)
                     
            $login_form.offset({
                top:-height
            }).show();

            $login_form.stop().animate({
                top:'0px'
            },300,'easeInBounce');
            options.html=formcontent;
        }
        if(options.loaded==0) {

        $.ez(action,{
            postdata:'ready'
        },function(data) {
            loginpos(data.content);
        });}else{
            loginpos(options.html);
        }
    },
    _destroyLoginWindow:function(){
        var self=this;
        var $login_form=self.element.find('#ajax_login_form');
        var height='-'+$login_form.outerHeight()+'px';
        $login_form.stop().animate({
            top:height
        },300,'easeOutBounce').hide();
        $login_form.html('');
    },
    _doLogin:function($target){
        var self=this;
        var username=self.element.find('input[name="Login"]').val();
        var password=self.element.find('input[name="Password"]').val();

        var login_data=JSON.stringify({
                'username':username,
                'password':password,
                'browser':JSON.stringify(jQuery.browser)
        });
        var action='majaxinterface::login::ready'
        
        $.ez(action,{
            postdata:login_data
        },function(data){
              if (data.content.success){
              location.reload();
              }else{
                  self._renderError(data.content.error);
              }
        });

    },
    _renderError:function(error){
        var self=this;
        var $error_box=self.element.find('div.error_box');
        var $login_form_wrapper=self.element.find('#login_wrapper');
        var original_height=$login_form_wrapper.outerHeight();
        $login_form_wrapper.height(original_height+$error_box.outerHeight()+20);

        $error_box.stop(true,true).html(error).fadeIn(600).delay(5000).fadeOut(600,function(){
            $login_form_wrapper.height(original_height);
        });
        
    },
    _setupEventDelegation : function() {
        var self = this;
        var options = this.options;
        this.element.click(function(event){
            var $target=$(event.target);
            if ($target.hasClass('ajax_login_submit')) {
                self._doLogin($target)
            }
        });
        this.element.keypress(function(event){
            var $target=$(event.target);
                if (event.which==13){
                    self._doLogin($('ajax_login_submit'));
                }


        });
    }

};

$.widget("ui.ajaxlogin", ajaxlogin);

$.ui.ajaxlogin.defaults ={
    login_visible:false,
    content_end:0,
    loaded:0,
    html:''
};
