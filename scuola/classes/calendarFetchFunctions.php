<?php
//
// Definition of eZiCalFetchFunctions class
//
// Created on: <01-Sep-2008 19:00:00 bf>
//
// SOFTWARE NAME: eZiCal
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


/*! \file ezicalcontentobjectevent.php
*/

/*!
  \class eZiCalFetchFunctions ezicalfetchfonctions.php
  \brief Fonction fetch d'eZiCal
*/
class calendarFetchFunctions
{
    /*!
    \param $parent_node_id integer
     \aram $from_time timestamp
     \param $to_time timestamp
     \return eZiCalContentObjectCalendar
     */
    public function fetchEvents( $parent_node_id, $from_time, $to_time,$view,$method='list' )
    {
        $CalendarRaw = Calendar::instance();
        $attributeBeginDate = $CalendarRaw->eventClass['EventClassID'].'/'.$CalendarRaw->eventClass['Dictionary']['DTSTART'];

        $events = eZFunctionHandler::execute( 'content', 'tree', array(
                'parent_node_id' => $parent_node_id,
                'sort_by' => array( 'attribute', true, $attributeBeginDate ),
                'class_filter_type' => 'include',
                'class_filter_array' => array('event'),
                'main_node_only' => true,
                'extended_attribute_filter' => array( 'id' => 'ScuolaCalendar',
                                                      'params' => array( 'from_time' => $from_time,
                                                                         'to_time' => $to_time ) ) ) );

        $calendar = new calendarContentObject( $from_time, $to_time);

        $calendar->view($events,$view);
        return array( 'result' => $calendar->calendar );
    }

   public function multiFetchEvents( $parent_node_ids, $from_time, $to_time,$view,$method='list' )
    {
        $CalendarRaw = Calendar::instance();
        $attributeBeginDate = $CalendarRaw->eventClass['EventClassID'].'/'.$CalendarRaw->eventClass['Dictionary']['DTSTART'];
        $events=array();

        foreach ($parent_node_ids as $parent_node_id){
        
        $events =array_merge($events,eZFunctionHandler::execute( 'content', 'tree', array(
                'parent_node_id' => $parent_node_id,
                'sort_by' => array( 'attribute', true, $attributeBeginDate ),
                'class_filter_type' => 'include',
                'class_filter_array' => array( $CalendarRaw->eventClass['EventClassID'] ),
                'main_node_only' => true,
                'extended_attribute_filter' => array( 'id' => 'ScuolaCalendar',
                                                      'params' => array( 'from_time' => $from_time,
                                                                         'to_time' => $to_time ) )
                ) ));
        }
        $calendar = new calendarContentObject( $from_time, $to_time);

        $calendar->view($events,$view);
        return array( 'result' => $calendar->calendar );
    }


    /*!
     Identique à fetchEvents mais avec la récursivitée par rapport au noeud parent

     \param $parent_node_id
     \aram $from_time
     \param $to_time
     \return eZiCalContentObjectCalendar
     */
    public function fetchEventsTree( $parent_node_id, $from_time, $to_time )
    {
        return $this->fetchEvents( $parent_node_id, $from_time, $to_time, 'tree' );
    }
}

?>