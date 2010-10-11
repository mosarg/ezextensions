<?php
/***********************************************************************************
 * Mcalendar fetch functions
 *
 *
 ***********************************************************************************/


class calendarFetchFunctions
{
   /*********************************************************************************
    * Fetch events for a static calendar
    * 
    * 
    ********************************************************************************/


    public static function fetchEvents( $parent_node_id, $from_time, $to_time,$view,$method='list' )
    {
    
        $attributeBeginDate = 'event/from_time';
        $events = eZFunctionHandler::execute( 'content', 'tree', array(
                'parent_node_id' => $parent_node_id,
                'sort_by' => array( 'attribute', true, $attributeBeginDate ),
                'class_filter_type' => 'include',
                'class_filter_array' => array('event'),
                'main_node_only' => true,
                'extended_attribute_filter' => array( 'id' => 'McalendarCalendar',
                                                      'params' => array( 'from_time' => $from_time,
                                                                         'to_time' => $to_time ) ) ) );

        $calendar = new calendarContentObject( $from_time, $to_time);

        $calendar->view($events,$view);
        return array( 'result' => $calendar->calendar );
    }

    /*********************************************************************************
    * Fetch events for a static multi calendar
    *
    *
    ********************************************************************************/



   public static function multiFetchEvents( $parent_node_ids, $from_time, $to_time,$view,$method='list' )
    {
        $attributeBeginDate = 'event/from_time';
        $events=array();

        foreach ($parent_node_ids as $parent_node_id){
        
        $events =array_merge($events,eZFunctionHandler::execute( 'content', 'tree', array(
                'parent_node_id' => $parent_node_id,
                'sort_by' => array( 'attribute', true, $attributeBeginDate ),
                'class_filter_type' => 'include',
                'class_filter_array' => array( 'event' ),
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

/*********************************************************************************
 * Fetch all events under a calendar object
 *
 *
  ********************************************************************************/
   
    public static function fetchEventsTree( $parent_node_id, $from_time, $to_time )
    {
        return $this->fetchEvents( $parent_node_id, $from_time, $to_time, 'tree' );
    }

 /*********************************************************************************
 * Fetch events for ajax display
 *
 *
 ********************************************************************************/


    public static function fetchEventsAjax( $parent_node_id, $from_time, $to_time,$view,$method='list' )
    {
        $attributeBeginDate = 'event/from_time';
        $events = eZFunctionHandler::execute( 'content', 'tree', array(
                'parent_node_id' => $parent_node_id,
                'sort_by' => array( 'attribute', true, $attributeBeginDate ),
                'class_filter_type' => 'include',
                'class_filter_array' => array('event'),
                'main_node_only' => true,
                'extended_attribute_filter' => array( 'id' => 'McalendarCalendar',
                                                      'params' => array( 'from_time' => $from_time,
                                                                         'to_time' => $to_time) ) ) );

        $calendar = new calendarContentObject( $from_time, $to_time);

        $calendar->view($events,$view);
        return $calendar->calendar;
    }



}

?>