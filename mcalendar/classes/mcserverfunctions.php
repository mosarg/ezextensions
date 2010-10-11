<?php
/************************************************************************************
 * This class contains methods for updating calendar events through an ajax interface
 *
 * @author mosarg@gmail.com
 ***********************************************************************************/

class mcServerFunctions extends ezjscServerFunctions {


/************************************************************
*
*Remove events from calendar enforcing user permissions
*
*************************************************************/
    public static function removeEvent($args) {
        $nodeID=$args[0];
        $calendarID=$args[1];
        $start=$args[2];
        $end=$args[3];
        $node = eZContentObjectTreeNode::fetch( $nodeID );
        if(is_object($node)) {
            if($node->canRemove()):
                $node->removeNodeFromTree(false);
                calendarCache::expireCache($start,$end,$calendarID);
            else:
                return 'You are not allowed to remove this node';
            endif;
        }
        return 'Node removal succesfull';
    }

/****************************************************************
*
* Updated event from ajax input checking users permissions
*
*
****************************************************************/

    public static function updateEventAjax($args) {
        $objectId=$args[0];
        $calendarId=$args[3];
        $start=$args[4];
        $end=$args[5];
        $arguments=json_decode($_POST['postdata'],true);
        $event=eZContentObject::fetch($objectId);
        if($event->canEdit()) {
            $xmlText='<?xml version="1.0" encoding="utf-8"?>
                <section xmlns:image="http://ez.no/namespaces/ezpublish3/image/"
                         xmlns:xhtml="http://ez.no/namespaces/ezpublish3/xhtml/"
                         xmlns:custom="http://ez.no/namespaces/ezpublish3/custom/">
                        <paragraph>'.$arguments['text'].'</paragraph></section>';

            $mod_attributes=array('to_time'=>array('data_int',(int)$args[2]),
                'from_time'=>array('data_int',(int)$args[1]),
                'short_title'=>array('data_text',$arguments['short_title']),
                'text'=>array('data_text',$xmlText));

            $datamap=$event->attribute('data_map');
            foreach($mod_attributes as $key=>$content) {
                $current_attribute=$datamap[$key];
                $current_attribute->setContent($content[1]);
                $current_attribute->setAttribute($content[0],$content[1]);
                $current_attribute->sync();
            }

        }
        else {
            return 'You are not allowed to edit this event';
        }

        calendarCache::expireCache($start,$end,$calendarId);
        return 'Edit success';

    }

/***************************************************************
*
*update event start and end time
*
*
***************************************************************/

    public static function updateEventTimeSlot($args) {
        $objectId=$args[0];
        $calendarId=$args[3];
        $event=eZContentObject::fetch($objectId);
        if($event->canEdit()) {
            $mod_attributes=array('to_time'=>array('data_int',(int)$args[2]),
                'from_time'=>array('data_int',(int)$args[1]));

            $datamap=$event->attribute('data_map');
            foreach($mod_attributes as $key=>$content) {
                $current_attribute=$datamap[$key];
                $current_attribute->setAttribute($content[0],$content[1]);
                $current_attribute->sync();
            }

        }
        else {
            return 'You are not allowed to edit this event';
        }
        calendarCache::expireCache($args[1],$args[2],$calendarId);
        return 'Edit success';

    }
/*****************************************************************
 * $ajaxid=fake id to synx with ajax frontend
 * This method creates an event object from ajax input
 *
 *****************************************************************/
    public static function addEventAjax($args) {
        $user = eZUser::currentUser();
        $parentNodeId=$args[0];
        $fromTime=$args[1];
        $toTime=$args[2];
        $start=$args[3];
        $end=$args[4];
        $arguments=json_decode($_POST['postdata'],true);
        if (isset($arguments['where']))
            $where=$arguments['where'];
        else
            $where='';

        $xmlText='<?xml version="1.0" encoding="utf-8"?>
                <section xmlns:image="http://ez.no/namespaces/ezpublish3/image/"
                         xmlns:xhtml="http://ez.no/namespaces/ezpublish3/xhtml/"
                         xmlns:custom="http://ez.no/namespaces/ezpublish3/custom/">
                        <paragraph>'.$arguments['text'].'</paragraph></section>';
        $params = array();
        $params['creator_id'] = $user->id();
        $params['parent_node_id'] = (int)$parentNodeId;
        $params['class_identifier'] = 'event';
        $params['attributes']=array('short_title'=>$arguments['short_title'],'text'=>$xmlText,
            'from_time'=>$fromTime,'to_time'=>$toTime,'frequency'=>'0','frequency_end'=>$toTime,'where'=>$where);
        $newObject = eZContentFunctions::createAndPublishObject($params);
        $node = eZContentObjectTreeNode::fetch( $newObject->attribute( 'main_node_id' ) );
        $owner_id=$newObject->OwnerID;
        $data=array('id'=>$arguments['id'],
            'start'=>$fromTime,'end'=>$toTime,'title'=>$arguments['short_title'],
            'nodeId'=>(int)($newObject->attribute( 'main_node_id' )),'parentNodeId'=>(int)$parentNodeId,
            'urlAlias'=>$node->urlAlias(),'currentLanguage'=>$newObject->currentLanguage(),
            'objectId'=>$newObject->ID,'frequency'=>0,'where'=>$where,'isMain'=>true,'ownerId'=>$owner_id);
        
        calendarCache::expireCache($start,$end,$parentNodeId);
        return $data;
    }

/************************************************
*
 * Fetches events from db and outputs json data
 *
 *
 *
 ************************************************/
    public static function fetchEvents($args) {
        $parentNodeId=(int)$args[0];
        $fromTime=(int)$args[1];
        $toTime=(int)$args[2];
        $view=$args[3];


        if (calendarCache::isCached($fromTime,$toTime,$parentNodeId)) {
            $cal_events=calendarCache::getCache($fromTime,$toTime,$parentNodeId);
        }
        else {
            $cal_events=calendarFetchFunctions::fetchEventsAjax($parentNodeId,$fromTime,$toTime,$view);
            calendarCache::storeCache($fromTime,$toTime,$parentNodeId,$cal_events);
        }
        return $cal_events;

    }
    /**
     * Reimp
     */
    public static function getCacheTime( $functionName ) {
        return time();
    }


}
?>
