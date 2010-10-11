<div id="logo">
{if $pagedesign.data_map.image.has_content}
<a href="/"><img src={$pagedesign.data_map.image.content[original].url|ezroot} alt="logo2"/></a>
        
        {/if}
        {if $pagedesign.data_map.header_text.has_content}
            <span>
                {$pagedesign.data_map.header_text.content}
            </span>
            {/if}
</div>