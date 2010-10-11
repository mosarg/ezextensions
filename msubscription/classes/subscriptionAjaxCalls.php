<?php
/************************************************************************************
 * This class contains methods to update subscriptions through an ajax interface
 *
 * @author mosarg@gmail.com
 ***********************************************************************************/

class subscriptionAjaxCalls {


/************************************************************
*
*Check if user is already subscribed
*
*************************************************************/
    public static function isSubscribed($args) {
        $course_id=$args[0];
        $user = eZUser::currentUser();
        $email=$user->Email;
        $user_id=$user->id();
        $subscription=ezcoursesSubscription::fetchByEmailCourse($email,$course_id);
        if(is_object($subscription)) {
            if($subscription->attribute('user_id')==$user_id) {
                return true;
            }
            else {
                return 'error';
            }
        }
        else {
            return false;
        }

    }
/*****************************************************************************
*Check if users is already accounted somewhere
*
******************************************************************************/

    public static function hasAccount() {
        $user = eZUser::currentUser();
        if ($user->isAnonymous()) return array('error'=>'Anonymous users not allowed');
        $courseAccount=ezcoursesAccountingInfo::fetchByUserID((int)($user->id()));
        if (is_object($courseAccount)) return array('reg_status'=>true,
                'accounting_code'=>$courseAccount->attribute('accounting_code'),
                'accounting_structure'=>$courseAccount->attribute('accounting_structure')
                );
        else return array('reg_status'=>false);

    }

/*****************************************************************************
*Extract accounting data from database
*
******************************************************************************/
    public static function getAccountingData() {
        $user = eZUser::currentUser();
        if ($user->isAnonymous()) return array('error'=>'Anonymous users not allowed');
        $courseAccount=ezcoursesAccountingInfo::fetchByUserID((int)($user->id()));
        if (is_object($courseAccount))
            return json_decode($courseAccount->attribute('accounting_information1'));
        else return array('error'=>'User is not accounted');
    }

/****************************************************************************
*Get number of subscribed users
*
*****************************************************************************/
    public static function countSubscribers($args) {
        $course_id=$args[0];
        return ezcoursesSubscription::countSubscribers($course_id);
    }
/***************************************************************************
*Subscribe user to course
*
****************************************************************************/
    public static function subscribe($args) {
        $course_id=$args[0];
        $accounting_code=$args[1];
        $exams_list=$_POST['postdata'];

        $user = eZUser::currentUser();
        if ($user->isAnonymous()) return array('error'=>'Anonymous users not allowed');

        $user_object=$user->contentObject()->attribute('data_map');
        $user_name=$user_object['first_name']->DataText;
        $user_surname=$user_object['last_name']->DataText;
        $email=$user->Email;
        $user_id=$user->id();

        $subscription=ezcoursesSubscription::fetchByEmailCourse($email,$course_id);

        $account=ezcoursesAccountingInfo::fetchByUserId($user_id);
        $account->setAttribute('accounting_code',$accounting_code);

        $account->store();
        $course=eZContentObject::fetch($course_id);
      

        if (!is_object($course)) return array('error'=>'Chosen course doesn\'t exist','email'=>$email);
        if ($course->ClassIdentifier <>'course') return array('error'=>'Chosen course doesn\'t exist','email'=>$email);
        if (is_object($subscription)) return array('error'=>'User already subscribed','email'=>$email);

        $datamap=$course->attribute('data_map');
        $course_admin_email=$datamap['email'];
        $max_subscribers=$datamap['max_subscribers']->DataInt;
        $current_number_subscribers=ezcoursesSubscription::countSubscribers($course_id);

        if($current_number_subscribers>=$max_subscribers) return array('error'=>'Too many subscribed users');

        $new_subscription=ezcoursesSubscription::create($user_id, $course_id, $email);
        $new_subscription->setAttribute('username',$user->Login);
        $new_subscription->setAttribute('name',$user_name);
        $new_subscription->setAttribute('surname',$user_surname);
        $new_subscription->setAttribute('exams_list',$exams_list);
        $new_subscription->store();

        self::sendSubscriptionEmail($course_admin_email->DataText,$email,$course->Name);
        return true;
    }
/**************************************************************************
*Unsubscribe user to course
*
**************************************************************************/
    public static function unsubscribe($args) {
        $course_id=$args[0];
        $user = eZUser::currentUser();

        if ($user->isAnonymous()) return array('error'=>'Anonymous users not allowed');

        $email=$user->Email;
        $user_id=$user->id();
        ezcoursesSubscription::removeUserCourse($user_id, $course_id, $email);

    }
/**************************************************************************
*Remove users account to course
*
**************************************************************************/
    public static function removeAccount() {
        $user = eZUser::currentUser();
        if ($user->isAnonymous()) return array('error'=>'Anonymous users not allowed');
        ezcoursesAccountingInfo::removeUserAccounting($user->id());
        ezcoursesSubscription::removeAllSubscriptions($user->id());
    }


/**************************************************************************
*List course subscribers
*
**************************************************************************/

