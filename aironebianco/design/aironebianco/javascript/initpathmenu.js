
var pathmenu  = {
    _init: function() {
    var $element=this.element.find('#level_0');
    this._expandMenu();
    this._loadMenu($element);
    

    },
    _loadMenu:function($element){
        var self=this;
        var node_id=$element.attr('name');
        var $current_tree=$('.menu').find('.'+node_id);
        self._renderElements($current_tree);
    },
    _renderElements:function($block){
        var self=this;
        var i;
        for(i=1;i<4;i++){
           self.element.find('li.level_'+i).append($block.find('a.level_'+i).clone());
        }
   },
   _expandMenu:function(){
       var self=this;
       var options=self.options;
       if (options.levels<=4){
           self.element.find('ul').append($('<li><span class="path-separator">::</span></li><li class="level_'+options.levels+'"></li>'));
       }
   },
    _attachEvents:function(){

    },
    _menuHover:function($target){


    },
    _setupEventDelegation : function() {

    }

};

$.widget("ui.pathmenu", pathmenu);

$.ui.pathmenu.defaults ={
    levels:1,
    is_opened:false
};

$(document).ready(function() {
    var current_levels=$('p[title="level"]').text();
    $("#path").pathmenu({
            levels:current_levels
           });


});

