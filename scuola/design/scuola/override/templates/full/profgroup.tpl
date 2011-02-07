{* Selezione insegnanti - Full view *}

{include uri='design:parts/global_variables.tpl' left_menu=false() left_nav_menu=false() extra_menu=false()}


{def $profHelperClasses=ezini( 'ClassIds', 'infoprof', 'scuola.ini' )
     $equivalentSchools=ezini( 'EquivalentSchools','School','scuola.ini')
     $parentNodeName=$node.parent.path_identification_string}


 {if is_set($equivalentSchools[$parentNodeName])}
    {set $parentNodeName=$equivalentSchools[$parentNodeName]}
 {/if}

<div class="border-box">
<div class="content-view-full">
    <div class="class-profgroup">
        <div class="attribute-header">
            <h1>{attribute_view_gui attribute=$node.data_map.name}</h1>
        </div>
        {*Show prof personal information on prof folder page*}
        {def $clas1=fetch( 'class', 'list', hash( 'class_filter',
                           $profHelperClasses) )
             $subject=''}
        
        {if is_set($view_parameters.subject)}
            {set $subject=$view_parameters.subject}
        {/if}
        
        {if eq($node.parent.class_identifier,'school_front')}
               <form class="proffilter" action={"content/action"|ezurl} method="post">
                     <fieldset>
		<legend>{"Filtra per materia: "|i18n("design/scuola/full/profgroup")}</legend>
		<label for="filter_subject" class="hide">Dia</label>
			<select name="(subject)" id="filter_subject" title="{'Day'|i18n( 'design/.../node/view/full' )|wash()}">
                            {foreach $clas1[0].data_map.materie.content.db_options as $materia}
                               
                            {if $materia|contains($parentNodeName)}
                                <option value="{$materia.identifier}"
                                        {cond(eq($subject,$materia.identifier)
                                                ,'selected="selected"')}>{$materia.name|wash}</option>
                                {/if}
		            {/foreach}
			</select>
	<input type="hidden" name="DestinationURL" value="{$node.url_alias}" />
	<input type="submit" value="filter"/>
         {if is_set($view_parameters.subject)}
       <div class="show_all rounded"><a  href={$node.url_alias|ezurl}>{"Mostra tutti"|i18n("design/scuola/full/profgroup")}</a></div>
       {/if}
                   </fieldset>
        </form>
       {/if}
       
        <div class="sortbuttons" >
            <h4>Ordine:</h4>
            <a id="sortbuttonup" class="rounded">Alfabetico ascendente</a>
            <a id="sortbuttondown" class="rounded">Alfabetico discendente</a>
            <a id="telefonobutton" class="rounded">Numero di telefono</a>
            <a id="emailbutton" class="rounded">Email</a>
            <a id="ruolobutton" class="rounded">Ruolo</a>
        </div>
 
            {if $node.object.data_map.short_description.has_content}
                <div class="attribute-short">
                    {attribute_view_gui attribute=$node.data_map.short_description}
                </div>
            {/if}
  
            {if $node.object.data_map.description.has_content}
                <div class="attribute-long">
                    {attribute_view_gui attribute=$node.data_map.description}
                </div>
            {/if}

            {def $classes = array( 'proffolder' )
                 $children = array()
                 $info_obj=array()
                 $materiaT=array()}
            {if is_set($view_parameters.subject)}
                {set $children=fetch_alias( 'children', hash( 'parent_node_id', $node.node_id,
                                                          'offset', $view_parameters.offset,
                                                          'sort_by', $node.sort_array,
                                                          'class_filter_type', 'include',
                                                          'class_filter_array', $classes
                                                            ) )}
            <div class="content-view-children">
            <div class="legend">
                    <div>{"Docente "|i18n("design/scuola/full/profgroup")}</div>
                    <div>{"Email"|i18n("design/scuola/full/profgroup")}</div>
                    <div>{"Telefono"|i18n("design/scuola/full/profgroup")}</div>
                    <div>{"Ruolo"|i18n("design/scuola/full/profgroup")}</div>
               </div>
                {foreach $children as $child sequence array('light','dark') as $style }
                    {set $info_obj=fetch_alias( 'children', hash( 'parent_node_id', $child.node_id,
                                                          'offset', $view_parameters.offset,
                                                          'sort_by', $node.sort_array,
                                                          'class_filter_type', 'include',
                                                          'class_filter_array', array( 'infoprof')))}
                    {if gt($info_obj|count,0)}
                        {set $materiaT=$info_obj[0].data_map.materie.content}
                            {if $materiaT|contains(concat($view_parameters.subject,'-',$parentNodeName))}
                                <div class="{$style}">
                                    {node_view_gui view='line' content_node=$child}
                                </div>
                            {/if}
                    {/if}
                {/foreach}
             
            </div>

            {else}
                    {set $children=fetch_alias( 'children', hash( 'parent_node_id', $node.node_id,
                                                          'offset', $view_parameters.offset,
                                                          'sort_by', $node.sort_array,
                                                          'class_filter_type', 'include',
                                                          'class_filter_array', $classes
                                                            ) )}
            <div class="content-view-children">
               {*da rifare*}
         
               <div class="legend">
                    <div>{"Docente "|i18n("design/scuola/full/profgroup")}</div>
                    <div>{"Email"|i18n("design/scuola/full/profgroup")}</div>
                    <div>{"Telefono"|i18n("design/scuola/full/profgroup")}</div>
                    <div>{"Ruolo"|i18n("design/scuola/full/profgroup")}</div>
               </div>
                {foreach $children as $child }
                       {node_view_gui view='line' content_node=$child}
                {/foreach}
            
            </div>
            {/if}
          

       
    </div>
</div>
</div>
 {undef}
<script type="text/javascript" src={'javascript/tinysort.js'|ezdesign} ></script>
<script type="text/javascript" src={'javascript/listsort_profgroup.js'|ezdesign} ></script>
