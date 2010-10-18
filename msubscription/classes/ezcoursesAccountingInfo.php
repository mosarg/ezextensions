<?php
/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of ezcoursesAccountingInfo
 *
 * @author mosa
 */
class ezcoursesAccountingInfo extends eZPersistentObject {

    function __construct( $row ) {
        parent::__construct( $row );
    }


    static function definition() {
        return array( 'fields' => array( 'id' => array( 'name' => 'ID',
            'datatype' => 'integer',
            'default' => 0,
            'required' => true ),
            'accounting_code' => array( 'name' => 'accounting_code',
            'datatype' => 'string',
            'default' => '',
            'required' => false),
            'accounting_information1' => array( 'name' => 'accounting_information1',
            'datatype' => 'string',
            'default' => 0,
            'required' => false ),
            'user_id' => array( 'name' => 'user_id',
            'datatype' => 'integer',
            'default' => 0,
            'required' => true ),
            'accounting_information2'=>array('name'=>'accounting_information2',
            'datatype'=>'string',
            'default'=>'',
            'required'=>false),
            'accounting_structure'=>array('name'=>'accounting_structure',
            'datatype'=>'string',
            'default'=>'',
            'required'=>true),
            'attachments'=>array('name'=>'attachments',
            'datatype'=>'string',
            'default'=>'',
            'required'=>false)

            ),
            'keys'=> array( 'id','user_id'),
            'function_attributes' => array('user'=>'user','accounting_id'=>'accounting_id'),
            'increment_key' => 'id',
            'class_name' => 'ezcoursesAccountingInfo',
            'name' => 'ezcourses_accounting_info'
        );
    }

    static function create( $user_id, $accounting_structure) {

        $row = array( 'id' => null,
            'user_id' => $user_id,
            'accounting_structure' => $accounting_structure);

        return new ezcoursesAccountingInfo( $row );
    }

    function user() {
        return eZUser::fetch( $this->attribute( 'user_id' ) );
    }
    function accounting_id() {
        return eZUser::fetch( $this->attribute( 'accounting_code' ) );
    }

    static function removeUserAccounting($user_id) {

        $condArray = array( 'user_id' => $user_id);

        eZPersistentObject::removeObject(ezcoursesAccountingInfo::definition(),
            $condArray );
    }

    
    static function fetchByUserId( $user_id, $asObject = true ) {

        $retVal = eZPersistentObject::fetchObject(ezcoursesAccountingInfo::definition(),
            null,
            array( 'user_id' => $user_id),
            $asObject );

        return $retVal;
    }

    static function fetchByUserIdStructure($user_id,$accounting_structure,$asObject = true ) {

        $retVal = eZPersistentObject::fetchObject(ezcoursesAccountingInfo::definition(),
            null,
            array( 'user_id' => $user_id,'accounting_structure'=>$accounting_structure),
            $asObject );

        return $retVal;
    }

    
    static function fetch( $id, $asObject = true ) {
        $retVal = eZPersistentObject::fetchObject(ezcoursesAccountingInfo::definition(),
            null,
            array( 'id' => $id ),
            $asObject );
        return $retVal;
    }

       

    static function fetchAccountersList( $accounting_structure, $asObject = true ) {

        $retVal = eZPersistentObject::fetchObjectList(ezcoursesAccountingInfo::definition(),
            null,
            array( 'accounting_structure' => $accounting_structure ),
            null,
            null,
            $asObject);

        return $retVal;
    }
}
?>
