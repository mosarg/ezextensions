<?php /*

[General]
AllowedTypes[]
AllowedTypes[]=Calendario
AllowedTypes[]=OnlineUsers
AllowedTypes[]=LatestContent
AllowedTypes[]=Manual2Items
AllowedTypes[]=Manual3Items
AllowedTypes[]=GMap



[Calendario]
Name=Calendario
NumberOfValidItems=5
NumberOfArchivedItems=2
ManualAddingOfItems=enabled
ViewList[]=calendar_ajax
ViewName[calendar_ajax]=Calendario Ajax


[GMap]
Name=Google Map
ManualAddingOfItems=disabled
CustomAttributes[]
CustomAttributes[]=location
ViewList[]=gmap
ViewName[gmap]=Google Map





[Manual2Items]
Name=2 Elementi
NumberOfValidItems=2
NumberOfArchivedItems=5
ManualAddingOfItems=enabled
ViewList[]=2_items1
ViewName[2_items1]=Tema predefinito




[Manual3Items]
Name=3 Elementi
NumberOfValidItems=3
NumberOfArchivedItems=5
ManualAddingOfItems=enabled
ViewList[]=3_items1
ViewName[3_items1]=Tema predefinito



[OnlineUsers]
Name=Utenti On Line
ManualAddingOfItems=disabled
ViewList[]=onlineusers
ViewName[onlineusers]=Online Users

[LatestContent]
Name=Ultimi inserimenti
NumberOfValidItems=3
NumberOfArchivedItems=5
ManualAddingOfItems=disabled
FetchClass=eZFlowLatestContent
FetchParameters[Source]=NodeID
FetchParametersSelectionType[Source]=single
FetchParametersIsRequired[Source]=true
FetchParameters[Classes]=string
ViewList[]=latest_content
ViewName[latest_content]=Latest content



*/ ?>
