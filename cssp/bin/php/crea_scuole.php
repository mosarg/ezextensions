<?php
/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
*/


require 'autoload.php';



function sanitize($string){
    $goodString=str_replace(chr(160),'',$string);
    $goodString=preg_replace('/\s\s+/',' ',trim(strtolower( $goodString)));
    
    return $goodString;
}



/***********************************************************************
 * $schoolAttributes: hash con i valori dei campi della classe scuola
 *
 ***********************************************************************/
function createSchool($schoolAttributes,$parentNodeId) {

    $params['parent_node_id'] = $parentNodeId;
    $params['class_identifier'] = 'scuola';
    $params['attributes'] = $schoolAttributes;
    $newObject = eZContentFunctions::createAndPublishObject($params);

    return $newObject->attribute('main_node_id');
}

function extractChiefSchools($filename) {

    $handle = fopen($filename, "r");
    $chiefSchools=array();

    while (($data = fgetcsv($handle,0, ",","'")) !== FALSE) {
        if(trim($data[5])<>'') {
            array_push($chiefSchools,$data);
        }

    }
    fclose($handle);
    return $chiefSchools;
}

function extractDepSchools($chiefSchools,$filename) {

    $handle = fopen($filename, "r");
    $depSchools=array();

    while (($data = fgetcsv($handle,0, ",","'")) !== FALSE) {
        if((trim($data[5])=='')&&($data[1]<>'')) {

            if (array_key_exists(trim($data[1]),$depSchools))
                array_push($depSchools[trim($data[1])],$data);
            else {
                $depSchools[trim($data[1])]=array();
                array_push($depSchools[trim($data[1])],$data);
            }
        }
    }
    fclose($handle);
    return $depSchools;
}

function formatSchoolData($data) {
    $capofila=0;
    $num = count($data);
    $parentNodeID=2;
    $schoolAttributes=array();


    if ($data[0]<>''):
        printf("%s %s %s \n",'Scuola',$data[6],'in fase di creazione ');
        if($data[5]<>'') $capofila=1;
        printf('%d ',$capofila);
        $schoolAttributes['prov']=sanitize($data[0]);
        $schoolAttributes['meccanografico_scuola']=strtoupper(sanitize($data[1]));
        $schoolAttributes['denom_istituzione']=ucwords(sanitize($data[2]));
        $schoolAttributes['meccanografico_plesso']=strtoupper(sanitize($data[3]));
        $schoolAttributes['tipo']=preg_replace('/\s+/','_',sanitize($data[4]));
        $schoolAttributes['capofila']=sanitize($capofila);
        $schoolAttributes['titolo_plesso']=ucwords(sanitize($data[6]));
        $schoolAttributes['indirizzo']=ucwords(sanitize($data[7]));
        $schoolAttributes['comune']=ucwords(sanitize($data[8]));
        $schoolAttributes['cap']=(int)trim($data[9]);
        $schoolAttributes['telefono']=(int)(trim($data[10]).trim($data[11]));
        $schoolAttributes['fax']=(int)(trim($data[10]).trim($data[12]));
        $schoolAttributes['email']=sanitize($data[13]);

        switch ($schoolAttributes['tipo']) {
            case 'media':
                $parentNodeID=810;
                break;
            case 'elementare':
                $parentNodeID=809;
                break;
            case 'materna':
                $parentNodeID=809;
                break;
            default:
                $parentNodeID=811;
                break;
    }
    endif;
    return array('object_attributes'=>$schoolAttributes,'parent_nodeid'=>$parentNodeID);
}

$cli =eZCLI::instance();

$script =$script = eZScript::instance( array( 'description' => "Genera automaticamente le scuole",
        'use-session' => true,
        'use-modules' => true,
        'use-extensions' => true ) );
$script->startup();

$script->setUseSiteAccess('cssp_ita');

$script->initialize();

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



$chiefSchools=extractChiefSchools('/tmp/scuole.csv');

$depSchools=extractDepSchools($chiefSchools, '/tmp/scuole.csv');



/*
 * Create chief schools
*/

$chiefSchoolsNodes=array();
foreach ($chiefSchools as $chiefSchool) {
    $chiefSchoolData=formatSchoolData($chiefSchool);
    $node_id=createSchool($chiefSchoolData['object_attributes'], $chiefSchoolData['parent_nodeid']);
    $chiefSchoolsNodes[$chiefSchool[1]]=$node_id;
}


/*
 * Create sub schools
*/

foreach ($chiefSchoolsNodes as $meccano=>$chiefNodeId) {

    if (array_key_exists($meccano, $depSchools)):
        if (is_array($depSchools[$meccano])):
            foreach($depSchools[$meccano] as $depSchool) {
                $depSchoolData=formatSchoolData($depSchool);
                createSchool($depSchoolData['object_attributes'],$chiefNodeId);
        }
        endif;
    endif;
}


$script->shutdown();
?>
