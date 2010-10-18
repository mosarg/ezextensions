<?php

$eZTemplateOperatorArray = mOperators::operators();
$eZTemplateOperatorArray[] = array( 'script' => 'extension/moperators/autoloads/mpagedata.php',
                                    'class' => 'mPageData',
                                    'operator_names' => array( 'mpagedata', 'mpagedata_set', 'mpagedata_append' ) );

?>
