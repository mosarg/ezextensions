<?php
/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
*/
include_once( "kernel/common/template.php" );
$Module = $Params['Module'];
$State  = $Params['state'];
if ($State<>'') {
    $db = eZDB::instance();
//    $query="SELECT name,user_id FROM ezuser_setting
//        LEFT JOIN ezcontentobject ON ezuser_setting.user_id=ezcontentobject.id
//        WHERE ezuser_setting.is_enabled=$State";
    $query="SELECT name,email,ezuser_setting.user_id,hash_key,ezcontentobject.contentclass_id FROM
        ((ezuser_setting LEFT JOIN ezuser ON ezuser_setting.user_id=ezuser.contentobject_id) LEFT JOIN
         ezuser_accountkey on ezuser_setting.user_id=ezuser_accountkey.user_id)
        LEFT JOIN ezcontentobject ON ezuser_setting.user_id=ezcontentobject.id
        WHERE ezuser_setting.is_enabled=$State ORDER BY ezcontentobject.contentclass_id";

    $users = $db->arrayQuery($query);
}
else {
    $users=array('YOU must supply user state');
}
$tpl = templateInit();

$all_users=array();
foreach($users as $current_user){
    $all_users[$current_user['contentclass_id']][]=$current_user;
}

$viewParameters = array( 'state' => $State);
$tpl->setVariable( 'view_parameters', $viewParameters );
$tpl->setVariable('all_users',$all_users);

$Result = array();
$Result['content'] = $tpl->fetch( 'design:user/list.tpl' );
$Result['left_menu'] ='design:user/menu.tpl';
$Result['path'] = array( array( 'url' => 'user2/list','text' => 'Elenco'),
        array( 'url' => false,'text' => 'utenti' ) );
?>
