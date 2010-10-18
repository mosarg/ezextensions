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

function generateUser($firstName,$lastName,$nodeID,$userName,$password,$email,$school)
{
        $attributes = array('first_name'=>$firstName,'last_name'=>$lastName,'school'=>$school);
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
while (($data = fgetcsv($handle, 1000, ",")) !== FALSE) {
    $num = count($data);
    $row++;
    for ($c=0; $c < $num; $c++) {
       printf("%s   ",$data[$c]);


    }

    generateUser($data[0],$data[1],$nodeID,$data[2],$data[3],$data[2].'@isismalignani.it',$data[4]);
    printf("%s\n",'');
    sleep(2);
}
fclose($handle);


$script->shutdown();
?>
