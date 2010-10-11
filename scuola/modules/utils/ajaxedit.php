<?php
$Module =& $Params['Module'];
if ( $Params[ 'NodeID' ] )
{
       echo "Received NodeID:".$Params[ 'NodeID' ];
}
eZDB::checkTransactionCounter();
eZExecution::cleanExit();
?>
