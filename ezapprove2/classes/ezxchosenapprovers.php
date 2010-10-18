<?php
/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of ezxchosenapprovers
 *
 * @author mosa
 */
class eZXChosenApprovers extends eZPersistentObject {

    function eZXChosenApprovers( $row ) {
        $this->eZPersistentObject( $row );
    }


    static function definition() {
        return array( 'fields' => array(
        'id' => array( 'name' => 'ID',
        'datatype' => 'integer',
        'default' => 0,
        'required' => true ),

        'user_id' => array( 'name' => 'UserID',
        'datatype' => 'integer',
        'default' => 0,
        'required' => true ),

        'approver_user_id' => array( 'name'  => 'ApproverUserId',
        'datatype' => 'integer',
        'default' => 0,
        'required' => true ),
        ),

        'keys'=> array( 'id' ),
        'increment_key' => 'id',
        'function_attributes' => array( 'user' => 'user',
                                         'approver'=>'approver'),
        'class_name' => 'eZXChosenApprovers',
        'name' => 'ezx_chosen_approver' );
    }


    static function create( $user_id, $approver_user_id ) {

        $row = array( 'id' => null,
            'user_id' => $user_id,
            'approver_user_id' => $approver_user_id);

        return new eZXChosenApprovers ( $row );
    }

    function user()
    {
        return eZUser::fetch( $this->attribute( 'user_id' ) );
    }
   function approver()
    {
        return eZUser::fetch( $this->attribute( 'approver_user_id' ) );
    }

    static function removeUserApprover( $userId, $approverId ) {
        $condArray = array( 'user_id' => $userId,'approver_user_id'=>$approverId );

        eZPersistentObject::removeObject(eZXChosenApprovers::definition(),
            $condArray );
    }



     /* static Fetch functions */
    static function fetchApproversList( $UserID, $asObject = true ) {

        $retVal = eZPersistentObject::fetchObjectList( eZXChosenApprovers::definition(),
            null,
            array( 'user_id' => $UserID ),
            null,
            null,
            $asObject);

        return $retVal;
    }




    static function fetchByUserId( $UserID, $asObject = true ) {

        $retVal = $retVal = eZPersistentObject::fetchObject(eZXChosenApprovers::definition(),
            null,
            array( 'user_id' => $UserID ),
            $asObject );

        return $retVal;
    }
    static function fetch( $id, $asObject = true ) {
        $retVal = eZPersistentObject::fetchObject(eZXChosenApprovers::definition(),
            null,
            array( 'id' => $id ),
            $asObject );
        return $retVal;
    }

    static function getApproversList($userId){
        $approverListArray=self::fetchApproversList($userId,false);
        $ret=array();
        foreach ($approverListArray as $approver){
            array_push($ret,$approver['approver_user_id']);
        }
        return $ret;
    }



}
?>
