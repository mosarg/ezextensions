<script type="text/javascript">
{literal}    
        $(function () {
            $(".frontpage-select").live("change", function () {
               if ($(this).val()!=""){
                $(this).parent('form').submit();
               }
            });
        });
{/literal}        
</script>

{def $valid_nodes = $block.valid_nodes}

<!-- BLOCK: START -->

<div class="block-type-itemlist">

{if $block.name|preg_match('/notitle/')|not()}
  <div class="attribute-header-block"><h2>{$block.name}</h2></div>
{/if}    

<div class="block-content">
    
<form  action={"content/action"|ezurl} method="post">
 <select name="URL" title="Insegnante" class="frontpage-select">
           {foreach $valid_nodes as $valid_node}
      <option  value={$valid_node.url_alias|ezurl()}>{$valid_node.name|wash()}</option>
            {/foreach}
 </select>
     <input name="ContentObjectID" type="hidden" value="2" />
     <input name="RedirectTo" type="hidden" value="Via" />
  </form>


</div>

</div>

<!-- BLOCK: END -->

{undef $valid_nodes}