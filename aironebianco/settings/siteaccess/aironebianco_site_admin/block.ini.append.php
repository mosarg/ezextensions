<?php /*

[General]
AllowedTypes[]
AllowedTypes[]=Calendario
AllowedTypes[]=OnlineUsers
AllowedTypes[]=LatestContent
AllowedTypes[]=Manual2Items
AllowedTypes[]=Manual3Items
AllowedTypes[]=GMap
AllowedTypes[]=MainStory


[Calendario]
Name=Calendario
NumberOfValidItems=5
NumberOfArchivedItems=2
ManualAddingOfItems=enabled
ViewList[]
ViewList[]=calendar_ajax
ViewName[]
ViewName[calendar_ajax]=Calendario Ajax


[GMap]
Name=Google Map
ManualAddingOfItems=disabled
CustomAttributes[]
CustomAttributes[]=location
ViewList[]
ViewList[]=gmap
ViewName[]
ViewName[gmap]=Google Map

[Manual2Items]
Name=2 Elementi
NumberOfValidItems=2
NumberOfArchivedItems=5
ManualAddingOfItems=enabled
ViewList[]
ViewList[]=2_items1
ViewName[]
ViewName[2_items1]=Tema predefinito

[Manual3Items]
Name=3 Elementi
NumberOfValidItems=3
NumberOfArchivedItems=5
ManualAddingOfItems=enabled
ViewList[]
ViewList[]=3_items1
ViewName[]
ViewName[3_items1]=Tema predefinito

[OnlineUsers]
Name=Utenti On Line
ManualAddingOfItems=disabled
ViewList[]
ViewList[]=onlineusers
ViewName[]
ViewName[onlineusers]=Online Users

[LatestContent]
Name=Ultimi inserimenti
NumberOfValidItems=5
NumberOfArchivedItems=8
ManualAddingOfItems=disabled
FetchClass=eZFlowLatestContent
FetchParameters[Source]=NodeID
FetchParametersSelectionType[Source]=single
FetchParametersIsRequired[Source]=true
FetchParameters[Classes]=string
ViewList[]
ViewList[]=latest_content
ViewName[]
ViewName[latest_content]=Latest content

[MainStory]
Name=Notizia Principale
NumberOfValidItems=1
NumberOfArchivedItems=5
ManualAddingOfItems=enabled
ViewList[]
ViewList[]=main_story1
ViewList[]=main_story2
ViewName[]
ViewName[main_story1]=Solo Immagine
ViewName[main_story2]=Immagine e testo



*/ ?>
