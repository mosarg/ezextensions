<?php

require_once ("kernel/classes/ezcontentcache.php");

//$Params['NamedParameters']['nodeid'];
if (!isset ($Params['Parameters'][0]))
  die ("proper syntax /utils/clear/<nodeid>. /utils/clear/2 will clear the home page");

$nodeid=$Params['Parameters'][0];
print_r($_SERVER);

//$ReturnURI=$_SERVER["HTTP_REFERER"];
$result=parse_url($_SERVER["HTTP_REFERER"]);
//if (strncmp ( $result ['path'], "/utils/clear", 15 )== 0)
$ReturnURI="/content/view/full/$nodeid";

eZContentCache::cleanup(array($nodeid)); 

header("Location: $ReturnURI");
   
?>
