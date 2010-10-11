{set-block variable=$subject scope=root}{ezini('NewsletterMailSettings', 'EmailSubjectPrefix', 'cjw_newsletter.ini')} {$contentobject.name|wash}{/set-block}
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>{$#subject}</title>
</head>
<body>
<table width="600px" cellpadding="5" cellspacing="5" border="0">
    <tr>

        {def $edition_data_map = $contentobject.data_map}

        {*
            Kopf - Ausgabe des Inhalts der Newsletter-Ausgabe
        *}
        <td>
            {*
                Titel
            *}
            {if $edition_data_map.title.has_content}
                <h1>{$edition_data_map.title.content|wash()}</h1>
            {/if}
            {*
                Text
            *}
            {if $edition_data_map.description.has_content}
                {$edition_data_map.description.content.output.output_text|wash(xml)}
            {/if}
        </td>
    </tr>
    <tr>
        {*
            Hauptbereich - Ausgabe des Newsletter-Artikel die unterhalb der
            Newsletter-Ausgabe liegen
        *}
        <td>
            {def $list_items = fetch('content', 'list', hash( 'parent_node_id', $contentobject.contentobject.main_node_id,
                                                              'sort_by', array( 'priority' , true() ),
                                                              'class_filter_type', 'include',
                                                              'class_filter_array', array( 'cjw_newsletter_article' ) ) )
            }

            {*
                Unterartikel anzeigen
            *}

            {foreach $list_items as $attribute}
             <hr>
                {*
                    Titel
                *}
                {if $attribute.data_map.title.has_content}
                    <h2>{attribute_view_gui attribute=$attribute.data_map.title}</h2>
                {/if}

                {*
                    Text
                *}
                {if $attribute.data_map.short_description.has_content}
                    {attribute_view_gui attribute=$attribute.data_map.short_description}
                {/if}


            {/foreach}

        </td>
    </tr>
    <tr>
        <td>
            <hr>
            {'To unsubscribe your newsletter please visit the following link'|i18n('cjw_newsletter/skin/default')}:
            <a href="{'/newsletter/unsubscribe/#_hash_unsubscribe_#'|ezurl('no')}">{'unsubscribe'|i18n('cjw_newsletter/skin/default')}</a>
            <hr>
        </td>
    </tr>
    <tr>
        {*
            Fussbereich der Mail
        *}
        <td>
            {* TODO *}
        </td>
    </tr>
</table>
</body>
</html>