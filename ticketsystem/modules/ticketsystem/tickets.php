<?php
	
	
	$TicketSystemINI = eZINI::instance('ticketsystem.ini');	
	$TicketNodeID 	 = $TicketSystemINI->variable('TicketSettings', 'TicketNodeID');
	$Object =eZContentObjectTreeNode::fetch($TicketNodeID);

        //------------------  Template handling  -------------------------------------------------------
	include_once("kernel/common/template.php");
	$tpl = templateInit();
	$tpl->setVariable("TicketNodeID", $TicketNodeID);
	$tpl->setVariable("node",  $Object);
	$Result = array();
	$Result['content'] = $tpl->fetch( 'design:ticketsystem/ticketsystem.tpl' );
	$Result['path'] = array( array( 'url' => true,
	                                'text' => 'Ticket System' ) );
	//----------------------------------------------------------------------------------------------	
?>