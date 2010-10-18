<?php
//
// Definition of eZiCalExtendedFilter class



/*! \file eZiCalExtendedFilter.php
*/

/*!
  \class eZiCalExtendedFilter eZiCalExtendedFilter.php
  \brief
*/
class calendarExtendedFilter
{

    function CreateSqlParts( $params )
    {
        $result = array( 'tables' => '', 'joins'  => '', 'columns' => '' );

        /* Paramètres */
        if ( !isset($params['from_time']) || !isset($params['to_time']) )
        {
            return $result;
        }
        $fromTime = $params['from_time'];
        $toTime = $params['to_time'];


        $db = eZDB::instance();
        $CalendarRaw = Calendar::instance();


        /* Attribut */
        $attributeBeginDate = $CalendarRaw->eventClass['EventClassID'].'/'.$CalendarRaw->eventClass['Dictionary']['DTSTART'];
        $attributeEndDate = $CalendarRaw->eventClass['EventClassID'].'/'.$CalendarRaw->eventClass['Dictionary']['DTEND'];
        $attributeFrequency = $CalendarRaw->eventClass['EventClassID'].'/'.$CalendarRaw->eventClass['Dictionary']['Frequency'];
        $attributeFrequencyEnd = $CalendarRaw->eventClass['EventClassID'].'/'.$CalendarRaw->eventClass['Dictionary']['FrequencyEnd'];

        $attributeBeginDateID = eZContentObjectTreeNode::classAttributeIDByIdentifier($attributeBeginDate);
        $attributeEndDateID = eZContentObjectTreeNode::classAttributeIDByIdentifier($attributeEndDate);
        $attributeFrequencyID = eZContentObjectTreeNode::classAttributeIDByIdentifier($attributeFrequency);
        $attributeFrequencyEndID = eZContentObjectTreeNode::classAttributeIDByIdentifier($attributeFrequencyEnd);


        /* Requêtes SQL */
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

//        if ( strtolower($attributeFrequency) != $CalendarRaw->eventClass['EventClassID'].'/'.'disabled' )
//        {
//            $arrayTables[] = "ezcontentobject_attribute frequency";
//            $arrayJoins[] = "( frequency.contentobject_id = ezcontentobject.id
//                               AND frequency.contentclassattribute_id = $attributeFrequencyID
//                               AND frequency.version = ezcontentobject_name.content_version )";
//            $arrayTables[] = "ezcontentobject_attribute freq_end";
//            $arrayJoins[] = "( frequency.contentobject_id = ezcontentobject.id
//                               AND freq_end.contentclassattribute_id = $attributeFrequencyEndID
//                               AND freq_end.version = ezcontentobject_name.content_version )";
//
//            $arrayCondition[] = "( frequency.sort_key_string != " . eZiCal::FREQUENCY_NONE_ID ."
//                                   AND freq_end.sort_key_int BETWEEN $fromTime AND $toTime )";
//            $arrayCondition[] = "( frequency.sort_key_string != " . eZiCal::FREQUENCY_NONE_ID ."
//                                   AND ( freq_end.sort_key_int = 0 ) )";
//        }

        $result['tables'] = ", " . implode( ', ', $arrayTables );
        $result['joins'] = implode( ' AND ', $arrayJoins ) . " AND (" . implode( ' OR ', $arrayCondition ) . ") AND ";;

        return $result;
    }
}

?>