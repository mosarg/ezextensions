[SiteSettings]
DefaultAccess=ita
SiteList[]=m2000_site
SiteList[]=ita
SiteList[]=eng
SiteList[]=m2000_site_admin
SiteList[]=iphone
RootNodeDepth=1
SiteName=M2000
MetaDataArray[author]=Matteo Mosangini
MetaDataArray[copyright]=e-moka
MetaDataArray[description]=cms scolastico
MetaDataArray[keywords]=isis,cervignano,scuola,statale
IndexPage=/content/view/full/2/
DefaultPage=/content/view/full/2


[SiteAccessSettings]
CheckValidity=false
AvailableSiteAccessList[]=m2000_site
AvailableSiteAccessList[]=ita
AvailableSiteAccessList[]=eng
AvailableSiteAccessList[]=m2000_site_admin
AnonymousAccessList[]=ezjscore/run
AnonymousAccessList[]=ezjscore/call
MatchOrder=host
HostMatchType=map
HostMatchMapItems[]
HostMatchMapItems[]=ez.hell.pit;ita
HostMatchMapItems[]=www.isismalignani.it;ita
HostMatchMapItems[]=sandbox.isismalignani.it;ita
HostMatchMapItems[]=ezadmin.hell.pit;m2000_site_admin
HostMatchMapItems[]=eng.isismalignani.it;eng
HostMatchMapItems[]=webadmin.isismalignani.it;m2000_site_admin
HostMatchMapItems[]=boxadmin.isismalignani.it;m2000_site_admin
ForceVirtualHost=true

[EmbedViewModeSettings]
AvailableViewModes[]
AvailableViewModes[]=embed
AvailableViewModes[]=embed-inline
InlineViewModes[]
InlineViewModes[]=embed-inline


[MailSettings]
EmailSenderName=sigurd@isismalignani


[FileSettings]
VarDir=var/m2000


[RegionalSettings]
TranslationSA[ita]=Ita
TranslationSA[eng]=Eng
TranslationExtensions[]=m2000

[UserSettings]
ProfessorsDefClass=47
AlumniDefClass=78
AtaDefClass=79
ParentsDefClass=80
