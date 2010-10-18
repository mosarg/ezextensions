{*
    Textversion des html newsletters
    html tags werden in ein wiki ähnliches format konvertiert

    <h2>test</h2> =>   == test ==
    <br>          =>   umbruch
    <hr>          =>   ----------------------------------------------------------------------

*}
{set-block variable=$subject scope=root}{ezini('NewsletterMailSettings', 'EmailSubjectPrefix', 'cjw_newsletter.ini')} {$contentobject.name|wash}{/set-block}
{def $edition_data_map = $contentobject.data_map}

{*
   Kopf - Ausgabe des Inhalts der Newsletter-Ausgabe
*}

{*
   Titel
*}
{if $edition_data_map.title.has_content}
<hr>
{$edition_data_map.title.content|wash()}
<hr>
{/if}
<br>
{*
    Text
*}
{if $edition_data_map.description.has_content}
    {$edition_data_map.description.content.output.output_text|wash(xml)}
{/if}
{*
    Hauptbereich - Ausgabe des Newsletter-Artikel die unterhalb der
    Newsletter-Ausgabe liegen
*}

{def $list_items = fetch('content', 'list', hash( 'parent_node_id', $contentobject.contentobject.main_node_id,
                                                              'sort_by', array( 'priority' , true() ),
                                                              'class_filter_type', 'include',
                                                              'ignore_visibility', true(),
                                                              'class_filter_array', array( 'cjw_newsletter_article' ) ) ) }


{*
    show subarticles
*}
{foreach $list_items as $attribute}
<br>
     {*
       Titel
    *}
    {if $attribute.data_map.title.has_content}
        <hr>
        {$attribute.data_map.title.content|wash}
        <hr>
    {/if}

    {*
        Text
    *}
    {if $attribute.data_map.short_description.has_content}
        {attribute_view_gui attribute=$attribute.data_map.short_description}
    {/if}

{/foreach}


{*
    Abmeldelink
*}
<br>
--
{'To unsubscribe your newsletter please visit the following link'|i18n('cjw_newsletter/skin/default')}:
url:{'/newsletter/unsubscribe/#_hash_unsubscribe_#'|ezurl('no')}
