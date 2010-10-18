<?php
//
// Definition of eZApproveExtendedFilter class
//
// Created on: <31-Jan-2006 14:41:50 hovik>
//
// ## BEGIN COPYRIGHT, LICENSE AND WARRANTY NOTICE ##
// SOFTWARE NAME: eZ Approve 2
// SOFTWARE RELEASE: 0.8.0
// COPYRIGHT NOTICE: Copyright (C) 2006-2008 eZ Systems AS
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
// ## END COPYRIGHT, LICENSE AND WARRANTY NOTICE ##
//

/*! \file ezapproveextendedfilter.php
*/

/*!
  \class eZApproveExtendedFilter ezapproveextendedfilter.php
  \brief The class eZApproveExtendedFilter does

*/

class eZApproveExtendedFilter
{
    /*!
     Constructor
    */
    function __construct()
    {
    }

    /*!
     Create SQL parts
    */
    static function createSqlParts( $params )
    {
        $db = eZDB::instance();

        $sqlTables = '';
        $sqlJoins = '';
        if ( isset( $params['status'] ) )
        {
            $sqlTables = ', ezx_approve_status ';

            $sqlJoins = ' ( ezx_approve_status.contentobject_id = ezcontentobject.id AND
                            ezx_approve_status.active_version = ezcontentobject_version.version AND
                            ezx_approve_status.approve_status ';

            if ( is_array( $params['status'] ) )
            {
                $sqlJoins .= 'IN ( \'' . implode( '\', \'', $params['status'] ) . '\' )';
            }
            else
            {
                $sqlJoins .= '= \'' . $db->escapeString( $params['status'] ) . '\'';
            }
            $sqlJoins .= '  ) AND';
        }

        return array( 'tables' => $sqlTables,
                      'joins'  => $sqlJoins );
    }
}

?>
