{if is_set($view_parameters.class)}
	{switch  match=$view_parameters.class}
		{case match='alunni'}		
			Alunni
 			{$view_parameters.class}
 			{include uri='design:user/registerB.tpl'}		
		{/case}
		{case match='professori'}	
			Professori
			{$view_parameters.class}
			{include uri='design:user/registerA.tpl'}
		{/case}
	{/switch}
{else}
<form action={"content/action"|ezurl} method="post">
	<div align="center"><br>
	<input type="radio" name="(class)" value="alunni" id="filter_class"> Alunni<br>
	<input type="radio" name="(class)" value="professori" id="filter_class" checked> Professori<br>
	</div>
	<input type="hidden" name="DestinationURL" value="user2/register" />
	<input type="submit" value="filter">
</form>
{/if}