    public static function listSubscribers($args) {
        $course_id=$args[0];
        $course=eZContentObject::fetch($course_id);
        if ($course->canEdit()) {
            return ezcoursesSubscription::fetchSubscribersList($course_id);

        }
        else {
            return array('error'=>'You are not allowed to see this course subscribers');
        }
    }

/*****************************************************************************
*List accounters to the specified accounting structure
*
*******************************************************************************/
    public static function listAccounters($args) {
        $user = eZUser::currentUser();
        if ($user->isAnonymous()) return array('error'=>'Anonymous users not allowed');

        $accounting_structure=$args[0];
        $accounting_form_id=$args[1];

        $accounting_form=eZContentObject::fetch($accounting_form_id);

        if ($accounting_form->canEdit()) {
            $output_list=array();
            $accounts=ezcoursesAccountingInfo::fetchAccountersList($accounting_structure);
            foreach($accounts as $account) {
                array_push($output_list,json_decode($account->attribute('accounting_information1')));

            }
            return $output_list;
        }
        else

            return array('error'=>'You are not allowed to list subscribers');
    }

/**************************************************************************
*Remove subscriber
*
**************************************************************************/
    public static function removeSubscriber($args) {
        $course_id=$args[0];
        $user_id=$args[1];
        $email=$args[2];

        $course=eZContentObject::fetch($course_id);
        if ($course->canEdit()) {
            return ezcoursesSubscription::removeUserCourse($user_id, $course_id,$email);
        }
        else {
            return array('error'=>'You are not allowed to remove subscribers');
        }

    }
/******************************************************************************
* Remove Accounter
*
*******************************************************************************/
    public static function removeAccounter($args){
        $user_id=$args[0];
        $form_id=$args[1];
        $form=eZContentObject::fetch($form_id);
        if ($form->canEdit()) {
            return ezcoursesAccountingInfo::removeUserAccounting($user_id);
        }
        else {
            return array('error'=>'You are not allowed to remove accounters');
        }

    }

/**************************************************************************
*Send message to user/users
*
**************************************************************************/
    public static function sendUserMessage($args) {
        $course_id=$args[0];

        $user = eZUser::currentUser();
        if ($user->isAnonymous()) return array('error'=>'Anonymous users not allowed');

        $course=eZContentObject::fetch($course_id);
        if (!is_object($course)) return array('error'=>'Chosen course doesn\'t exist','email'=>$email);

        if ($course->canEdit()) {

            $datamap=$course->attribute('data_map');
            $course_admin_email=$datamap['email']->DataText;
            $course_admin_name=$datamap['admin_name']->DataText;
            $course_name=$course->Name;

            $long_arguments=json_decode($_POST['postdata']);
            $users_email=$long_arguments->users_email;
            $email_message=$long_arguments->email_message;

            foreach ($users_email as $user_email) {

                self::sendEmail($user_email,$course_admin_email,$course_admin_name,$course_name,$email_message);

            }
        }
    }

 public static function getPdf($args){
     $user_id=$args[0];
     $accounting_structure=$args[1];

     $user_account=ezcoursesAccountingInfo::fetchByUserIdStructure($user_id,$accounting_structure);

 if (!$user_account)
     eZExecution::cleanExit();

    $file_name=$user_account->attribute('attachments').'.pdf';
    $storage_dir = eZSys::storageDirectory();
    $msubscriptions_dir=$storage_dir.'/msubscriptions/pdf';
    $download_file=$msubscriptions_dir.'/'.$file_name;

    subscriptionsFormData::download($download_file);

 }




/* * *************************************************************************
*Private methods
*
*****************************************************************************/

/******************************************************************************
* Send user email upon subscription
*
********************************************************************************/

    private static function sendSubscriptionEmail($receiver,$user,$course) {

        $sender ='administrator@e-moka.net';
        $sender_name='Administration';
        $body ='Registered user: '.$user;
        $subject=$course.' subscription';
        self::sendEmail($receiver, $sender, $sender_name, $subject, $body);

    }

    private static function sendEmail($receiver,$sender,$sender_name,$subject,$body) {
        
        $mail = new eZMail();
        $mail->setSender( $sender,$sender_name);
        $mail->setReceiver($receiver);
        $mail->setSubject( $subject );
        $mail->setBody( $body);
        $mailResult = eZMailTransport::send( $mail );
    }


}




?>
