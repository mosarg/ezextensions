var megamenu  = {
    _init: function() {
        var self=this;
        var options=self.options;
        var $page=$('#page');

        options.hover_config.over=self._menuHover;
        options.hover_config.out=self._menuOut;
        options.content_end=parseInt($page.offset().left)+parseInt($page.css('width'));
        //self.element.find("li .sub").css({'opacity':'0'});
        //self.element.find('li').hoverIntent(options.hover_config);
        //self.element.find('li a').hoverIntent(options.hover_config);
        self._attachEvents();
        self._setupEventDelegation();

    },
    _attachEvents:function(){
        var self=this;
        var options=self.options;
        self.element.find('.root_menu').mouseenter(function(event){
            self._menuHover($(event.target));
        }).mouseleave(
            function(event){
                var $target=$(event.target);
                $('div#debug_one').html(parseInt($target.offset().top+$target.height())+' event_y '+event.pageY);
                if(!(event.pageY>$target.offset().top+$target.height())){
                    self._menuOut();

                }
            }
        );
        self.element.find('.sub').mouseleave(function(event){
            self._menuOut();
        });
    },
    _menuHover:function($target){
        var self=this;
        var options=self.options;
        var new_offset=0;
        self.element.find('.sub').hide();
        self.element.find('a.root_menu').removeClass('zero_node_open');
        $target.addClass('zero_node_open');

        var width=$target.parent('li').find(".sub").outerWidth();

        
        if ($target.data('shown')===undefined){
            if(width+$target.offset().left>options.content_end){
                new_offset=width-$target.outerWidth();
                $target.parent('li').find(".sub").offset({
                    left:-new_offset
                }).width(350);
            }

        }
        $target.parent('li').find(".sub").stop().fadeTo('fast', 1).show();
        $target.data('shown',true);
        

    },
    _menuOut:function(){
        var self=this;
        var $sub=self.element.find('.sub');

        var $zero_node=self.element.find('.root_menu').removeClass('zero_node_open');
        $sub.hide();  //after fading, hide it
    
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
    }

};

$.widget("ui.megamenu", megamenu);

$.ui.megamenu.defaults ={
    hover_config: {
        sensitivity: 2,
        interval: 50,
        timeout: 50
    },
    is_opened:false
};

