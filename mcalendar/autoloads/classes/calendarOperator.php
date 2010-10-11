<?php

class calendarOperator {
    private $OperatorName = false;
    private $Parameters;

    function __construct( $operatorName = false ) {
        $this->OperatorName = $operatorName;

        $parameters = func_get_args();
        array_shift( $parameters );
        $this->Parameters = array();
        foreach ( $parameters as $parameter ) {
            $parameterArray = explode( '=', $parameter, 2 );
            $parameterName = $parameterArray[0];
            if ( count( $parameterArray ) == 2 ) {
                $this->Parameters[$parameterName] = array( 'type' => 'mixed', 'required' => false, 'default' => $parameterArray[1] );
            }
            else {
                $this->Parameters[$parameterName] = array( 'type' => 'mixed', 'required' => true );
            }
        }
    }

    function operatorList() {
        return array( $this->OperatorName );
    }

    function namedParameterPerOperator() {
        return true;
    }

    function namedParameterList() {
        return array( $this->OperatorName => $this->Parameters );
    }

    static function execute( $operatorValue, $namedParameters ) {
        return $operatorValue;
    }

    function modify( $tpl, $operatorName, $operatorParameters, $rootNamespace,
        $currentNamespace, &$operatorValue, $namedParameters ) {
        $operatorValue = call_user_func( array( get_class( $this ), 'execute' ), $operatorValue, $namedParameters );
    }

    function operatorTemplateHints() {
        return array( $this->OperatorName => array( 'parameters' => true,
        'input' => true,
        'output' => true,
        'element-transformation' => true,
        'transform-parameters' => true,
        'input-as-parameter' => 'always',
        'element-transformation-func' => 'transformation' ) );
    }

    function transformation( $operatorName, $node, $tpl, $resourceData,
        $element, $lastElement, $elementList, $elementTree, $parameters ) {
        include_once( 'extension/mcalendar/autoloads/calendarOperators.php' );

        $operators = calendarOperators::operators();
        $operatorInfo = $operators[$operatorName];
        $namedParametersVarName = '$namedParameters' . md5( mt_rand() );
        $newElements[] = eZTemplateNodeTool::createCodePieceElement( "unset( $namedParametersVarName );\n$namedParametersVarName = array();\n" );
        $index = 2;
        foreach( $this->Parameters as $parameterName => $parameter ) {
            if ( isset( $parameters[$index-1] ) ) {
                $newElements[] = eZTemplateNodeTool::createCodePieceElement( "{$namedParametersVarName}['$parameterName'] = %$index%;\n", $parameters );
            }
            else {
                $newElements[] = eZTemplateNodeTool::createCodePieceElement( "{$namedParametersVarName}['$parameterName'] = " .
                    var_export( $parameter['default'], true ) . ";\n" );
            }
            $index++;
        }
        // $newElements[] = eZTemplateNodeTool::createCodePieceElement( "include_once( '${operatorInfo['script']}' );\n" );
        $newElements[] = eZTemplateNodeTool::createCodePieceElement( "%output% = ${operatorInfo['class']}::execute( %1%, $namedParametersVarName );\n", $parameters );
        $newElements[] = eZTemplateNodeTool::createCodePieceElement( "unset( $namedParametersVarName );\n" );

        return $newElements;
    }
}

?>
