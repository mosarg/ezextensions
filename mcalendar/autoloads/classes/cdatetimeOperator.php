<?php

class cdatetimeOperator extends calendarOperator
{
    function __construct()
    {
        parent::__construct('cdatetime','format');
    }
    static function execute( $operatorValue, $namedParameters )
    {
        return date($namedParameters['format'],$operatorValue);
    }

}

?>
