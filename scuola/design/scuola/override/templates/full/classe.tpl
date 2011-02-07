{* classe - Full view *}

{include uri='design:parts/global_variables.tpl' left_menu=true() left_nav_menu=true()}


{def $students=fetch('scuola','fetch_students_lite',
        hash('parent_node_id',840,'class',$node.name|downcase))}

<div class="border-box">
    <div class="content-view-full">


        <div class="class-classe">

           {if $node.can_edit}

           {run-once}
            {ezscript_require( array( concat( 'ezjsc::', 'jqueryio' ),
            'classes/jquery-ui-min.js','classes/classint.js','init_class.js'))}
            {/run-once}
           <div class="students-list">
               <div id="hide">
               <div id="email_form">
                    <textarea name="message" cols=40 rows=10></textarea>
                    <button id="sendEmail">Email</button>
               </div>
                <table>
                    <thead>
                        <tr>
                            <th>Seleziona</th><th>Nome e Cognome</th><th>Username</th><th>Email</th>
                        </tr>
                </thead>
                <tbody>
                    {foreach $students as $student}
                    <tr>
                        <td><input  class="select" id="{$student.username}" type="checkbox" value="{$student.email}"/></td>
                        <td><a href={$student.url|ezurl}>{$student.name}</a></td>
                        <td>{$student.username}</td>
                        <td>{$student.email}</td>
                    </tr>
                    {/foreach}
                </tbody>
                </table>
               </div>
            </div>
            {/if}

        {if $node.object.state_id_array|contains('6')}

        <div class="wip rounded shadowmore">
            <p>{"Contenuto in preparazione non ancora visibile pubblicamente"|i18n('scuola/state')}</p>
        </div>
        {/if}
            <div class="attribute-header">
                <h1>{"Classe:: "|i18n('scuola/classi')} {$node.data_map.name.content}</h1>
                {if $node.data_map.short_name.has_content}
                    <h3 class="subtitle">{"Detta: "|i18n('scuola/classi')}</h3>
                {/if}
            </div>

            {if eq( ezini( 'folder', 'SummaryInFullView', 'content.ini' ), 'enabled' )}
            {if $node.object.data_map.short_description.has_content}
            <div class="attribute-short">
                {attribute_view_gui attribute=$node.data_map.short_description}
            </div>
            {/if}
            {/if}

            {if $node.object.data_map.description.has_content}
            <div class="attribute-long">
                {attribute_view_gui attribute=$node.data_map.description}
            </div>
            {/if}
            <div class="content-view-full horizzontal_block">
                {if $node.data_map.info.has_content}
                {attribute_view_gui attribute=$node.data_map.info}
                {/if}
            </div>
            <div id="config" style="visibility:hidden">
                <p title="object_id">{$node.contentobject_id}</p>
                <p title="email_subject">{"Messaggio dal prof. "|i18n('scuola/classi')}</p>
             </div>

        </div>
    </div>


</div>
