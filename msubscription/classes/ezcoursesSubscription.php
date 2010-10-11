<?php
/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of ezcoursesSubscription
 *
 * @author mosa
 */
class ezcoursesSubscription extends eZPersistentObject {

    function ezcoursesSubscription( $row ) {
        $this->eZPersistentObject( $row );
    }

    static function definition() {
        return array( 'fields' => array( 'id' => array( 'name' => 'ID',
            'datatype' => 'integer',
            'default' => 0,
            'required' => true ),
            'email' => array( 'name' => 'email',
            'datatype' => 'string',
            'default' => '',
            'required' => true ),
            'course_id' => array( 'name' => 'courseID',
            'datatype' => 'integer',
            'default' => 0,
            'required' => true ),
            'user_id' => array( 'name' => 'userID',
            'datatype' => 'integer',
            'default' => 0,
            'required' => true ),
            'name'=>array('name'=>'name',
            'datatype'=>'string',
            'default'=>'',
            'required'=>false),
            'surname'=>array('name'=>'surname',
            'datatype'=>'string',
            'default'=>'',
            'required'=>false),
            'username'=>array('name'=>'username',
            'datatype'=>'string',
            'default'=>'',
            'required'=>false),
            'exams_list'=>array('name'=>'exams_list',
            'datatype'=>'string',
            'default'=>'',
            'required'=>false)
            ),
            'keys'=> array( 'id','email','course_id'),
            'function_attributes' => array('user'=>'user','course'=>'course'),
            'increment_key' => 'id',
            'class_name' => 'ezcoursesSubscription',
            'name' => 'ezcourses_subscription'
        );
    }


    static function create( $user_id, $course_id,$email ) {

        $row = array( 'id' => null,
            'user_id' => $user_id,
            'course_id' => $course_id,
            'email'=>$email);

        return new ezcoursesSubscription( $row );
    }

    function user() {
        return eZUser::fetch( $this->attribute( 'user_id' ) );
    }
    function course() {
        return eZUser::fetch( $this->attribute( 'course_id' ) );
    }

    static function removeUserCourse($user_id, $course_id,$email) {

        $condArray = array( 'user_id' => $user_id,'course_id'=>$course_id,'email'=>$email);

        eZPersistentObject::removeObject(ezcoursesSubscription::definition(),
            $condArray );
    }

    static function removeAllSubscriptions($user_id){
        $condArray = array( 'user_id' => $user_id);
        eZPersistentObject::removeObject(ezcoursesSubscription::definition(),
            $condArray );
    }

    static function countSubscribers($course_id){
        return ezPersistentObject::count(ezcoursesSubscription::definition(), 
                                            array( 'course_id' => $course_id));
        
    }



    static function fetchByUserId( $user_id, $asObject = true ) {

        $retVal = eZPersistentObject::fetchObjectList(ezcoursesSubscription::definition(),
            null,
            array( 'user_id' => $user_id),
            $asObject );

        return $retVal;
    }

     static function fetchByUserName( $username, $asObject = true ) {

        $retVal = eZPersistentObject::fetchObjectList(ezcoursesSubscription::definition(),
            null,
            array( 'username' => $username),
            $asObject );

        return $retVal;
    }


    static function fetch( $id, $asObject = true ) {
        $retVal = eZPersistentObject::fetchObject(ezcoursesSubscription::definition(),
            null,
            array( 'id' => $id ),
            $asObject );
        return $retVal;
    }

    static function fetchByUserEmail( $email, $asObject = true ) {

        $retVal = eZPersistentObject::fetchObject(ezcoursesSubscription::definition(),
            null,
            array( 'email' => $email),
            $asObject );

        return $retVal;
    }

    static function fetchByEmailCourse($email,$course_id,$asObject=true){
          $retVal = eZPersistentObject::fetchObject(ezcoursesSubscription::definition(),
            null,
            array( 'email' => $email,'course_id'=>$course_id),
            $asObject );

        return $retVal;
    }

    static function fetchSubscribersList( $course_id, $asObject = true ) {

        $retVal = eZPersistentObject::fetchObjectList(ezcoursesSubscription::definition(),
            null,
            array( 'course_id' => $course_id ),
            null,
            null,
            $asObject);

        return $retVal;
    }
}
?>
