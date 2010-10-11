<?php
//

$FunctionList = array();

$FunctionList['multi_events_list'] = array(
    'name'                  => 'multi_events_list',
    'operation_types'       => array( 'read' ),
    'call_method'           => array(
        'include_file'          => 'extension/mcalendar/classes/calendarFetchFunctions.php',
        'class'                 => 'calendarFetchFunctions',
        'method'                => 'multiFetchEvents'
    ),
    'parameter_type'        => 'standard',
    'parameters'            => array(
        array(  'name'     => 'parent_node_ids',
                'type'     => 'integer',
                'required' => true,
                'default'  => false ),
        array(  'name'     => 'from_time',
                'type'     => 'integer',
                'required' => true,
                'default'  => false ),
        array(  'name'     => 'to_time',
                'type'     => 'integer',
                'required' => true,
                'default'  => false
        ),array( 'name'    => 'view',
                'type'     => 'string',
                'required' => true,
                'default'  => false
        )
    )
);

$FunctionList['events_list'] = array(
    'name'                  => 'events_list',
    'operation_types'       => array( 'read' ),
    'call_method'           => array(
        'include_file'          => 'extension/mcalendar/classes/calendarFetchFunctions.php',
        'class'                 => 'calendarFetchFunctions',
        'method'                => 'fetchEvents'
    ),
    'parameter_type'        => 'standard',
    'parameters'            => array(
        array(  'name'     => 'parent_node_id',
                'type'     => 'integer',
                'required' => true,
                'default'  => false ),
        array(  'name'     => 'from_time',
                'type'     => 'integer',
                'required' => true,
                'default'  => false ),
        array(  'name'     => 'to_time',
                'type'     => 'integer',
                'required' => true,
                'default'  => false
        ),array( 'name'    => 'view',
                'type'     => 'string',
                'required' => true,
                'default'  => false
        )
    )
);
$FunctionList['events_tree'] = array(
    'name'                  => 'events',
    'operation_types'       => array( 'read' ),
    'call_method'           => array(
        'include_file'          => 'extension/mcalendar/classes/calendarFetchFunctions.php',
        'class'                 => 'calendarFetchFunctions',
        'method'                => 'fetchEventsTree'
    ),
    'parameter_type'        => 'standard',
    'parameters'            => $FunctionList['events_list']['parameters']
);


?>