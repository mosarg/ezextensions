<?php

/**
 * Remove ajax cache after event edit
 * @author mosa
 */
class mcalendarHandler extends eZContentObjectEditHandler {
    function fetchInput( $http, &$module, &$class, $object, &$version, $contentObjectAttributes, $editVersion, $editLanguage, $fromLanguage ) {

    }

    static function storeActionList() {
        return array();

    }

    function publish( $contentObjectID, $contentObjectVersion ) {

        $object =eZContentObject::fetch( $contentObjectID );
        $contentClass =$object->attribute('content_class');

        switch($contentClass->Identifier) {
            case 'event':
                $parentNodeIdArray=$object->parentNodeIDArray();
                $eventdataMap=$object->attribute('data_map');
                $start=$eventdataMap['from_time']->content()->attribute('timestamp');
                $end=$eventdataMap['to_time']->content()->attribute('timestamp');
                calendarCache::expireCache($start,$end,$parentNodeIdArray[0]);
                break;

        }
    }
}

?>
