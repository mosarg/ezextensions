<?php

class calendarOperators
{
    static function operators()
    {
        $operators = array(
            'cmaketime' => 'cmaketimeOperator',
            'cdatetime' => 'cdatetimeOperator');

        $eZTemplateOperatorArray = array();
        foreach ( $operators as $operatorName => $operatorClass )
        {
            $eZTemplateOperatorArray[$operatorName] = array( 'script' => "extension/mcalendar/autoloads/classes/$operatorClass.php",
                                                             'class' => $operatorClass,
                                                             'operator_names' => array( $operatorName ) );
        }

        return $eZTemplateOperatorArray;
    }
}

?>
