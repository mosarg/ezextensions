{* Selezione insegnanti - Full view *}


{run-once}
 {ezscript_require( array('classes/contentfilter.js','init_filter.js','classes/navigator.js','classes/navigator.js'))}
{/run-once}



{include uri='design:parts/global_variables.tpl' left_menu=false() left_nav_menu=false() extra_menu=false()}

{def $profHelperClasses=array('proffolder')
     $equivalentSchools=ezini( 'EquivalentSchools','School','scuola.ini')
     $parentNodeName=$node.parent.path_identification_string
     $faceletes=array()}
{def $clas1=fetch( 'class', 'list', hash( 'class_filter',
                           $profHelperClasses) )
     $subject=''}


 {if is_set($equivalentSchools[$parentNodeName])}
    {set $parentNodeName=$equivalentSchools[$parentNodeName]}
 {/if}

 
        
 {if eq($node.parent.class_identifier,'school_front')}
       {foreach $clas1[0].data_map.materie.content.db_options as $materia}
           {if eq($materia.scuola,$parentNodeName)}
                    {set $faceletes=$faceletes|append(hash(node_id,$node.node_id,url_alias,$node.url_alias|ezurl(no),title,$materia.name|wash('javascript'),view_parameters,
                hash('subject',$materia.identifier)))}
           {/if}    
       {/foreach}
 {/if}
 
<div class="content-view-full">
    <div class="class-profgroup">
        <div class="attribute-header">
            <h1>{attribute_view_gui attribute=$node.data_map.name}</h1>
        </div>
              
            
  
            {if $node.object.data_map.description.has_content}
                <div class="attribute-long">
                    {attribute_view_gui attribute=$node.data_map.description}
                </div>
            {/if}
       <div id="filter">
            <div id="interface"><ul class="filter-tabs"></ul></div>
            <div id="data">
                {if $node.object.data_map.short_description.has_content}
                <div class="attribute-short">
                    {attribute_view_gui attribute=$node.data_map.short_description}
                </div>
            {/if}
            </div>
        </div>
            
            
    </div>
</div>

<div id="filter_elements" style="display:none">
             <p title="show_all">{hash('node_id',$node.node_id,'url_alias',$node.url_alias|ezurl(no),'depth',1,'title','Mostra Tutto'|i18n( "design/scuola/filter" ))|json_encode()}</p>
             <p title="keys">{$faceletes|json_encode()}</p>
             <p title="navigator">div.pagenavigator</p>
             <p title="view_parameters">{$view_parameters|json_encode()}</p>
             <p title="initial_view">show_all</p>         
</div>

{undef}

