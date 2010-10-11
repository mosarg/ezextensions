<?php
/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of scuolaAjaxCalls
 *
 * @author mosa
 */
class scuolaAjaxCalls {
    public static function helloworld() {
        echo ("test");
    }
    public static function enabledUsers($args) {

        $db = eZDB::instance();
        $query="SELECT name,user_id from ezuser_setting
        LEFT JOIN ezcontentobject ON ezuser_setting.user_id=ezcontentobject.id
        WHERE ezuser_setting.is_enabled=$args[0]";
        $users = $db->arrayQuery($query);
        $dati=eZYuiAjaxContent::xmlEncode($users);
        return $dati;

    }
}
?>
