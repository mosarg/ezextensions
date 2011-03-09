<?php
/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of userutils
 *
 * @author mosa
 */
class userUtils {
    protected $xmldata;
    function __construct($source) {
        $current_path=getcwd();
        $this->xmldata=simplexml_load_file($current_path.'/extension/'.$source);
    }
    private function generateObject($parentNodeId,$classIdentifier,$objectName,$section,$child,$creatorId) {
        $params = array();
        $params['creator_id'] = (int)$creatorId;
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
                $params['attributes']=array('title'=>ucfirst($objectName),'view'=>'0');
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
            eZContentObjectTreeNode::assignSectionToSubTree($newObject->attribute( 'main_node_id' ),
                (int)$section);
        }
        if( (isset($child['state']) )&&( $child['state']!='1') ) {
            print($child['state']);
            $currentstate=eZContentObjectState::fetchById((int)$child['state']);
            $newObject->assignState($currentstate);
        }
        return $newObject->attribute( 'main_node_id' );
    }

    private  function recursiveTreeParse($node,$startParentNode,$creatorId,$depth=0) {
        if(count($node->children())==0) {$depth=0;
        }
        foreach ($node->children() as $child) {
            if(isset($child['sezione'])) {
                $section=(int)$child['sezione'];

            }else {$section=1;}

            $ParentNode=self::generateObject($startParentNode,(string)$child['classe'],
                (string)$child['nome'],$section,$child,$creatorId);

            if(!isset($child['nodeID'])) {
                $child->addAttribute("nodeID",$ParentNode);

            }
            self::recursiveTreeParse($child,$ParentNode,$creatorId,$depth+1);
        }
    }
    public function buildTree($startParentNode,$creatorId) {
        $node=$this->xmldata;
        self::recursiveTreeParse($node,$startParentNode,$creatorId);
        return true;
    }
}
?>
