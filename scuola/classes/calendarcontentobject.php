<?php
//
// Definition of CalendarContentObjectCalendar class
//
// Created on: <08-Sep-2008 19:05:00 bf>
//
// SOFTWARE NAME: Calendar
// SOFTWARE RELEASE: 0.1
// BUILD VERSION:
// COPYRIGHT NOTICE: Copyright (c) 2008 Guillaume Kulakowski and contributors
// SOFTWARE LICENSE: GNU General Public License v2.0
// NOTICE: >
//   This program is free software; you can redistribute it and/or
//   modify it under the terms of version 2.0  of the GNU General
//   Public License as published by the Free Software Foundation.
//
//   This program is distributed in the hope that it will be useful,
//   but WITHOUT ANY WARRANTY; without even the implied warranty of
//   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//   GNU General Public License for more details.
//
//   You should have received a copy of version 2.0 of the GNU General
//   Public License along with this program; if not, write to the Free
//   Software Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston,
//   MA 02110-1301, USA.
//
//
/*! \file Calendarcontentobjectcalendar.php
*/
/*!
  \class CalendarContentObjectCalendar Calendarcontentobjectcalendar.php
  \brief Différents opérateurs pour gérer les dates
 */

class calendarContentObject
{

    public  $calendar;
    private $calendarFromTimeDate;
    private $calendarToTimeDate;
    private $calendarFromTimeDayOfWeek;

	/*!
     Converti une liste d'évènements en tableau de type $array[year][month][day]

	 \param from_time Date de début
	 \param to_time Date de fin
	 \param array
     \return array
     */
    function __construct( $from_time, $to_time)
    {
        /* Définition du calendrier */
        $this->calendarFromTimeDate = new calDate($from_time);
        $this->calendarToTimeDate = new calDate($to_time);
        $this->calendarFromTimeDayOfWeek = date('N', $this->calendarFromTimeDate->timeStamp() );
        $this->calendar = array();

     }

    function view($events,$view='month'){
        $CalendarRaw = Calendar::instance();
                foreach ( $events as $event )
        {
            $eventdataMap = $event->dataMap();
            $eventFromTimeDate = new calDate( $eventdataMap[$CalendarRaw->eventClass['Dictionary']['DTSTART']]->content()->attribute('timestamp') );
            $eventToTimeDate = new calDate( $eventdataMap[$CalendarRaw->eventClass['Dictionary']['DTEND']]->content()->attribute('timestamp') );
            /*
             * One day event
             */
            if ( self::isSameDay($eventFromTimeDate, $eventToTimeDate) )
            {
                /* Non recurrent event case */
                if ( !self::hasFrequency($event) )
                {
                   $this->addSimpleEvent( $event, $eventFromTimeDate,$view);
                }
                /* Recurrent event case */
                else
                {
                    $this->addFrequentEvent( $event, $eventFromTimeDate, $eventToTimeDate,$view );
                }
            }
            /*
             * Multiple days event
             */
            else
            {
                $this->addMultiDaysEvent( $event, $eventFromTimeDate, $eventToTimeDate,$view);
            }
        }
     return true;

     }
/*
	 \param $toDate calDate
	 \param $toDate calDate
 	 \return bolean
     */
    static function isSameDay( $fromDate, $toDate )
    {
        if ( $fromDate->timeStamp() == $toDate->timeStamp() || $toDate->timeStamp() == 0||$toDate->timeStamp()==-3600 )
        {
            return true;
        }
        return false;
    }
    /*!
	 Détermine si l'évènement a une fréquence.

	 \params $event eZContentObjectTreeNode
	 \return bolean
     */
    static function hasFrequency ( $event )
    {
        $CalendarRaw = Calendar::instance();
        $dataMap = $event->dataMap();
        $attributeFrequency = $CalendarRaw->eventClass['Dictionary']['Frequency'];
        if (isset($dataMap[$attributeFrequency])):
            $frequency = $dataMap[$attributeFrequency]->content();
        else:
            $frequency=array(0);
        endif;
        if ( strtolower($attributeFrequency) == 'disabled' || $frequency[0] == Calendar::FREQUENCY_NONE_ID )
        {
            return false;
        }
      
        return true;
    }



    private function addEvent( $event,$timeStamp,$view)
    {
        $CalendarRaw = Calendar::instance();
        $attribute = $CalendarRaw->eventClass['Dictionary']['FullDay'];
        $nature = 'partial';
        if ( strtolower($attribute) != 'disabled' && $this->dataMap[$attribute]->content() )
        {
            $nature = 'full';
        }

        switch($view):
           case 'month':
              $this->calendar[(int)$timeStamp->year()]
                           [(int)$timeStamp->month()][(int)$timeStamp->day()][$nature][] = $event;
            break;
           case 'week':
              $this->calendar[(int)$timeStamp->year()]
                             [(int)$timeStamp->week()][(int)$timeStamp->dayW()][$nature][] = $event;
            break;
            case 'plain':
                $this->calendar[]=$event;
            break;
            default:
         endswitch;

        //$date = new calDate();
        //$date->setMDY( $year, $month, $day );
        
        //ezDate dosn't return week number
        //$weekNumber=date('W',$eventFromTimeDate->timeStamp());
        //$this->calendarWeekView[(int)$year][(int)$weekNumber][(int)$day][]=$event;
        //$this->calendar[intval($year)][intval($month)][intval($day)]['date'][] = $date;

        return true;
    }



