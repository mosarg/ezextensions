{def $content_version=fetch('content','version',
    hash('object_id',$item.content.content_object_id,'version_id',$item.content.content_object_version))
     $item_text=""
    $approveStatus=fetch(ezapprove2, approve_status, hash( collaboration_id, $item.id ) )}
{if $item.is_creator}
    {switch match=$item.data_int3}
  {case match=0}
    {set $item_text="%1 awaits approval by editor"|i18n('design/admin/collaboration/handler/view/line/ezapprove',,array(concat("<i>",$content_version.name|wash,"</i>")))}
  {/case}
  {case match=1}
    {set $item_text="%1 was approved for publishing"|i18n('design/admin/collaboration/handler/view/line/ezapprove',,array(concat("<i>",$content_version.name|wash,"</i>")))}
  {/case}
  {case in=array(2,3)}
   {set $item_text="%1 was not approved for publishing"|i18n('design/admin/collaboration/handler/view/line/ezapprove',,array(concat("<i>",$content_version.name|wash,"</i>")))}
  {/case}
  {case match=5}
    {set $item_text="%1 was modified by approver"|i18n('design/admin/collaboration/handler/view/line/ezapprove',,array(concat("<i>",$content_version.name|wash,"</i>")))}
  {/case}
  {/switch}

{else}
      {switch match=$item.data_int3}
      {case match=0}
        {switch match=first_set( $approveStatus.user_approve_status.approve_status, 0 )}
                  {case match=0}
                   {set $item_text="%1 awaits your approval"|i18n('design/admin/collaboration/handler/view/line/ezapprove',,array(concat("<i>",$content_version.name|wash,"</i>")))}
                  {/case}
                  {case match=1}
                      {set $item_text="You approved the content and it is waiting for more approvers or the workflow to continue"|i18n('design/admin/collaboration/handler/view/line/ezapprove',,array(concat("<i>",$content_version.name|wash,"</i>")))}
                  {/case}
         {/switch}
        {/case}
    {case match=1}
        {if and( is_set( $content_version.name ), $content_version.name )|not() }
            {set $item_text="%1 was approved for publishing"|i18n('design/admin/collaboration/handler/view/line/ezapprove',,array(concat("<i>",$item.content.content_object_id|wash," [deleted]</i>")))}
        {else}
        {set $item_text="%1 was approved for publishing"|i18n('design/admin/collaboration/handler/view/line/ezapprove',,array(concat("<i>",$content_version.name|wash,"</i>")))}
    {/if}
  {/case}
    {case in=array(2,3)}
     {set $item_text="%1 was not approved for publishing"|i18n('design/admin/collaboration/handler/view/line/ezapprove',,array(concat("<i>",$content_version.name|wash,"</i>")))}
    {/case}
    {case match=5}
        {set $item_text="%1 was modified by approver"|i18n('design/admin/collaboration/handler/view/line/ezapprove',,array(concat("<i>",$content_version.name|wash,"</i>")))}
    {/case}
    {/switch}

{/if}
<p class="{$:item_class}"><a class="{$:item_class}" href={concat("collaboration/item/full/",$:item.id)|ezurl}>{$item_text}</a></p>
{undef $item_text $content_version $approveStatus}