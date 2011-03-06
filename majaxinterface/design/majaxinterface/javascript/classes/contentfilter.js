var contentfilter  = {
    _init: function() {
        var self=this;
        var options=self.options;
 
        self._drawFilterInterface();
        self._setupEventDelegation();

    },
    _initNavigator:function(){
        var self=this;         
        var node_id=$('#navigator_elements p[title="node_id"]').text();
        var box_type=$('#navigator_elements p[title="box_type"]').text();
        var view_type=$('#navigator_elements p[title="view_type"]').text();
        
       
        self.options.navigator=$(self.options.pagenavigator ).pagenavigator({
            node_id:node_id,
            box_type:box_type,
            view_type:view_type
        });
      
    },
    _drawFilterInterface:function(){
        var self=this;
        var  options=self.options;
        var  $tabscontainer=self.element.find('ul.filter-tabs');
        //var  $container=$('<li></li>');
        for (var i in options.keys){
        
         $('<li></li>').append($('<a class="filter_facelet">'+options.keys[i].title+'</a>').data('facelet',options.keys[i])).appendTo($tabscontainer);
            //$('<li><a>'+options.keys[i].title+'</a>  </li>').appendTo($tabscontainer).data('facelet',options.keys[i]);
           
        }
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
    _loadFilteredFragment:function($target){
        
        var self=this;
        
        var facelet=$target.data('facelet');
        
        $('li.selected').removeClass('selected shadow');
        $target.parent('li').addClass('selected shadow');
        
        var ezaction='content/view/embed/'+facelet.node_id;
        
        $.ezrun(ezaction,{
            postdata:'ready'
        },function(data){
           
            self.element.children("#data").html(data);
            self._initNavigator();  

        });
        
    },
    _setupEventDelegation : function() {
        var self = this;
        var options = this.options;
        this.element.click(function(event){
            var $target=$(event.target);
            if ($target.hasClass('filter_facelet')) {
                self._loadFilteredFragment($target)
            }
        });
    }

};

$.widget("ui.contentfilter", contentfilter);

$.ui.contentfilter.defaults ={
    hover_config: {
        sensitivity: 2,
        interval: 50,
        timeout: 50
    },
    is_opened:false
};



