<?php

/**
 *
 * @author mosa
 */
class scuolaFetchFunctions {
    public static function fetchStudentsByClass( $parent_node_id, $class )
    {
    
        $students = eZFunctionHandler::execute( 'content', 'tree', array(
                                    'parent_node_id' => $parent_node_id,
                                    'class_filter_type' => 'include',
                                    'class_filter_array' => array('alunno'),
                                    'main_node_only' => true,
                                    'extended_attribute_filter' => array( 'id' => 'Scuolastudents',
                                                      'params' => array( 'class' => $class) ) ));
               
        return array( 'result' => $students);
    }
     public static function fetchStudentsByClassLite( $parent_node_id, $class )
    {

        $students_data=array();
        $students = eZFunctionHandler::execute( 'content', 'tree', array(
                                    'parent_node_id' => $parent_node_id,
                                    'class_filter_type' => 'include',
                                    'class_filter_array' => array('alunno'),
                                    'main_node_only' => true,
                                    'extended_attribute_filter' => array( 'id' => 'Scuolastudents',
                                                      'params' => array( 'class' => $class) ) ));

        foreach($students as $student){
            $user_object=eZUser::fetch($student->ContentObjectID);

            array_push($students_data,array('name'=>$student->Name,
                                            'email'=>$user_object->Email,
                                            'username'=>$user_object->Login,
                                            'url'=>preg_replace('/_/','-',$student->PathIdentificationString)));
            }

            return array('result'=>$students_data);
    }
}
?>
