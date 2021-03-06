<div class="border-box">
   <div class="content-view-full">
    <div class="class-folder folder-layout2">
        {* contenuto in preparazione *}
        {if $node.object.state_id_array|contains('6')}
        <div class="wip rounded shadowmore">
            <p>{"Contenuto in preparazione non ancora visibile pubblicamente"|i18n('scuola/state')}</p>
        </div>
        {/if}

        <div class="attribute-header">
            <h1>{$node.name|wash}</h1>
        </div>

        <div class="infotools">
          {foreach $cont_children as $child }
               {if $child.class_identifier|eq('event_calendar')}
               <div class="calendar">
                  <a href={$child.url_alias|ezurl()}>
                  <img alt="calendar" src={'icons/calendar.png'|ezimage()}/></a>

                  <a href={$child.url_alias|ezurl()}>
                   {$child.name}
                   </a>
               </div>
               {/if}
          {/foreach}
        </div>


        {if $node.data_map.short_description.has_content}
                <div class="attribute-short">
                    {attribute_view_gui attribute=$node.data_map.short_description}
                </div>
        {/if}

        {if $node.data_map.description.has_content}
            <div class="attribute-long">
                {attribute_view_gui attribute=$node.data_map.description}
            </div>
        {/if}

        

         {if gt($cont_count,0)}
               <div class="content-view-children">
               {foreach $cont_children as $child }
                {if $cont_classes|contains($child.class_identifier)}
                  {node_view_gui view=line content_node=$child}
                {/if}
                {/foreach}
                </div>
         {/if}

         <div class="float-break"></div>
           {if gt($children_count,0)}

           <div class="content-view-children">
                {foreach $children as $child }
                  {node_view_gui view=line content_node=$child}
                {/foreach}
           </div>
        
        {/if}
    </div>
</div>

</div>