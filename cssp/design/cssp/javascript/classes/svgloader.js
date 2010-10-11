var svgloader  = {
    _init: function() {
        var self=this;
        $(self.options.active_elements_list).each(function(){
            self.options.active_elements_hash[this.id_code]=this.url_alias;
         })

        var renderInterface= function(svg){
            self._attachEvents(svg);
        };
        this._loadSvg(renderInterface);
    },
    _loadSvg:function(renderInterface){
        var self=this;
        var options=self.options;
        var $container=self.element.find('#graph');
        $container.svg();
        var svg = $container.svg('get');
        svg.load(options.svg_url,{
            addTo: true,
            changeSize: false,
            onLoad: renderInterface
        });
        svg.configure({
            width:  $container.width(),
            height:  $container.height()
        });
        svg.style('.selected {stroke:black;stroke-width:3;}');
    },
    _attachEvents:function(svg){
        var self=this;
        var style=new Object();
        var elements_list=self.options.active_elements_list;
        var elements_hash=self.options.active_elements_hash;
        for (var i in elements_list){
             $('#'+elements_list[i].id_code,svg.root()).click(function(event){
               location.href='/'+elements_hash[$(event.target).attr('id')];
            }).
            mouseover(function(event){
                       
            $(event.target).addClass('selected');
                      
                            }).
            mouseout(function(event){
                $(event.target).removeClass('selected');
            
             });

        }
    }
}

$.widget("ui.svgloader", svgloader);

$.ui.svgloader.defaults ={
    svg_url:'',
    node_id:2,
    active_elements_hash:new Object()
};
