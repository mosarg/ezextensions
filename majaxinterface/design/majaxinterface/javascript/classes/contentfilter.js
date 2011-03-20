var contentfilter  = {
    _init: function() {
        var self=this;
        var options=self.options;
 
        self._drawFilterInterface();
        self._setupEventDelegation();
        
        if (options.initial_view){
           self._loadFilteredFragment($('#show_all'));
        }

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
        //append show all facelet
        
        
        
        for (var i in options.keys){
            $('<li></li>').append($('<a class="filter_facelet">'+options.keys[i].title+'</a>').data('facelet',options.keys[i])).appendTo($tabscontainer);
        //$('<li><a>'+options.keys[i].title+'</a>  </li>').appendTo($tabscontainer).data('facelet',options.keys[i]);
        }
        $('<div class="detach"></div>').append($('<a id="show_all" class="filter_facelet">'+options.show_all.title+'</a>').data('facelet',options.show_all)).prependTo(self.element.children('#interface'));
    },
      _loadFilteredFragment:function($target){
        
        var self=this;
        var cache=self.options.cache;
        var facelet=$target.data('facelet');
        var view_parameters='';
        //set ajax loader 
        self.element.children("#data").html('<div class="loader"></div>');
        
        $('li.selected').removeClass('selected shadow-inside');
        $target.parent('li').addClass('selected shadow-inside');
        
        
        if (facelet.view_parameters){
            for (i in facelet.view_parameters){
                view_parameters+='/('+i+')/'+facelet.view_parameters[i];
            }
        }
        
        if (facelet.depth){
            var ezaction='content/view/embed/'+facelet.node_id+'/(depth)/'+facelet.depth+view_parameters;
        }else{
            var ezaction='content/view/embed/'+facelet.node_id+view_parameters;
        }
        
        if (cache[ezaction]){
            self.element.children("#data").html(cache[ezaction]);
            self._initNavigator();         
        }else{
        
        $.ezrun(ezaction,{
            postdata:'ready'
        },function(data){
            cache[ezaction]=data;
            self.element.children("#data").html(data);
            self._initNavigator();  

        });
        }
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
    is_opened:false,
    cache:new Object(),
    initial_view:false
};



