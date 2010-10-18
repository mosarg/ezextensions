{if is_set($view_parameters.class)}
	{switch  match=$view_parameters.class}
		{case match='alunni'}		
			Alunni
 			{$view_parameters.class}
 			{include uri='design:user2/registerB.tpl'}		
		{/case}
		{case match='professori'}	
			Professori
			{$view_parameters.class}
			{include uri='design:user2/registerA.tpl'}
		{/case}
                {case match='ata'}
                        Ata
                        {$view_parameters.class}
			{include uri='design:user2/registerB.tpl'}
		{/case}
                {case match='genitori'}
                        Genitori
                        {$view_parameters.class}
			{include uri='design:user2/registerB.tpl'}
		{/case}
        {/switch}
{/if}
