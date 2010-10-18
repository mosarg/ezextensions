<?php
//
// Created on: <30-Apr-2002 12:36:36 bf>
//
// SOFTWARE NAME: eZ Publish
// SOFTWARE RELEASE: 4.0.1
// BUILD VERSION: 22260
// COPYRIGHT NOTICE: Copyright (C) 1999-2008 eZ Systems AS
// SOFTWARE LICENSE: GNU General Public License v2.0
// NOTICE: >
//   This program is free software; you can redistribute it and/or
//   modify it under the terms of version 2.0  of the GNU General
//   Public License as published by the Free Software Foundation.
//
//   This program is distributed in the hope that it will be useful,
//   but WITHOUT ANY WARRANTY; without even the implied warranty of
//   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//   GNU General Public License for more details.
//
//   You should have received a copy of version 2.0 of the GNU General
//   Public License along with this program; if not, write to the Free
//   Software Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston,
//   MA 02110-1301, USA.
//
//

$Module = array( 'name' => 'User management',
                 'variable_params' => true );

$ViewList = array();

$ViewList['register2'] = array(
    'functions' => array('register2'),
    'script' => 'register2.php',
    'params' => array('redirect_number'),
    'unordered_params' => array('classe' => 'classtype','action'=>'actionType'),
    'ui_context' => 'edit',
    'default_navigation_part' => 'ezmynavigationpart',
    'single_post_actions' => array( 'DiscardButton'=>'Discard',
                                    'PublishButton' => 'Publish',
                                    'CancelButton' => 'Cancel',
                                    'CustomActionButton' => 'CustomAction' ) );


$ViewList['activate2'] = array(
    'functions' => array( 'login' ),
    'script' => 'activate2.php',
    'ui_context' => 'authentication',
    'default_navigation_part' => 'ezmynavigationpart',
    'params' => array( 'Hash', 'MainNodeID' ) );


$ViewList['list']=array(
	'functions'=>array('list'),
        'default_navigation_part' => 'userlists',
        'script'=>'list.php',
	'params'=>array('state'),
	'single_post_actions' => array()
	);

$ViewList['edit'] = array(
    'functions' => array( 'login' ),
    'script' => 'edit.php',
    'ui_context' => 'edit',
    'single_post_actions' => array( 'ChangePasswordButton' => 'ChangePassword',
                                    'ChangeSettingButton' => 'ChangeSetting',
                                    'CancelButton' => 'Cancel',
                                    'EditButton' => 'Edit' ),
    'params' => array( 'UserID','class' ) );

$ViewList['seltype']=array(
	'functions'=>array('seltype'),
	'script'=>'seltype.php',
	'params'=>array(),
	'single_post_actions' => array('CancelButton' => 'Cancel')
	);
$ViewList['setting'] = array(
    'functions' => array( 'preferences' ),
    'default_navigation_part' => 'ezusernavigationpart',
    'script' => 'setting.php',
    'params' => array( 'UserID' ) );

$ViewList['password'] = array(
    'functions' => array( 'password' ),
    'script' => 'password.php',
    'ui_context' => 'administration',
    'default_navigation_part' => 'ezmynavigationpart',
    'params' => array( 'UserID' ) );

$FunctionList = array();
$FunctionList['register2'] = array();
$FunctionList['seltype']=array();
$FunctionList['list']=array();
$FunctionList['login']=array();
$FunctionList['preferences']=array();
$FunctionList['password']=array();
$FunctionList['selfedit'] = array();
?>
