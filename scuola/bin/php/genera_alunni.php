<?php
/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */


#chdir('/var/www/ez');
require 'autoload.php';

$cli =eZCLI::instance();
$script =$script = eZScript::instance( array( 'description' => "my description",
                                     'use-session' => true,
                                     'use-modules' => true,
                                     'use-extensions' => true ) );
$script->startup();
$options = $script->getOptions();
$script->initialize();
function generateUser($firstName,$lastName,$nodeID,$userName,$password,$email,$school,$class)
{
        $attributes = array('first_name'=>$firstName,'last_name'=>$lastName,'school'=>$school,'classe'=>$class);
        $params = array();
        $params['parent_node_id'] = $nodeID;
        $params['class_identifier'] = 'alunno';
        $params['attributes'] = $attributes;
        $object = eZContentFunctions::createAndPublishObject( $params );

        $user = eZuser::fetch( $object->ID);
        $user->setInformation($object->ID,$userName,$email,$password,$password);
        $user->store();
}

$classID = 78; //Class id
$nodeID = 12; // Users Main group
$row = 1;
$handle = fopen("/tmp/alunni.csv", "r");



$duplicate_users = fopen('/tmp/duplicate_users.csv', 'w');



$db = eZDB::instance();

$db_query="SELECT email,login FROM ezuser";


$users = $db->arrayQuery($db_query);

foreach ($users as $user){
    $user_data[$user['login']]=$user['email'];
}

while (($data = fgetcsv($handle, 1000, ",","'")) !== FALSE) {
    $num = count($data);
    $row++;
    for ($c=0; $c < $num; $c++) {
       printf("%s   ",$data[$c]);
    }
    if(isset($input_users[$data[2]])){
    $input_users[$data[2]]+=1;
       }else{
       $input_users[$data[2]]=1;}
    

    if( ($input_users[$data[2]]==1) && (!isset($user_data[$data[2]]))){
    generateUser($data[0],$data[1],$nodeID,$data[2],$data[3],$data[2].'@isismalignani.it',$data[4],$data[5]);
    printf("%s\n",'');}
    else{printf("%s\n",'User already present');
        fputcsv($duplicate_users, $data);
    }
    sleep(2);
}
fclose($handle);
fclose($duplicate_users);

$script->shutdown();
?>
