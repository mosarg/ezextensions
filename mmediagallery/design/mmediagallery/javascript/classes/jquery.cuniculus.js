/*cuniculus media gallery*/
;(function($){
var allImages = {};
var imageCounter = 0;
var cuniculus={
    
    _init:function(){
        alert(this._getImage('cdcdc?cose'));
    },
    _normalizeHash: function(hash) {
			return hash.replace(/^.*#/, '').replace(/\?.*$/, '');
		},
                
    _getImage: function(hash) {
        
                            if (!hash)
			    return undefined;

                            hash = cuniculus._normalizeHash(hash);
                            alert(hash);
                            return allImages[hash];
		},
     _insertImage:function(){
         
     },           
     _loadImages:function(){
         var self=this;
         self.element
     }
} 

$.widget("ui.cuniculus", cuniculus);

$.ui.cuniculus.defaults ={
    image_number:35,
    columns:3,
    hover_config: {
        sensitivity: 2,
        interval: 50,
        timeout: 50
    },
    is_opened:false
};
})(jQuery);