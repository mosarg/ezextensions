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
            
            
            $(this).data('href',{
                href:this.title,
                offset:offset
               });
           $(this).removeAttr('title');
        });
           
    },
    _attachEvents:function(){
        var self=this;
        var options=self.options;
        $('a.google-navigator').live('click',function(event){
             self._loadFilteredFragment($(event.target));
            
        });
 
    },_loadFilteredFragment:function($target){
        
        var self=this;
        var node_id=self.options.node_id;
        var navigator_data=JSON.stringify({
                'offset':10                
        });
       
        var href=$target.data('href').offset==0?'content/view/'+self.options.view_type+'/'+node_id:'content/view/'+self.options.view_type+'/'+node_id+'/'+$target.data('href').offset;
     
        $.ezrun(href,{
                        postdata:navigator_data
                    },function(data){
                      
                       var $inner_content=$('.'+self.options.box_type).html(data);
                       self.element=$('div.pagenavigator');
                       self._drawFilterInterface();
                                             
                    });
        
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
    is_opened:false
};
