<?php

/**
 * Description of sserverfunctions
 *
 * @author mosa
 */
class csspServerFunctions extends ezjscServerFunctions{

    public static function fetchschools($args){
        $parent_node_id=$args[0];
        $filter=$args[1];
        $attribute_name=$args[2];
        return csspFetchFunctions::fetchSchoolsLite($parent_node_id, $filter,$attribute_name);
    }

    public static function fetchRelations($args){
        $parent_object_id=$args[0];
        $parent_object=eZContentObject::fetch($parent_object_id);
        $result=array();
        $params=array('AllRelations'=>false);
        $related_objects_list=$parent_object->relatedContentObjectList(false,false,0,false,$params);

        foreach($related_objects_list as $related_object) {
            $related_node=eZContentObjectTreeNode::fetchByContentObjectID($related_object->ID);
            $data_map=$related_object->datamap();

            array_push($result,array('name'=>$related_object->Name,
                                     'url_alias'=>$related_node[0]->urlAlias(),
                                     'start'=>$data_map['from_time']->DataInt,
                                     'end'=>$data_map['to_time']->DataInt));
            }
        return $result;
    }


    public static function createOORelation($args){
        $parent_object_id=$args[0];
        $children_object_id=$args[1];
        $parent_object=eZContentObject::fetch($parent_object_id);
        $data_map=$parent_object->datamap();
        $recipient_email=$data_map['email']->DataText;
        $parent_object->addContentObjectRelation($children_object_id);
        csspServerFunctions::sendEmail($recipient_email,'system@cssp.it','cssp','Prenotazione '.$parent_object->Name,
                    'Avviso prenotazione');

        }

     public static function sendNotification($args){
         $object_id=$args[0];
         $object=eZContentObject::fetch($object_id);
         $data_map=$object->datamap();
         $recipient_email=$data_map['email']->DataText;
         $long_arguments=json_decode($_POST['postdata']);
         $subject=$long_arguments->subject;
         $body=$long_arguments->body;
         csspServerFunctions::sendEmail($recipient_email,'system@cssp.it','cssp',$subject,$body);
     }




     private static function sendEmail($receiver,$sender,$sender_name,$subject,$body) {

        $mail = new eZMail();
        $mail->setSender( $sender,$sender_name);
        $mail->setReceiver($receiver);
        $mail->setSubject( $subject );
        $mail->setBody( $body);
        $mailResult = eZMailTransport::send( $mail );
    }

    /**
     * Reimp
     */

    public static function getCacheTime( $functionName ) {
        return time();
    }
}
?>
