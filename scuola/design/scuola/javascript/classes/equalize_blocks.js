(function($){
    
    var attributes=['attribute-header','attribute-image','attribute-short'];  
    function setBlockParamaters(blockdata,max_heights){
        var $item_handle;
        var block_items=blockdata['block_items'];
        for (var i in block_items){
            $item_handle=block_items[i].block_item_handle;
            for (var j in attributes){
                $item_handle.children('.'+attributes[j]).height(max_heights[attributes[j]]);
            }
        }
    }
    function getBlockParameters(block){
        var block_structure={};
        var index='';
        var current_heights={},max_heights={};
        block_structure['block_items']=new Array();
        block_structure['handle']=$(block);
        block_structure['type']=$(block).attr('class');
        //init max heights
        for (var i in attributes){
            max_heights[attributes[i]]=0;
        }
        
        $(block).find("[class|=class]").each(function(){
  
            for(var i in attributes){
                index=attributes[i];   
                current_heights[index]=$(this).children('.'+index).outerHeight();
                if(current_heights[index]>max_heights[index]){
                    max_heights[index]=current_heights[index]
                }
            }
          (block_structure['block_items']).push({
                'block-item-type':$(this).attr('class'),
                'attribute-header':current_heights['attribute-header'],
                'attribute-image': current_heights['attribute-image'],
                'attribute-short': current_heights['attribute-short'],
                'block_item_handle':$(this)
            })
        }); 
        block_structure['max_heights']=max_heights;
        return block_structure;
   
    }  
     
    $.fn.equalizeBlocks= function(){
        var blocks={};
        var max_heights={};
        $('.content-view-full').find("[class|=block-type]").each(function(){
            if(blocks[$(this).attr('class')]){
                blocks[$(this).attr('class')].push(getBlockParameters(this));
            }else{
                blocks[$(this).attr('class')]=[getBlockParameters(this)];
            }
        });
        //init max heights  
        for(var i in blocks){
            max_heights[i]={};
        }
        
        for (var i in blocks){
            for(var j in attributes){
                max_heights[i][attributes[j]]=0;
            }
        }
       
        //get max heights
        for (var i in blocks){
            for (var j in blocks[i]){
                for(var k in attributes){
                    if(max_heights[i][attributes[k]]<blocks[i][j]['max_heights'][attributes[k]]){
                        max_heights[i][attributes[k]]=blocks[i][j]['max_heights'][attributes[k]];
                    }
                }
            }
        }
              
        //set max heights
        for (var i in blocks){
            for (var j in blocks[i]){
                setBlockParamaters(blocks[i][j],max_heights[i]);
            }
        }
    };
})(jQuery)



