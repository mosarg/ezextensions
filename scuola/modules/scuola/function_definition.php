<?php
//

$FunctionList = array();

$FunctionList['fetch_students_lite'] = array(
    'name'                  => 'fetch_students_lite',
    'operation_types'       => array( 'read' ),
    'call_method'           => array(
        'include_file'          => 'extension/scuola/classes/scuolaFetchFunctions.php',
        'class'                 => 'scuolaFetchFunctions',
        'method'                => 'fetchStudentsByClassLite'
    ),
    'parameter_type'        => 'standard',
    'parameters'            => array(
        array(  'name'     => 'parent_node_id',
                'type'     => 'integer',
                'required' => true,
                'default'  => false ),
        array(  'name'     => 'class',
                'type'     => 'string',
                'required' => true,
                'default'  => false )
    )
);




?>