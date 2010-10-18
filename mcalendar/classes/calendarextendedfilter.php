<?php

class calendarExtendedFilter {

    function CreateSqlParts( $params ) {
        $result = array( 'tables' => '', 'joins'  => '', 'columns' => '' );

      
        if ( !isset($params['from_time']) || !isset($params['to_time'])) {
            return $result;
        }
        $fromTime = $params['from_time'];
        $toTime = $params['to_time'];

        $db = eZDB::instance();

        $attributeBeginDate = 'event/from_time';
        $attributeEndDate = 'event/to_time';
        $attributeFrequency = 'event/frequency';
        $attributeFrequencyEnd = 'event/frequency_end';

        $attributeBeginDateID = eZContentObjectTreeNode::classAttributeIDByIdentifier($attributeBeginDate);
        $attributeEndDateID = eZContentObjectTreeNode::classAttributeIDByIdentifier($attributeEndDate);
        $attributeFrequencyID = eZContentObjectTreeNode::classAttributeIDByIdentifier($attributeFrequency);
        $attributeFrequencyEndID = eZContentObjectTreeNode::classAttributeIDByIdentifier($attributeFrequencyEnd);
     
        $arrayJoins = array();
        $arrayTables = array();
        $arrayCondition = array();
        $arrayTables[] = "ezcontentobject_attribute from_time";
        $arrayJoins[] = "( from_time.contentobject_id = ezcontentobject.id
                           AND from_time.contentclassattribute_id = $attributeBeginDateID
                           AND from_time.version = ezcontentobject_name.content_version )";
        $arrayTables[] = "ezcontentobject_attribute to_time";
        $arrayJoins[] = "( to_time.contentobject_id = ezcontentobject.id
                           AND to_time.contentclassattribute_id = $attributeEndDateID
                           AND to_time.version = ezcontentobject_name.content_version )";

        $arrayCondition[] = "( from_time.sort_key_int BETWEEN $fromTime AND $toTime
                               OR to_time.sort_key_int BETWEEN $fromTime AND $toTime )";


        $arrayTables[] = "ezcontentobject_attribute frequency";
        $arrayJoins[] = "( frequency.contentobject_id = ezcontentobject.id
                               AND frequency.contentclassattribute_id = $attributeFrequencyID
                               AND frequency.version = ezcontentobject_name.content_version )";
        $arrayTables[] = "ezcontentobject_attribute frequency_end";
        $arrayJoins[] = "( frequency.contentobject_id = ezcontentobject.id
                               AND frequency_end.contentclassattribute_id = $attributeFrequencyEndID
                               AND frequency_end.version = ezcontentobject_name.content_version )";

        $arrayCondition[] = "( frequency.sort_key_string != " . calendarContentObject::FREQUENCY_NONE_ID ."
                                   AND frequency_end.sort_key_int BETWEEN $fromTime AND $toTime )";
        $arrayCondition[] = "( frequency.sort_key_string != " . calendarContentObject::FREQUENCY_NONE_ID ."
                                   AND ( frequency_end.sort_key_int = 0 ) )";


        $result['tables'] = ", " . implode( ', ', $arrayTables );
        $result['joins'] = implode( ' AND ', $arrayJoins ) . " AND (" . implode( ' OR ', $arrayCondition ) . ") AND ";;

        return $result;
    }
}

?>