<?php
$debug=true;
$ini = eZINI::instance( 'sfnewslettertousergroup.ini' );
$prepend_string=$ini->variable( 'NameSettings','PrependSubscriptionListsString' );
$admin_user_id=$ini->variable('UserSettings','AdminUserID');
$groups_to_ignore=$ini->variable('UserGroupSettings','IgnoreGroup');

$admin_user = eZUser::fetch( $admin_user_id );
eZUser::setCurrentlyLoggedInUser($admin_user,$admin_user_id);


$cli->output("Starting to sync usergroups to subscriptionlists");
$all_subscriptionlists=eZSubscriptionList::fetchList( 0, eZSubscriptionList::countList() );
$all_usergroups=eZContentObjectTreeNode::subTreeByNodeID(array('ClassFilterType' => 'include','ClassFilterArray' => array('user_group')),5);

// For each usergroup check if subscriptionlist entry exists in table. If not, create it.

$db = eZDB::instance();
$db->begin();
$cli->output(sizeof($all_usergroups)." User Groups to investigate");

$sql = "SELECT DISTINCT usergroupid FROM sfnewslettertousergroup WHERE 1";

$all_relations=$db->arrayQuery($sql);
$cli->output(print_r($all_relations,true));

foreach ($all_usergroups as $user_group) {
	
	
	$name=$prepend_string;
	
	if ($debug)
	$cli->output("Investigating UserGroup with ID ".$user_group->ContentObjectID);
		
	$sql = "SELECT DISTINCT usergroupid, subscriptionlistid FROM sfnewslettertousergroup WHERE `usergroupid` = ".$user_group->ContentObjectID;
	$UGSLrelation = $db->arrayQuery( $sql );
		
	if ($debug)
	$cli->output($sql);
		
	if ($UGSLrelation) {
		$subscriptionListID=$UGSLrelation[0]['subscriptionlistid'];

		if ($debug)
		$cli->output("Usergroup has a subscriptionlist: ".$subscriptionListID);


		if (in_array($user_group->ContentObjectID,$groups_to_ignore)) { // Group should be ignored but already has a auto-generated subscriptionlist
					
			$cli->output("Removing group ".$user_group->ContentObjectID);
			$subscriptionListID=$UGSLrelation[0]['subscriptionlistid'];
			eZSubscriptionList::removeAll($subscriptionListID); // delete the no longer wanted subscriptionlist
			$sql = "DELETE FROM `sfnewslettertousergroup` WHERE `usergroupid` = ".$user_group->ContentObjectID;
			$db->query($sql); // remove relation entry from table 
	
			continue;
		}
		
		// Check for new users in the usergroup that don't belong to the corresponding subscriptionlist yet
		updateUsersInSubscriptionlist($user_group,eZSubscriptionList::fetch($subscriptionListID),$cli);
	}
	else {
		
		$depth=$user_group->Depth;

		if (in_array($user_group->ContentObjectID,$groups_to_ignore)) { // Ignore Groups defined in ini
			continue;
		}
		
		
		if ($depth > 2) { // Usergroup is a Subusergroup -> Prepend name of Parent Usergroup
			$parent_node=eZContentObjectTreeNode::fetch($user_group->ParentNodeID);
			$name.=$parent_node->Name." ".$user_group->Name;
		}
		else {
			$name.=$user_group->Name;
		}

		// Now create new subscriptionlist

		$new_subscriptionlist=eZSubscriptionList::create($name,$admin_user_id);
		$new_subscriptionlist_id=$new_subscriptionlist->attribute('id');

		$sql = "INSERT INTO `sfnewslettertousergroup` SET `usergroupid` = '".$user_group->ContentObjectID."', `subscriptionlistid` = ".$new_subscriptionlist_id;

		if ($debug)
		$cli->output($sql);

		$db->query($sql);

		$new_subscriptionlist->setAttribute("description","Auto-generated Subscriptionlist from usergroup ".$user_group->Name." (ID: ".$user_group->ContentObjectID.")");
		$new_subscriptionlist->publish();


		// Create subscriptions for all users in the usergroup and add them to the subscriptionlist

		updateUsersInSubscriptionlist($user_group,eZSubscriptionList::fetch($new_subscriptionlist_id),$cli);

	}
}
$db->commit();
eZUser::logoutCurrent();


function updateUsersInSubscriptionlist($usergroup,$subscriptionList,$cli) {
	$subscriptionListID=$subscriptionList->attribute('id');

	$users=eZContentObjectTreeNode::subTreeByNodeID(array('ClassFilterType' => 'include',
                                    'ClassFilterArray' => array('user')),$usergroup->MainNodeID);

	foreach ($users as $user) {
		$user_node=eZContentObjectTreeNode::fetch($user->NodeID);
		$data_map=$user_node->dataMap();
			
		$first_name=$data_map['first_name']->attribute('data_text');
		$last_name=$data_map['last_name']->attribute('data_text');
		$email=$data_map['user_account']->attribute('content')->attribute('email');

//		if ($subscriptionList->emailSubscriptionExists($email)) {
//			cli->output("Skipping ".$email);
//			continue;
//		}

//		if ($debug)
//		$cli->output($first_name." ".$last_name);
			
		$new_subscription=eZSubscription::create($subscriptionListID,$first_name,$last_name,0,$email);
		$new_subscription->setAttribute("status",eZSubscription::StatusApproved);
		$new_subscription->publish();
		 
	}
}
?>