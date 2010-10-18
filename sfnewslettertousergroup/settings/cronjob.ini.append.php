<? /* #?ini charset="utf-8"?
# eZ Publish configuration file for cronjobs.
#
#
# NOTE: It is not recommended to edit this files directly, instead
#       a file in override should be created for setting the
#       values that is required for your site. Either create
#       a file called settings/override/cronjob.ini.append or
#       settings/override/cronjob.ini.append.php for more security
#       in non-virtualhost modes (the .php file may already be present
#       and can be used for this purpose).

[CronjobSettings]
ExtensionDirectories[]=sfnewslettertousergroup
ScriptDirectories[]=extension/sfnewslettertousergroup/cronjobs

[CronjobPart-sfnewslettertousergroup]
Scripts[]=sfnewslettertousergroup.php
*/
?>
