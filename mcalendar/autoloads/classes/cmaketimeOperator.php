<?php

class cmaketimeOperator extends calendarOperator
{
    function __construct()
    {
        parent::__construct('cmaketime','week','year');
    }

    static function execute( $operatorValue, $namedParameters )
    {
       
       return self::getDaysInWeek((int)$namedParameters['week'],(int)$namedParameters['year']);
       
    }

static function getDaysInWeek ($weekNumber, $year) {
  // Count from '0104' because January 4th is always in week 1
  // (according to ISO 8601).
  $time = strtotime($year . '0104 +' . ($weekNumber - 1)
                    . ' weeks');
  // Get the time of the first day of the week
  $dateone=date('w', $time) - 1;
  $datetwo=date('N',$time)-1;
  $mondayTime = strtotime('-' . (date('N', $time) - 1) . ' days',
                          $time);
  // Get the times of days 0 -> 6
  $dayTimes = array ();
  for ($i = 0; $i < 7; ++$i) {
    $dayTimes[] = strtotime('+' . $i . ' days', $mondayTime);
  }
  // Return timestamps for mon-sun.
  return $dayTimes;
}

}

?>
