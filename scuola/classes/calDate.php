<?php
/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of calDate
 *
 * @author mosa
 */
class calDate extends eZDate {
        
    /*
     * Day of week ISO-8601 numeric representation of the day of the week (added in PHP 5.1.0)
     *
     */
    function dayW()
     {
         return date( 'N', $this->Date );
     }
/*
 * ISO-8601 week number of year, weeks starting on Monday (added in PHP 4.1.0)
 *
*/

     function week()
     {
         return date( 'W', $this->Date );
     }


    }
?>
