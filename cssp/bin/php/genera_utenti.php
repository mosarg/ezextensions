<?php
/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */


require 'autoload.php';

$cli =eZCLI::instance();
$script =$script = eZScript::instance( array( 'description' => "my description",
                                     'use-session' => true,
                                     'use-modules' => true,
                                     'use-extensions' => true ) );
$script->startup();
$options = $script->getOptions();
$script->initialize();

function generateUser($firstName,$lastName,$nodeID,$userName,$password,$email)
{
        $attributes = array('first_name'=>$firstName,
                   'last_name'=>$lastName,
                     );
        $params = array();
        $params['parent_node_id'] = $nodeID;
        $params['class_identifier'] = 'user';
        $params['attributes'] = $attributes;
        $object = eZContentFunctions::createAndPublishObject( $params );
        $user = eZuser::fetch( $object->ID);
        $user->setInformation($object->ID,$userName,$email,$password,$password);
        $user->store();
}


$classID = 4; //Class id (scuole)
$nodeID = 12; // Users Main group
// Get class definition

if ( !$class = eZContentClass::fetch( $classID ) )

{
   $cli->output('Error: Could not fetch class');

}
// Get the parent node
$node = eZContentObjectTreeNode::fetch($nodeID);
if (!$node)
{
   $cli->output('Error: no mapped parent node');
}



$first_name="mosanga";
$last_name="stanga";
$email="sntt@dr.com";
$login="mosanga";
$password_hash_type="0";

$execute=false;

$row = 1;
$handle = fopen("/tmp/questionario.csv", "r");
while (($data = fgetcsv($handle, 1000, ",")) !== FALSE) {
    $num = count($data);
    $row++;
    for ($c=0; $c < $num; $c++) {
       printf("%s   ",$data[$c]);


    }

    generateUser($data[0],$data[1],$nodeID,$data[2],$data[3],$data[2].'@e-moka.net');
    printf("%s\n",'');
}
fclose($handle);


$script->shutdown();
?>
