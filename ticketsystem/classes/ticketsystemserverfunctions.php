<?php

/**
 * Description of sserverfunctions
 *
 * @author mosa
 */
class ticketsystemServerFunctions extends ezjscServerFunctions {


    const TICKET_NEW = 0;
    const TICKET_OPEN = 1;
    const TICKET_STARTED = 2;
    const TICKET_REOPENED = 3;
    const TICKET_SOLVED = 4;
    const TICKET_CONFERMED = 5;
    const TICKET_CLOSED = 6;
    const TICKET_INVALID=7;
    const TICKET_DIFFERED=8;


    public static function changeTicketState($args) {
        $object_id=$args[0];
        $new_state=$args[1];
        $node_id=$args[2];
        $object=eZContentObject::fetch($object_id);
        $data_map=$object->datamap();
        $state=$data_map['state'];
        $state->setAttribute('data_text',$new_state);
        $state->store();
        eZContentCache::cleanup(array($node_id));
    }




    public static function acquireTicket($args) {

        $object_id=$args[0];
        $node_id=$args[1];
        $object=eZContentObject::fetch($object_id);
        $current_user_id=eZUser::currentUserID();
        $data_map=$object->datamap();
        $relations=$data_map['assigned'];
        $content = $relations->content();
        $priority = 1;
        if (count($content['relation_browse'])==0) {
            $content['relation_browse'][] = eZObjectRelationBrowseType::appendObject($current_user_id, $priority, $relations);
            $relations->setContent( $content );
            $relations->store();
            eZContentCache::cleanup(array($node_id));
            return 'Acquisition ready '.count($content['relation_browse']);
        }else {
            return 'Already acquired '.count($content['relation_browse']);
        }
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
