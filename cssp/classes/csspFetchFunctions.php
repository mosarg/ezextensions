<?php

/**
 *
 * @author mosa
 */
class csspFetchFunctions {

     public static function fetchSchoolsLite( $parent_node_id, $filter,$attribute_name )
    {

        $schools_data=array();
        $schools = eZFunctionHandler::execute( 'content', 'tree', array(
                                    'parent_node_id' => $parent_node_id,
                                    'class_filter_type' => 'include',
                                    'class_filter_array' => array('scuola'),
                                    'main_node_only' => true,
                                    'extended_attribute_filter' => array( 'id' => 'csspscuole',
                                                      'params' => array( 'filter' => $filter,
                                                      'attribute_name'=>$attribute_name) ) ));

        foreach($schools as $school){
            
           $data_map=$school->attribute('data_map');
         
           array_push($schools_data,array('denom_istituzione'=>$data_map['denom_istituzione']->DataText,
                                           'titolo_plesso'=>$data_map['titolo_plesso']->DataText,
                                           'meccanografico_scuola'=>$data_map['meccanografico_scuola']->DataText,
                                           'tipo'=>$data_map['tipo']->SortKeyString,
                                           'comune'=>$data_map['comune']->DataText,
                                           'cap'=>$data_map['cap']->DataInt,
                                           'url'=>$school->urlAlias(),
                                           'polo'=>$data_map['polo']->SortKeyString,
                                           'titolo_studio'=>explode(' ',$data_map['titolo_studio']->SortKeyString)
                                            //'url'=>preg_replace('/_/','-',$school->PathIdentificationString)
                                            ));
            }

            return $schools_data;
    }
}
?>
