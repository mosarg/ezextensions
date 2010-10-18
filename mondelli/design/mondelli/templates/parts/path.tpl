  <!-- Path content: START -->
  <p>
  {foreach $pagedata.path_array as $path}
  {if $path.url}
    <a href={cond( is_set( $path.url_alias ), $path.url_alias,
                                        $path.url )|ezurl}>{$path.text|wash}</a>
  {else}
    <span class="path-text">{$path.text|wash}</span>
  {/if}
  {delimiter}<img class="path-separator" alt="path_sep" src={'path/path_sep2_small.png'|ezimage()}{/delimiter}
  {/foreach}
  </p>
  <!-- Path content: END -->