<script type="text/javascript">
//if the user hits browser backbutton or changes page partial user object gets deleted from database
{literal}
//
var cancelOnUnload=true
window.onbeforeunload  = function() {
    if (window.XMLHttpRequest) {
        var ajax = new XMLHttpRequest();
    }
    else if (window.ActiveXObject) {
        var ajax = new ActiveXObject("Microsoft.XMLHTTP");
    }
    if(cancelOnUnload){
    ajax.open('POST','/user2/register2/',false);
    ajax.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
    ajax.send("CancelButton=Discard");
    }
  }
{/literal}
</script>

{def $chosen_class=or($currentType,$classType)}
{* def $chosen_class=or($currentType,$view_parameters.class) *}
{* $chosen_class *}
{if $validation.processed}
        {foreach $validation.attributes as $element}
            {if $element}
                     <div class="warning">
                        <h2>{"Mancata validazione"|i18n("design/standard/user")}</h2>
                        <ul>
                            <li>{$element.name}: {$element.description}</li>
                        </ul>
                    </div>
            {else}
                   <div class="feedback">
                        <h2>{"Input was stored successfully"|i18n("design/standard/user")}</h2>
                   </div>
            {/if}
        {/foreach}
   {/if}
{if is_set($chosen_class)}
	{switch  match=$chosen_class}
		{case match='alunni'}		
			{* $view_parameters.class *}
 			{include uri=concat('design:user2/register_',$chosen_class,'.tpl')}
		{/case}
		{case match='professori'}	
			{* $view_parameters.class *}
			{include uri=concat('design:user2/register_',$chosen_class,'.tpl')}
		{/case}
                {case match='ata'}
                       
                        {* $view_parameters.class *}
			{include uri=concat('design:user2/register_',$chosen_class,'.tpl')}
		{/case}
                {case match='genitori'}
                        
                        {* $view_parameters.class *}
			{include uri=concat('design:user2/register_',$chosen_class,'.tpl')}
		{/case}
        {/switch}
{/if}