    /*!
     Ajout d'un évènement simple au calendrier

     \param $event eZContentObjectTreeNode
     \param $eventFromTimeDate calDate
     \return boolean
     */
    private function addSimpleEvent( $event, $eventFromTimeDate,$view )
    {
       $this->addEvent($event,$eventFromTimeDate,$view );
     return true;
    }



    /*!
     Ajout d'un évènement au calendrier

     \param $event eZContentObjectTreeNode
     \param $eventFromTimeDate calDate
     \param $eventToTimeDate calDate
     \return boolean
     */
    private function addMultiDaysEvent( $event, $eventFromTimeDate, $eventToTimeDate,$view)
    {
        $cursorDate = new calDate( max($this->calendarFromTimeDate->timeStamp(), $eventFromTimeDate->timeStamp()) );
        $cursorEndDate = new calDate( min($this->calendarToTimeDate->timeStamp(), $eventToTimeDate->timeStamp()) );

        /* Cas d'un évènement non-récurent */
    	if ( !self::hasFrequency( $event ) )
        {
            while ( $cursorDate->timeStamp() <= $cursorEndDate->timeStamp() )
            {
                if ( $eventFromTimeDate->timeStamp() <= $cursorDate->timeStamp() || $cursorDate->timeStamp() > $eventToTimeDate->timeStamp() )
                {
                    $this->addEvent($event,$cursorDate,$view );
                
                }
                $cursorDate->adjustDate(0, 1);
            }
        }
        /* Cas d'un évènement récurent */
        else
        {
            eZDebug::writeWarning( $event->Name . " : Frequency event on few day is not implemented" );
        }
    }



    /*!
     Ajout d'un évènement récurent au calendrier

     \param $event eZContentObjectTreeNode
     \param $eventFromTimeDate calDate
     \param $eventToTimeDate calDate
     \return boolean
     */
    private function addFrequentEvent( $event, $eventFromTimeDate, $eventToTimeDate,$view)
    {
        $CalendarRaw = Calendar::instance();
        $eventdataMap = $event->dataMap();
        $frequency = $eventdataMap[$CalendarRaw->eventClass['Dictionary']['Frequency']]->content();
        $frequencyEnd = $eventdataMap[$CalendarRaw->eventClass['Dictionary']['FrequencyEnd']]->content()->attribute('timestamp');
        $frequencyEndDate = new calDate( $frequencyEnd );

        $cursorDate = new calDate( max($this->calendarFromTimeDate->timeStamp(), $eventFromTimeDate->timeStamp()) );
        if ( $frequencyEnd == 0 )
        {
            $cursorEndDate = new calDate( $this->calendarToTimeDate->timeStamp() );
        }
        else
        {
            $cursorEndDate = new calDate( min($this->calendarToTimeDate->timeStamp(), $frequencyEnd) );
        }

        $eventDayOfYear = date('Z', $eventToTimeDate->timeStamp() );

        switch ( $frequency[0] )
        {
            /* Jours ouvrés */
            case Calendar::FREQUENCY_DAILY_OPEN_ID:
                $this->addDailyOpenEvent( $event, $cursorDate, $cursorEndDate, $eventToTimeDate,$view);
                break;

            /* Quotidien */
            case Calendar::FREQUENCY_DAILY_ID:
                $this->addDailyEvent( $event, $cursorDate, $cursorEndDate, $eventToTimeDate,$view );
                break;

            /* Hebdomadaire */
            case Calendar::FREQUENCY_WEEKLY_ID:
                $this->addWeeklyEvent( $event, $cursorDate, $cursorEndDate, $eventToTimeDate,$view);
                break;

            /* Bi-mensuel */
            case Calendar::FREQUENCY_BIMONTHLY_ID:
                $this->addBiMonthlyEvent( $event, $cursorDate, $cursorEndDate, $eventToTimeDate,$view);
                break;

            /* Mensuel */
            case Calendar::FREQUENCY_MONTHLY_ID:
                $this->addMonthlyEvent( $event, $cursorDate, $cursorEndDate, $eventToTimeDate,$view);
                break;

            /* Annuel */
            case Calendar::FREQUENCY_ANNUAL_ID:
                $this->addAnnualEvent( $event, $cursorDate, $cursorEndDate, $eventToTimeDate,$view);
                break;
        }

        return true;
    }


