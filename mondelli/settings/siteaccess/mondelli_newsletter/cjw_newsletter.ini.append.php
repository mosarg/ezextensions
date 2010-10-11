<?php /* #?ini charset="utf-8"?
# dieses Dokument enthaelt alle Einstellungen fuer den Newsletter

[NewsletterSettings]

#NodeId des Containers der im Admin angezeigt werden soll
RootFolderNodeId=226

# which is the command to exex php cli scripts
PhpCli=/usr/bin/php

# array with all skin names located in design folder
# => design:newsletter/skin/ $skin_name

AvailableSkinArray[]
AvailableSkinArray[]=mondelli


[NewsletterMailSettings]

# smtp, sendmail, file

# newsletter
TransportMethodCronjob=sendmail

# test newsletter
TransportMethodPreview=sendmail

# subscribe, infomail
TransportMethodDirectly=sendmail

# where to store mails send by TransportMethod = file
FileTransportMailDir=var/log/mail

# http://ezcomponents.org/docs/api/latest/introduction_Mail.html#mta-qmail
# HeaderLineEnding
#    auto - try to find correct settings
#           default is LF
#    CRLF - windows - \r\n
#    CR   - mac - \r
#    LF   - UNIX-MACOSX - \n
HeaderLineEnding=auto

# Configuration for SMTP
SmtpTransportServer=
SmtpTransportPort=25
SmtpTransportUser=
SmtpTransportPassword=

# settings for mail send out by subscribe, unsubscribe
EmailSender=newsletter@mondellistable.it
EmailSenderName=Mondelli Stable Gestione Newsletter

# string the subject of all mails is starting with
EmailSubjectPrefix=[Newsletter mondellistable.it]

[BounceSettings]
# when we should nl user status to bounced?
BounceThresholdValue=3

[DebugSettings]
# Debug=enabled|disabled get more log output e.g. bounce parser
Debug=disabled

[NewsletterUserSettings]

# if disabled nl_user.name is created with default shema
# saluation first_name last_name
# if enabled the tpl design:newsletter/user/name.tpl will be used
UseTplForNameGeneration=disabled

# define which salutaions are available
# mapping of nl_user.salutation (int) to english string
# this string is used for i18n
# SalutationMappingArray[value_{$saluataionid}]={i18n english string}
# i18n( {i18n english string}, 'cjw_newsletter/user/salutation' )
SalutationMappingArray[value_1]=Sig
SalutationMappingArray[value_2]=Sig.ra
 *
 */?>