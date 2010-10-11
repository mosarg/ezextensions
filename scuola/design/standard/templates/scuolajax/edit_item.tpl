{def $contentObjectId=$arguments[0]
     $nodeId=$arguments[1]
     $contentNodeId=$nodeId
     $contentObjectLanguageCode=$arguments[2]}
 
    <form action={"/content/action"|ezurl} method="post">
       <input type="image" name="EditButton" src={"icons/pencil_small.png"|ezimage} alt="Edit" />
       <input type="hidden" name="ContentObjectLanguageCode" value="{$contentObjectLanguageCode}" />
       <input type="hidden" name="ContentObjectID" value="{$contentObjectId}" />
       <input type="hidden" name="NodeID" value="{$nodeId}" />
       <input type="hidden" name="ContentNodeID" value="{$contentNodeId}" />
    </form>
 <a class="remove-event rounded" id="event_{$nodeId}"></a>
 
 