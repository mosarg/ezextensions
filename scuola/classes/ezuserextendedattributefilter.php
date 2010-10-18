<?php

class eZUserExtendedAttributeFilter
{
    function createEnabledSqlParts( $params )
    {
        $tables = ', ezuser_setting';
        $joins = 'ezuser_setting.user_id=ezcontentobject.id AND ezuser_setting.is_enabled=1 AND';
        return array( 'tables' => $tables, 'joins' => $joins, 'columns' => '' );
    }

    function createDisabledSqlParts( $params )
    {
        $tables = ', ezuser_setting';
        $joins = 'ezuser_setting.user_id=ezcontentobject.id AND ezuser_setting.is_enabled=0 AND';
        return array( 'tables' => $tables, 'joins' => $joins, 'columns' => '' );
    }
}

?>