<?php

$Module = array( 'name' => 'Utils' ,'variable_params' => true );
$ViewList = array();
$ViewList['edit'] = array(
    'functions' => array( 'edit' ),
    'default_navigation_part' => 'ezcontentnavigationpart',
    'ui_context' => 'edit',
    'single_post_actions' => array( 'PreviewButton' => 'Preview',
                                    'TranslateButton' => 'Translate',
                                    'VersionsButton' => 'VersionEdit',
                                    'PublishButton' => 'Publish',
                                    'DiscardButton' => 'Discard',
                                    'BrowseNodeButton' => 'BrowseForNodes',
                                    'RemoveAssignmentButton' => 'RemoveAssignments',
                                    'EditLanguageButton' => 'EditLanguage',
                                    'FromLanguageButton' => 'FromLanguage',
                                    'TranslateLanguageButton' => 'TranslateLanguage',
                                    'BrowseObjectButton' => 'BrowseForObjects',
                                    'UploadFileRelationButton' => 'UploadFileRelation',
                                    'NewButton' => 'NewObject',
                                    'DeleteRelationButton' => 'DeleteRelation',
                                    'StoreButton' => 'Store',
                                    'StoreExitButton' => 'StoreExit',
                                    'MoveNodeID' => 'MoveNode',
                                    'RemoveNodeID' => 'DeleteNode',
                                    'ConfirmButton' => 'ConfirmAssignmentDelete',
                                    'SectionEditButton' => 'SectionEdit',
                                    'StateEditButton' => 'StateEdit',
                                    ),
    'post_action_parameters' => array( 'EditLanguage' => array( 'SelectedLanguage' => 'EditSelectedLanguage' ),
                                       'FromLanguage' => array( 'FromLanguage' => 'FromLanguage' ),
                                       'TranslateLanguage' => array( 'SelectedLanguage' => 'EditSelectedLanguage' ),
                                       'UploadFileRelation' => array( 'UploadRelationLocation' => 'UploadRelationLocationChoice' ) ),
    'post_actions' => array( 'BrowseActionName' ),
    'script' => 'edit.php',
    'params' => array( 'ObjectID', 'EditVersion', 'EditLanguage', 'FromLanguage' ) );
$ViewList['ajaxedit'] =array(
                          'functions' => array( 'edit' ),
                          'script' => 'ajaxedit.php',
                          "default_navigation_part" => 'ezcontentnavigationpart',
                          'params' => array( 'NodeID' ),
                          "unordered_params" => array( 'userid' => 'userid' )
);
$ViewList['activate'] = array(
                          'functions' => array( 'activation' ),
                          'script' => 'activate.php',
                          "default_navigation_part" => 'ezcontentnavigationpart',
                          "unordered_params" => array( 'userid' => 'userid' )
);

$ViewList['clear'] = array(
    'functions' => array( 'cache' ),
    'script' => 'clear.php',
    'params' => array ( 'nodeid' ) );

$FunctionList = array();
$FunctionList['activation'] = array();
$FunctionList['cache']=array();
$FunctionList['edit']=array();

?>
