var pagenavigator = {
    _init: function() {
        var self=this;
        var options=self.options;
        self._reset();
        self._drawFilterInterface();
        self._attachEvents();
       
       

    }
    ,_reset:function(){
        $('a.google-navigator').die().removeData();
    },
    _drawFilterInterface:function(){
        
        $('a.google-navigator').each(function(){
          //alert(this.title.match(/\(offset\)\/\d+/));
           
           var offset=this.title.match(/\(offset\)\/\d+/)!=null?this.title.match(/\(offset\)\/\d+/).pop():0;
           var depth=this.title.match(/\(depth\)\/\d+/)!=null?this.title.match(/\(depth\)\/\d+/).pop():'';
           
           
            $(this).data('href',{
                href:this.title,
                offset:offset,
                depth:depth
               });
           $(this).removeAttr('title');
        });
           
    },
    _attachEvents:function(){
        var self=this;
        $('a.google-navigator').live('click',function(event){
             self._loadFilteredFragment($(event.target));
            
        });
 
    },_loadFilteredFragment:function($target){
        
        var self=this;
        var cache=self.options.cache;
        var depth='';
        var node_id=self.options.node_id;
        var navigator_data=JSON.stringify({
                'offset':10                
        });
        
        //set ajax loader 
        $('.'+self.options.box_type).prepend('<div class="navigator_loader"></div>');
        
        var link_data=$target.data('href');
       
        
        if (link_data.depth.length>1){
            depth ='/'+link_data.depth;
        }
        
        var href=link_data.offset==0?'content/'+self.options.view_type+'/'+node_id+depth:'content/'+self.options.view_type+'/'+node_id+'/'+link_data.offset+depth;
        
        if(cache[href]){
            $('.'+self.options.box_type).html(cache[href]).children('.'+self.options.box_type).unwrap();
            self.element=$('div.pagenavigator');
            self._drawFilterInterface(); 
        }else{
             
        $.ezrun(href,{
                        postdata:navigator_data
                    },function(data){
                       cache[href]=data;
                       $('.'+self.options.box_type).html(data).children('.'+self.options.box_type).unwrap();
                       self.element=$('div.pagenavigator');
                       self._drawFilterInterface();   
                      // window.history.pushState({href:href}, 'Title','/'+ href);
                    });
        }
    },
    destroy:function(){
           
        $('a.google-navigator').die().removeData();
        this.element.unbind();
        this.destroy();
	

    }

};

$.widget("ui.pagenavigator", pagenavigator);

$.ui.pagenavigator.defaults ={
    hover_config: {
        sensitivity: 2,
        interval: 50,
        timeout: 50
    },
    is_opened:false,
    cache:new Object()
};
