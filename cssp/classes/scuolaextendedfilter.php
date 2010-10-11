<?php

class scuolaExtendedFilter {

    function createSqlParts( $params ) {
        $result = array( 'tables' => '', 'joins'  => '', 'columns' => '' );

      
        if ( !isset($params['filter'])) {
            return $result;
        }
        
        $filter = $params['filter'];
        $attribute_name=$params['attribute_name'];
        $db = eZDB::instance();
        $attributeClass = 'scuola/'.$attribute_name;

        $attributeClassID = eZContentObjectTreeNode::classAttributeIDByIdentifier($attributeClass);
         
        $arrayJoins = array();
        $arrayTables = array();
        $arrayCondition = array();
        $arrayTables[] = "ezcontentobject_attribute schools";
        $arrayJoins[] = "( schools.contentobject_id = ezcontentobject.id
                           AND schools.contentclassattribute_id = $attributeClassID
                           AND schools.version = ezcontentobject_name.content_version )";

        $filter=preg_replace('/\s+/','.*',$filter);
        $arrayCondition[] = "(schools.sort_key_string REGEXP '$filter')";
        /*$arrayCondition[] = "(schools.sort_key_string LIKE '%$filter%')";*/
        $result['tables'] = ", " . implode( ', ', $arrayTables );
        $result['joins'] = implode( ' AND ', $arrayJoins ) . " AND (" . implode( ' OR ', $arrayCondition ) . ") AND ";;
        return $result;
    }
}

?>