#!/usr/bin/env php
<?php
//
// Created on: <18-Dec-2003 17:44:15 amos>
//
// SOFTWARE NAME: eZ Publish
// SOFTWARE RELEASE: 4.1.3
// BUILD VERSION: 23650
// COPYRIGHT NOTICE: Copyright (C) 1999-2009 eZ Systems AS
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

require 'autoload.php';
set_time_limit( 0 );
$cli = eZCLI::instance();
$endl = $cli->endlineString();
$script = eZScript::instance( array( 'description' => ( "eZ Publish database cleanup.\n\n" .
                                                        "Will cleanup various data from the currently used database in eZ Publish\n" .
                                                        "\n" .
                                                        "Possible values for NAME is:\n" .
                                                        "session, expired_session, preferences, browse, tipafriend, shop, forgotpassword, workflow,\n" .
                                                        "collaboration, collectedinformation, notification, searchstats or all (for all items)\n" .
                                                        "cleanup.php -s admin session"),
                                     'use-session' => false,
                                     'use-modules' => true,
                                     'use-extensions' => true ) );

$script->startup();
$script->initialize();
$db = eZDB::instance();
$cli->output( "Removing all ezcollaboration2 item" );
eZXApproveStatus::niceCleanup();
//eZCollaborationItem::cleanup();
//eZXApproveStatus::cleanupGroups();
$script->shutdown();

?>
