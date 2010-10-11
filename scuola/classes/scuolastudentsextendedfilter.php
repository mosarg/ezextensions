<?php

class scuolaStudentsExtendedFilter {

    function CreateSqlParts( $params ) {
        $result = array( 'tables' => '', 'joins'  => '', 'columns' => '' );

      
        if ( !isset($params['class'])) {
            return $result;
        }
        
        $class = $params['class'];
        $db = eZDB::instance();
        $attributeClass = 'alunno/classe';

        $attributeClassID = eZContentObjectTreeNode::classAttributeIDByIdentifier($attributeClass);
         
        $arrayJoins = array();
        $arrayTables = array();
        $arrayCondition = array();
        $arrayTables[] = "ezcontentobject_attribute students";
        $arrayJoins[] = "( students.contentobject_id = ezcontentobject.id
                           AND students.contentclassattribute_id = $attributeClassID
                           AND students.version = ezcontentobject_name.content_version )";
  

        $arrayCondition[] = "(students.sort_key_string='$class')";
        $result['tables'] = ", " . implode( ', ', $arrayTables );
        $result['joins'] = implode( ' AND ', $arrayJoins ) . " AND (" . implode( ' OR ', $arrayCondition ) . ") AND ";;
        return $result;
    }
}

?>