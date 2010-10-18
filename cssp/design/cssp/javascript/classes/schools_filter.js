var schoolfilter  = {
    _init: function() {
        this._renderInterface();
        this._setupEventDelegation();
    },
    _renderInterface:function(){
        var self=this;
        var button;
        var facetes=self.options.facetes;
        var facetes_names=self.options.facetesNames;
        var $inputs=self.element.find('#inputs');
        for (var i in facetes){
            button='<div class="button_cont" id="'+facetes[i]+'_block"  title="'+facetes[i]+'">\n\
                    <a class="facete_button" title="'+facetes[i]+'">'+facetes_names[facetes[i]]+'</a>\n\
                    </div>';
            $(button).appendTo($inputs);
        }
    },
    _submitQuery:function($target){
        var self=this;
        this.element.find('input.filter_input').hide();
        
        var action='cssp::fetchschools::'+self.options.parentNodeId+'::'+$target.val()+'::'+$target.attr('id');
        $.ez(action,{
            postdata:'ready'
        },function(data){
            self._renderFilterResults(data.content);
        });
    },
    _startFilter:function($target){
        var id;
        id=$target.attr('title');
        this.element.find('input.filter_input').remove();
        this.element.find('div.button_cont').children('a.facete_element').remove();
        this.element.find('#filter_results').children('a').remove();
        $('<input id="'+id+'" class="filter_input" type="text" />').appendTo($target.parent());
    },
    _renderFilterResults:function(results){
        var subfilters=new Object;
        var facetes=this.options.facetes;
        var facete,$school;
        var self=this;
        for ( facete in facetes){

            subfilters[facetes[facete]]=new Object;
        }
        var $container=this.element.children('#filter_results');
        for (var i in results){
            
            for (facete in facetes){
                subfilters[ facetes[facete] ][ results[i][ facetes[facete] ] ]+=1;
                if (isNaN(subfilters[facetes[facete]][results[i][facetes[facete]]])) subfilters[facetes[facete]][results[i][facetes[facete]]]=1;
            }
            $school=$('<a class="school_entry" href="/'+results[i].url+'">'+results[i].tipo+results[i].titolo_plesso+'</a>').appendTo($container);
            $school.data('school',results[i]);
        }


        for (facete in subfilters){
            self._createSubfilter(facete,subfilters[facete]);
        }
    },
    _applyFacete:function($target){
        var self=this;
        var facete=$target.attr('title'),filter=$target.attr('id'),$remove_facete;
        $target.siblings('a.current_facete').removeClass('current_facete')
        $target.addClass('current_facete');
        var regexp=new RegExp();
        self.options.current_facetes[facete]=filter;
        self.element.find('.school_entry').show();
        $target.parent().find('.remove_facete').remove();
        $target.removeClass('disabled');
        $target.siblings('.facete_element').addClass('disabled');

        self.element.find('.school_entry').each(function(){
            var school_data=$(this).data('school');

            for (var current_facete in self.options.current_facetes){

                if(current_facete!='titolo_studio'){
                    if(school_data[current_facete].replace(/\"/g,'')!=self.options.current_facetes[current_facete].replace(/\"/g,'')){
                        $(this).hide();
                    }
                }else{
                    regexp.compile(self.options.current_facetes[current_facete],'g');
                    if(!regexp.test(school_data[current_facete])) $(this).hide();
                }
            }

            
        });
        $remove_facete=$('<a title="Rimuovi Filtro" id="'+facete+'" class="remove_facete">X</a>').insertAfter($target.parent().children('a.facete_button'));

        $remove_facete.click(function(){
            self._removeFacete($(this).attr('id'));
        });
    },
    _reapplyFacete:function(){
        var self=this;
        self.element.find('.school_entry').each(function(){
            var school_data=$(this).data('school');
            for (var current_facete in self.options.current_facetes){
                if(school_data[current_facete].replace(/\"/g,'')!=self.options.current_facetes[current_facete].replace(/\"/g,'')){
                    $(this).hide();
                }
            }
        });

    },
    _removeFacete:function(facete){
        var self=this;

        delete self.options.current_facetes[facete];
        self.element.find('.school_entry').show();
        self.element.find('a#'+facete).remove();
        self.element.find('a[title="'+facete+'" ]').removeClass('disabled current_facete');

        self._reapplyFacete();

    },
    _createSubfilter:function(facete,filter_values){
        
        var self=this;
        var temp_value,temp_id;
        var $container=self.element.find('div[title="'+facete+'"]');

        if(facete=='titolo_studio'){
            var current_filter_value=$('input#titolo_studio').val();
            var regexp =new RegExp();
            var study_title=new Object();
            var temp_values=Array(),values=new Array();
            var temp_study;
            
            for (var value in filter_values){
            
                if (current_filter_value){
                    current_filter_value=current_filter_value.replace(/\s+/g,'[\\s\\w]*');
                    regexp.compile('\\w*'+current_filter_value+'\\w*','g');
                    temp_values=value.match(regexp);
                    //study_title[regexp.exec(value)]=1;
                   for (var new_value in temp_values){
                       study_title[temp_values[new_value]]=1;
                   }


                }else{
                    if(value!='') {
                        temp_study=value.replace(/\"/g,'').split(',');
                        for (var i in temp_study){
                            study_title[temp_study[i]]=1;
                        }
                    }
                }
            }
            for (var unique_value in study_title){
                temp_value=unique_value.replace(/_/g," ");
                temp_id=unique_value.replace(/\"/g,'');
                $('<a class="facete_element titolo_studio_element" id="'+temp_id+'"title="'+facete+'">'+temp_value+'</a>').appendTo($container);
            }
          

        }else{

            for (var value in filter_values){
                temp_value=value.replace(/_/g," ");
                temp_id=value.replace(/\"/g,'');
                $('<a class="facete_element" id="'+temp_id+'"title="'+facete+'">'+temp_value+'</a>').appendTo($container);
            }
        }

    },
    _setupEventDelegation : function() {
        var self = this;
        var options = this.options;
        this.element.click(function(event){
            var $target=$(event.target);
            if ($target.hasClass('facete_button')) {
                self._startFilter($target)
            }
            if ($target.hasClass('facete_element')){
                self._applyFacete($target);
            }
        });
        this.element.keypress(function(event){
            var $target=$(event.target);
            if ($target.hasClass('filter_input')){
                if (event.which==13){
                    self._submitQuery($target);
                }

            }
        }
        );

    }

};

$.widget("ui.schoolfilter", schoolfilter);

$.ui.schoolfilter.defaults ={
    facetes:'',
    parentNodeId:2,
    current_facetes:new Object
};