    /*!
     \param $event
     \param $cursorDate
     \param $cursorEndDate
     \param $eventToTimeDate
     \TODO Définir les jours ouvrables...
     */
    private function addDailyOpenEvent( $event, $cursorDate, $cursorEndDate, $eventToTimeDate,$view)
    {
        $eventDayOfWeek = date('N', $eventToTimeDate->timeStamp() );
        while ( $cursorDate->timeStamp() <= $cursorEndDate->timeStamp() )
        {
            $cursorDayOfWeek = date('N', $cursorDate->timeStamp() );
            if ( $cursorDayOfWeek < 6 )
            {
                
           $this->addEvent($event,$cursorDate,$view );
                      
              }
            $cursorDate->adjustDate(0, 1);
        }
    }
    /*!
     Ajout d'un évènement quotidien

     \param $event
     \param $cursorDate
     \param $cursorEndDate
     \param $eventToTimeDate
     */
    private function addDailyEvent( $event, $cursorDate, $cursorEndDate, $eventToTimeDate,$view )
    {
        while ( $cursorDate->timeStamp() <= $cursorEndDate->timeStamp() )
        {
          $this->addEvent($event,$cursorDate,$view );
          $cursorDate->adjustDate(0, 1);
        }
    }
    /*!
     Ajout d'un évènement hebdomadaire

     \param $event
     \param $cursorDate
     \param $cursorEndDate
     \param $eventToTimeDate
     */
    private function addWeeklyEvent( $event, $cursorDate, $cursorEndDate, $eventToTimeDate,$view )
    {
        $eventDayOfWeek = date('N', $eventToTimeDate->timeStamp() );
        $cursorDayOfWeek = date('N', $cursorDate->timeStamp() );
        $goTo = $eventDayOfWeek - $cursorDayOfWeek;

        if ( $goTo >= 0)
        {
            $cursorDate->adjustDate(0, $goTo);
        }
        else{
            $cursorDate->adjustDate(0, $goTo+7);
        }

        while ( $cursorDate->timeStamp() <= $cursorEndDate->timeStamp() )
        {

              $this->addEvent($event,$cursorDate,$view );
                       

            $cursorDate->adjustDate(0, 7);
        }
    }
    /*!
     Ajout d'un évènement bi-mensuel (Toutes les 2 semaines)

     \param $event
     \param $cursorDate
     \param $cursorEndDate
     \param $eventToTimeDate
     */
    private function addBiMonthlyEvent( $event, $cursorDate, $cursorEndDate, $eventToTimeDate,$view )
    {
        $eventDayOfWeek = date('N', $eventToTimeDate->timeStamp() );
        $cursorDayOfWeek = date('N', $cursorDate->timeStamp() );
        $eventWeekOfUnix = floor($eventToTimeDate->timeStamp() / 604800);


        $goTo = $eventDayOfWeek - $cursorDayOfWeek;
        if ( $goTo >= 0)
        {
            $cursorDate->adjustDate(0, $goTo);
        }
        else{
            $cursorDate->adjustDate(0, $goTo+7);
        }

        while ( $cursorDate->timeStamp() <= $cursorEndDate->timeStamp() )
        {
            $cursorWeekOfUnix = floor($cursorDate->timeStamp() / 604800);
            if ( $eventWeekOfUnix % 2 == $cursorWeekOfUnix % 2 )
            {

                
                $this->addEvent($event,$cursorDate,$view );
                        

                $cursorDate->adjustDate(0, 14);
            }
            else
            {
                $cursorDate->adjustDate(0, 7);
            }
        }

    }
	/*!
     Ajout d'un évènement mensuel

     \param $event
     \param $cursorDate
     \param $cursorEndDate
     \param $eventToTimeDate
     */
    private function addMonthlyEvent( $event, $cursorDate, $cursorEndDate, $eventToTimeDate,$view )
    {
        $goTo = $eventToTimeDate - $cursorDate->day();
        if ( $goTo >= 0)
        {
            $cursorDate->adjustDate(0, $goTo);
        }
        else{
            $cursorDate->adjustDate(1, $goTo);
        }

        while ( $cursorDate->timeStamp() <= $cursorEndDate->timeStamp() )
        {
            
      $this->addEvent($event,$cursorDate,$view);
                       

            $cursorDate->adjustDate(1);
        }
    }
	/*!
     Ajout d'un évènement annuel

     \param $event
     \param $cursorDate
     \param $cursorEndDate
     \param $eventToTimeDate
     */
    private function addAnnualEvent( $event, $cursorDate, $cursorEndDate, $eventToTimeDate ,$view)
    {
        $goTo = new calDate();
        $goTo->setMDY( $eventToTimeDate->month(), $eventToTimeDate->day(), $cursorDate->year() );

        while ( $cursorDate->timeStamp() <= $cursorEndDate->timeStamp() )
        {
            if ( $cursorDate->timeStamp() <= $goTo->timeStamp() && $goTo->timeStamp() < $cursorEndDate->timeStamp() )
            {
                
              $this->addEvent($event,$cursorDate,$view);
               

            }
            $cursorDate->adjustDate(12);
        }

    }

}    // EOC

?>