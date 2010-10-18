<?php

require 'autoload.php';
$school='users_codroipo';
$main_parent_node='5';
$output="/var/www/linussio/extension/scuola/trees/".$school.time().".xml";
$source="/var/www/linussio/extension/scuola/trees/".$school.".xml";
$xml_tree=simplexml_load_file($source);
function generateObject($parentNodeId,$classIdentifier,$objectName,$section,$child) {
    global $db;
    $params = array();
    $params['creator_id'] = (int)'14';
    $params['parent_node_id'] = (int)$parentNodeId;
    $params['class_identifier'] = $classIdentifier;
    switch($classIdentifier) {
        case "article":
            $params['attributes']=array('title'=>ucfirst($objectName),'summary'=>'Sommario articolo');
            break;
        case "article_mainpage":
            $params['attributes']=array('title'=>ucfirst($objectName),'summary'=>'Sommario articolo');
            break;
        case "contatti":
            $params['attributes']=array('nome'=>ucfirst($objectName));
            break;
        case "event_calendar":
            $params['attributes']=array('title'=>ucfirst($objectName),'view'=>'2');
            break;
        case "classe":
            $params['attributes']=array('name'=>ucfirst($objectName),'indirizzo'=>$child['indirizzo'],
                                        'sezione'=>$child['lettsezione'],'articolata'=>$child['articolata']);
            break;
        default:
            $params['attributes']=array('name'=>ucfirst($objectName));
    }
    
    $newObject = eZContentFunctions::createAndPublishObject($params);

    if($section!=1) {
        $db->begin();
       
        eZContentObjectTreeNode::assignSectionToSubTree($newObject->attribute( 'main_node_id' ),
                (int)$section);
      
        $db->commit();
    }
  
    if( (isset($child['state']) )&&( $child['state']!='1') ){
            print($child['state']);
            $currentstate=eZContentObjectState::fetchById((int)$child['state']);
            $newObject->assignState($currentstate);
          }
    return $newObject->attribute( 'main_node_id' );
}

function recursiveTreeParse($node,$startParentNode,$depth=0) {
    if(count($node->children())==0) {$depth=0;
    }
    foreach ($node->children() as $child) {
        printf("%s\n",$depth."-".str_repeat('---',$depth).">".$child['nome']."  ".$child['classe']);
      

        if(isset($child['sezione'])) {
          $section=(int)$child['sezione'];
          
        }else {$section=1;
           
        }
       
        $ParentNode=generateObject($startParentNode,(string)$child['classe'],
        (string)$child['nome'],$section,$child);
         
        if(!isset($child['nodeID'])) {
            $child->addAttribute("nodeID",$ParentNode);
            
            }
       recursiveTreeParse($child,$ParentNode,$depth+1);
    }
}
function setSections($node,$depth=0) {
    if(count($node->children())==0) {$depth=0;
    }
    foreach ($node->children() as $child) {
        if(isset($child['sezione'])) {
            $section=(int)$child['sezione'];
            eZContentObjectTreeNode::assignSectionToSubTree($child['nodeID'],$section);
        }else {$section=2;}
        printf("%s\n",$section."-".str_repeat('---',$depth).">".$child['nome']."  ".$child['nodeID']);

        setSections($child,$depth+1);
    }
}
$cli = eZCLI::instance();
if(!$cli) {
    $cli->error( 'Something strange happened' );
    $script->shutdown( 1 );
    return;
}


$endl = $cli->endlineString();

$script = eZScript::instance( array( 'description' => 'test',
    'use-session' => false,
    'use-modules' => true,
    'use-extensions' => true ) );

$script->startup();

$script->initialize();

//init database
$db = eZDB::instance();

// Log in admin user
if ( isset( $options['admin-user'] ) ) {
    $adminUser = $options['admin-user'];
}
else {
    $adminUser = 'admin';
}
$user = eZUser::fetchByName( $adminUser );
if ( $user )
    eZUser::setCurrentlyLoggedInUser( $user, $user->attribute( 'id' ) );
else {
    $cli->error( 'Could not fetch admin user object' );
    $script->shutdown( 1 );
    return;
}

recursiveTreeParse($xml_tree,$main_parent_node);
$xml_tree->asXML($output);
//$xml_c=simplexml_load_file($output);
//setSections($xml_c);
$script->shutdown();
?>