<?php

/**
 * Custom actions after object edit
 * @author mosa
 */
class scuolaHandler extends eZContentObjectEditHandler
{
    function fetchInput( $http, &$module, &$class, $object, &$version, $contentObjectAttributes, $editVersion, $editLanguage, $fromLanguage )
    {

    }

    static function storeActionList()
    {
        return array();

    }

    function publish( $contentObjectID, $contentObjectVersion )
    {

        $object =eZContentObject::fetch( $contentObjectID );
        $contentClass =$object->attribute('content_class');

        switch($contentClass->Identifier) {

        case 'professore':
        $cacheCleanNodes=array();
        $attributes=$object->attribute('data_map');
        $schools=$attributes['school'];
        $mySchools= preg_split("/[\s]+/", $schools->SortKeyString);
        foreach($mySchools as $schoolId){
             $profGroupNode=eZContentObjectTreeNode::fetchByURLPath($schoolId.'/docenti');
             array_push($cacheCleanNodes,$profGroupNode->NodeID);
        }
        eZContentCache::cleanup($cacheCleanNodes);
        break;

        }
    }
}

?>
