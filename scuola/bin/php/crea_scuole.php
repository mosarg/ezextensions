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

$classID = 108; //Class id (scuole)
$nodeID = $argv[1]; // ID of parent node (resolutions folder)
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
// Instantiate a new resolution object

$object = $class->instantiate();

if (!$object)

{
   $cli->output('Error: could not create object');
}
$title='';
$short_title='';
$referenti='';
$intro=$argv[5];
$meccanografico=$argv[6];

$attributes = array('meccanografico'=>$meccanografico,
                    'title'=>$title,
                    'short_title'=>$short_title,
                    'author'=>'sistema',
                    'referenti'=>$referenti,
                    'intro'=>$intro
                );
$params = array();
$params['parent_node_id'] = $nodeID;
$params['class_identifier'] = 'scuola';
$params['attributes'] = $attributes;
$object = eZContentFunctions::createAndPublishObject( $params );
$script->shutdown();
?>
