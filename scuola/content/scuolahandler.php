<?php

/**
 * Custom actions after object edit
 * @author mosa
 */
class scuolaHandler extends eZContentObjectEditHandler {

    function fetchInput($http, &$module, &$class, $object, &$version, $contentObjectAttributes, $editVersion, $editLanguage, $fromLanguage) {
        
    }

    static function storeActionList() {
        return array();
    }

    function publish($contentObjectID, $contentObjectVersion) {

        $object = eZContentObject::fetch($contentObjectID);
        $contentClass = $object->attribute('content_class');
        $classId = $contentClass->Identifier;

        switch ($classId) {

            case 'professore':
                $cacheCleanNodes = array();
                $attributes = $object->attribute('data_map');
                $schools = $attributes['school'];
                $mySchools = preg_split("/[\s]+/", $schools->SortKeyString);
                foreach ($mySchools as $schoolId) {
                    $profGroupNode = eZContentObjectTreeNode::fetchByURLPath($schoolId . '/docenti');
                    array_push($cacheCleanNodes, $profGroupNode->NodeID);
                }
                eZContentCache::cleanup($cacheCleanNodes);
                break;
            case 'alunno':
                $cacheCleanNodes = array();
                $attributes = $object->attribute('data_map');
                $old_object = $object->version($object->CurrentVersion - 1);
                $old_attributes = $old_object->attribute('data_map');
                $school = $attributes['school'];
                $old_school = $old_attributes['school'];
                $class = $attributes['classe'];
                $old_class = $old_attributes['classe'];
                //cleanup old class cache
                $oldClassNode = eZContentObjectTreeNode::fetchByURLPath($old_school->SortKeyString .
                                '/classi/' . $old_class->SortKeyString);
                array_push($cacheCleanNodes, $oldClassNode->NodeID);
                //cleanup new class cache
                $newClassNode = eZContentObjectTreeNode::fetchByURLPath($school->SortKeyString .
                                '/classi/' . $class->SortKeyString);
                array_push($cacheCleanNodes, $newClassNode->NodeID);

                eZContentCache::cleanup($cacheCleanNodes);
                break;
            case 'progetto':
                /* Get informations from scuola.ini then link project to global project containers */

                $ini = eZINI::instance('scuola.ini');
                $aggregatorPath = $ini->variable('ContentAggregator', 'aggregator');

                /* Get aggregator node */
                $aggregatorObjectNode = eZContentObjectTreeNode::fetchByURLPath($aggregatorPath[$classId]);

                if (is_object($aggregatorObjectNode)) {
                  
                   
                    $projectRelationsCount=$object->relatedObjectCount(false,0,true,false);
                    
                    if ($projectRelationsCount==0){
                         /* Get aggregator object */
                            $aggregatorObject = eZContentObject::fetchByNodeID($aggregatorObjectNode->NodeID);
                         /* Link aggregator object to the project being edited */   
                            $aggregatorObject->addContentObjectRelation($object->ID);
                    }
                    
                    /* cleanup aggragator cache */
                    eZContentCache::cleanup($aggregatorObjectNode->NodeID);
                }
                break;
        }
    }

}

?>
