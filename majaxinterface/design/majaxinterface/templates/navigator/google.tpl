{if is_set($depth)|not}
    {def $depth=1}
{/if}

{default page_uri_suffix=false()
         left_max=7
         right_max=6}
{default name=ViewParameter
         page_uri_suffix=false()
         left_max=$left_max
         right_max=$right_max}

{let page_count=int( ceil( div( $item_count,$item_limit ) ) )
      current_page=min($:page_count,
                       int( ceil( div( first_set( $view_parameters.offset, 0 ),
                                       $item_limit ) ) ) )
      item_previous=sub( mul( $:current_page, $item_limit ),
                         $item_limit )
      item_next=sum( mul( $:current_page, $item_limit ),
                     $item_limit )

      left_length=min($ViewParameter:current_page,$:left_max)
      right_length=max(min(sub($ViewParameter:page_count,$ViewParameter:current_page,1),$:right_max),0)
      view_parameter_text=""
      depth_text=concat('/(depth)/',$depth)
      offset_text='/(offset)/'}
{* Create view parameter text with the exception of offset *}
{section loop=$view_parameters}
 {section-exclude match=eq($:key,offset)}
 {section-exclude match=$:item|not}
 {set view_parameter_text=concat($:view_parameter_text,'/(',$:key,')/',$:item)}
{/section}


{section show=$:page_count|gt(1)}

<div class="pagenavigator">
   
<p>

     {switch match=$:item_previous|lt(0) }
       {case match=0}
      <span class="previous"><a class="google-navigator" title={concat($page_uri,$:item_previous|gt(0)|choose('',concat($:offset_text,$:item_previous)),$:view_parameter_text,$page_uri_suffix)|ezurl}>&laquo;&nbsp;{"Previous"|i18n("design/standard/navigator")}</a></span>
       {/case}
       {case match=1}
       {/case}
     {/switch}

    {switch match=$:item_next|lt($item_count)}
      {case match=1}
        <span class="next"><a class="google-navigator" title={concat("test",$page_uri,$:offset_text,$:item_next,$:view_parameter_text,$page_uri_suffix)|ezurl}>{"Next"|i18n("design/standard/navigator")}&nbsp;&raquo;</a></span>
      {/case}
      {case}
      {/case}
    {/switch}

<span class="pages">
{section show=$:current_page|gt($:left_max)}
<a class="google-navigator" title={concat($page_uri,$:view_parameter_text,$page_uri_suffix)|ezurl}>1</a>
{section show=sub($:current_page,$:left_length)|gt(1)}
...
{/section}
{/section}

    {section loop=$:left_length}
        {let page_offset=sum(sub($ViewParameter:current_page,$ViewParameter:left_length),$:index)}
          <span class="other"><a class="google-navigator" title={concat($page_uri,$:page_offset|gt(0)|choose('',concat($:offset_text,mul($:page_offset,$item_limit))),$ViewParameter:view_parameter_text,$page_uri_suffix)|ezurl}>{$:page_offset|inc}</a></span>
        {/let}
    {/section}

        <span class="current">{$:current_page|inc}</span>

    {section loop=$:right_length}
        {let page_offset=sum($ViewParameter:current_page,1,$:index)}
          <span class="other"><a class="google-navigator" title={concat($page_uri,$:page_offset|gt(0)|choose('',concat($:offset_text,mul($:page_offset,$item_limit))),$ViewParameter:view_parameter_text,$page_uri_suffix)|ezurl}>{$:page_offset|inc}</a></span>
        {/let}
    {/section}

{section show=$:page_count|gt(sum($:current_page,$:right_max,1))}
{section show=sum($:current_page,$:right_max,2)|lt($:page_count)}
<span class="other">...</span>
{/section}
<span class="other"><a class="google-navigator" title={concat($page_uri,$:page_count|dec|gt(0)|choose('',concat($:offset_text,mul($:page_count|dec,$item_limit))),$:view_parameter_text,$page_uri_suffix)|ezurl}>{$:page_count}</a></span>
{/section}

</span>

</p>
<div class="break"></div>
</div>

{if is_set($box_type)|not()}
    {def $box_type='content-view-full'}
{/if}    

{if is_set($view_type)|not()}
    {def $view_type='view/full'}
{/if}

{if is_set($node_id)}
<div id="navigator_elements" style="display:none">
             <p title="node_id">{$node_id}</p>
             <p title="box_type">{$box_type}</p>
             <p title="view_type">{$view_type}</p>
             <p title="depth">{$depth}</p>
</div>
{/if}

{/section}

 {/let}
{/default}
{/default}

