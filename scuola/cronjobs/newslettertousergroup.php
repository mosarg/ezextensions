<?php
$debug=true;
$ini = eZINI::instance( 'scuola.ini' );
$prepend_string=$ini->variable( 'NameSettings','PrependSubscriptionListsString' );
$admin_user_id=$ini->variable('UserSettings','AdminUserID');
$groups_to_ignore=$ini->variable('UserGroupSettings','IgnoreGroup');
$userclasstype=$ini->variable('UserClassTypes','userclasstype');
$admin_user = eZUser::fetch( $admin_user_id );
eZUser::setCurrentlyLoggedInUser($admin_user,$admin_user_id);
$cli->output("Starting to sync usergroups to subscriptionlists");
$all_subscriptionlists=eZSubscriptionList::fetchList( 0, eZSubscriptionList::countList() );
$all_usergroups=eZContentObjectTreeNode::subTreeByNodeID(array('ClassFilterType' => 'include','ClassFilterArray' => array('user_group')),5);


// For each usergroup check if subscriptionlist entry exists in table. If not, create it.
$db = eZDB::instance();


$cli->output(sizeof($all_usergroups)." User Groups to investigate");
$sql = "SELECT DISTINCT usergroupid FROM sfnewslettertousergroup WHERE 1";
$all_relations=$db->arrayQuery($sql);


foreach ($all_usergroups as $user_group) {


    $name=$prepend_string;

    $cli->output("Investigating UserGroup with ID ".$user_group->ContentObjectID);

    $sql = "SELECT DISTINCT usergroupid, subscriptionlistid FROM sfnewslettertousergroup WHERE `usergroupid` = ".$user_group->ContentObjectID;
    $UGSLrelation = $db->arrayQuery( $sql );


    if ($UGSLrelation) {
        $subscriptionListID=$UGSLrelation[0]['subscriptionlistid'];


        if (in_array($user_group->ContentObjectID,$groups_to_ignore)) { // Group should be ignored but already has a auto-generated subscriptionlist

            $cli->output("Removing group ".$user_group->ContentObjectID);
            $subscriptionListID=$UGSLrelation[0]['subscriptionlistid'];
            eZSubscriptionList::removeAll($subscriptionListID); // delete the no longer wanted subscriptionlist
            $sql = "DELETE FROM `sfnewslettertousergroup` WHERE `usergroupid` = ".$user_group->ContentObjectID;
            $db->query($sql); // remove relation entry from table
            continue;
        }

        $subscriptionList=eZSubscriptionList::fetch($subscriptionListID);
        if (is_object($subscriptionList)) {
            updateUsersInSubscriptionlist($user_group,$subscriptionList,$cli,$userclasstype,$db);
        }else {
            $sql = "DELETE FROM `sfnewslettertousergroup` WHERE `subscriptionlistid` = ".$subscriptionListID;
            $db->query($sql); // remove relation entry from table
            $subscriptionList=createSubscriptionList($name,$user_group,$groups_to_ignore,$admin_user_id,$db);
            updateUsersInSubscriptionlist($user_group,$subscriptionList,$cli,$userclasstype,$db);
        }
    }
    else {

        $subscriptionList=createSubscriptionList($name,$user_group,$groups_to_ignore,$admin_user_id,$db);

        updateUsersInSubscriptionlist($user_group, $subscriptionList,$cli,$userclasstype,$db);

    }
}

eZUser::logoutCurrent();


function createSubscriptionList($name,$user_group,$groups_to_ignore,$admin_user_id,$db) {

    $depth=$user_group->Depth;
    if (in_array($user_group->ContentObjectID,$groups_to_ignore)) { // Ignore Groups defined in ini
        return;
    }

    if ($depth > 2) { // Usergroup is a Subusergroup -> Prepend name of Parent Usergroup
        $parent_node=eZContentObjectTreeNode::fetch($user_group->ParentNodeID);
        $name.=$parent_node->Name." ".$user_group->Name;
    }
    else {
        $name.=$user_group->Name;
    }

    // Now create new subscriptionlist
    $db->begin();
    $new_subscriptionlist=eZSubscriptionList::create($name,$admin_user_id);
    $new_subscriptionlist_id=$new_subscriptionlist->attribute('id');
    $sql = "INSERT INTO `sfnewslettertousergroup` SET `usergroupid` = '".$user_group->ContentObjectID."', `subscriptionlistid` = ".$new_subscriptionlist_id;
    $db->query($sql);
    $new_subscriptionlist->setAttribute("description","Auto-generated Subscriptionlist from usergroup ".$user_group->Name." (ID: ".$user_group->ContentObjectID.")");
    $new_subscriptionlist->publish();
    $db->commit();
    return $new_subscriptionlist;

}


function updateUsersInSubscriptionlist($usergroup,$subscriptionList,$cli,$userclasstype,$db) {

    if (!is_object($subscriptionList)) {
        $cli->output('SubcriptionList is not an object');
        return;
    }
    $subscriptionListID=$subscriptionList->attribute('id');
    $users=eZContentObjectTreeNode::subTreeByNodeID(array('ClassFilterType' => 'include',
        'ClassFilterArray' => $userclasstype),$usergroup->MainNodeID);

    foreach ($users as $user) {
        $user_node=eZContentObjectTreeNode::fetch($user->NodeID);
        $data_map=$user_node->dataMap();

        $first_name=$data_map['first_name']->attribute('data_text');
        $last_name=$data_map['last_name']->attribute('data_text');
        $email=$data_map['user_account']->attribute('content')->attribute('email');

        if ($subscriptionList->emailSubscriptionExists($email)) {
            continue;
        }

        $db->begin();
        $new_subscription=eZSubscription::create($subscriptionListID,$first_name,$last_name,0,$email);
        $new_subscription->setAttribute("status",eZSubscription::StatusConfirmed);
        $new_subscription->setAttribute("status",eZSubscription::StatusApproved);
        $new_subscription->publish();
        $db->commit();

    }



}
?>