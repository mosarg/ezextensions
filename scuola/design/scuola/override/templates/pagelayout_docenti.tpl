<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="{$site.http_equiv.Content-language|wash}" lang="{$site.http_equiv.Content-language|wash}">
<head>

    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

    {def  $user_hash= concat( $current_user.role_id_list|implode( ',' ), ',', $current_user.limited_assignment_value_list|implode( ',' ) )}

{if is_set( $extra_cache_key )|not}
    {def $extra_cache_key = ''}
{/if}

{cache-block keys=array( $module_result.uri,$current_user.contentobject_id, $extra_cache_key )}
{def $pagedata         = scuolapagedata()
     $pagestyle        = $pagedata.css_classes
     $locales          = fetch( 'content', 'translation_list' )
     $pagedesign       = $pagedata.template_look
     $current_node_id  = $pagedata.node_id
     $indexpage        = ezini( 'NodeSettings', 'RootNode', 'content.ini')
     }


{include uri='design:page_head.tpl'}
{include uri='design:page_head_style_scuola.tpl'}
{include uri='design:page_head_script_scuola.tpl'}

<link rel="icon" type="image/png" href={'favicon.png'|ezimage} />
</head>
<body>
<!-- Complete page area: START -->

<!-- Change between "sidemenu"/"nosidemenu" and "extrainfo"/"noextrainfo" to switch display of side columns on or off  -->
<div id="page" class="{$pagestyle}">


  {if and( is_set( $pagedata.persistent_variable.extra_template_list ), 
             $pagedata.persistent_variable.extra_template_list|count() )}
    {foreach $pagedata.persistent_variable.extra_template_list as $extra_template}
      {include uri=concat('design:extra/', $extra_template)}
    {/foreach}
  {/if}

  <!-- Header area: START -->
  {include uri='design:page_header.tpl'}
  <!-- Header area: END -->
  
  {cache-block keys=array( $module_result.uri, $user_hash, $extra_cache_key )}

  <!-- Top menu area: START -->
  
    {include uri='design:page_topmenu.tpl'}
  
  <!-- Top menu area: END -->

  <!-- Path area: START -->
  {if $pagedata.show_path}
    {include uri='design:page_toppath.tpl'}
  {/if}
  <!-- Path area: END -->
  
  <!-- Toolbar area: START -->
  {if and( $pagedata.website_toolbar, $pagedata.is_edit|not)}
    {include uri='design:page_toolbar.tpl'}
  {/if}
  <!-- Toolbar area: END -->

  <!-- Columns area: START -->
  <div id="columns-position">
    <div id="columns" class="float-break">

    <!-- Side menu area: START -->
     
        

    {if $pagedata.no_prof_menu}
        <div id="sidemenu-position"><!--start side menu position-->
             <div id="sidemenu"><!--start side menu-->
                  <h2 class="header">Menu</h2>
                    {include uri='design:menu/menu_sezione_prof.tpl'}
           </div><!--end side menu-->
        </div><!--end side menu position-->


                    {/if}
         
    
    <!-- Side menu area: END -->

  {/cache-block}
{/cache-block}
    <!-- Main area: START -->
    {include uri='design:page_mainarea.tpl'}
    <!-- Main area: END -->
   {cache-block keys=array( $module_result.uri, $user_hash, $access_type.name, $extra_cache_key )}

    {if is_unset($pagedesign)}
        {def $pagedata   = scuolapagedata()
             $pagedesign = $pagedata.template_look}
    {/if}

    <!-- Extra area: START -->
    {if $pagedata.extra_menu}
        {include uri='design:page_extramenu.tpl'}
    {/if}

    <!-- Extra area: END -->

    </div><!--close columns-->
  </div><!--close columns position-->
  <!-- Columns area: END -->

  <!-- Footer area: START -->
  {include uri='design:page_footer.tpl'}
  <!-- Footer area: END -->

</div>
<!-- Complete page area: END -->

<!-- Footer script area: START -->
{include uri='design:page_footer_script.tpl'}
<!-- Footer script area: END -->

{/cache-block}

{* This comment will be replaced with actual debug report (if debug is on). *}
<!--DEBUG_REPORT-->
{include uri='design:page_analytics.tpl'}
</body>
</html>