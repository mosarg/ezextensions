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


 function getParentNodeID($url){
        $profContainer=eZContentObjectTreeNode::fetchByURLPath($url);
        if (is_object($profContainer)){
        return $profContainer->NodeID;
        }else{return 2;}

    }



$data="<scuola>/Docenti";
$scuola="Iti Cervignano";
$data2=preg_replace('/\s/','_',$scuola);
$data1=preg_replace('/<scuola>/',$data2,$data);


print getParentNodeID($data1);


$script->shutdown();
?>
