<?php

/**
 * Description of sserverfunctions
 *
 * @author mosa
 */
class sServerFunctions extends ezjscServerFunctions{

    public static function fetchstudents($args){
        $parent_node_id=$args[0];
        $class=$args[1];
        return json_encode(scuolaFetchFunctions::fetchStudentsByClassLite($parent_node_id, $class));
    }


/**************************************************************************
*Send message to user/users
*
**************************************************************************/
    public static function sendUserMessage($args) {

        $class_id=$args[0];
        $user = eZUser::currentUser();


        if ($user->isAnonymous()) return array('error'=>'Anonymous users not allowed');


        $class=eZContentObject::fetch($class_id);

        if (!is_object($class)) return array('error'=>'Chosen class doesn\'t exist');

        if ($class->canEdit()) {
              $tutor=eZContentObject::fetch($user->ContentObjectID);
              $datamap=$tutor->attribute('data_map');
              $tutor_email=$user->Email;
              $first_name=$datamap['first_name']->DataText;
              $last_name=$datamap['last_name']->DataText;
              $tutor_name=ucwords(strtolower($first_name.' '.$last_name));
              $long_arguments=json_decode($_POST['postdata']);
              $users_email=$long_arguments->users_email;
              $email_subject=$long_arguments->email_subject.' '.$tutor_name;
              $email_message=$long_arguments->email_message;


            foreach ($users_email as $user_email) {
                self::sendEmail($user_email,$tutor_email,$tutor_name,$email_subject,$email_message);

            }
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
