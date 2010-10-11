<?php /*

[General]


AllowedTypes[]
AllowedTypes[]=Calendario
AllowedTypes[]=OnlineUsers
AllowedTypes[]=Manual2Items
AllowedTypes[]=Manual3Items
AllowedTypes[]=3Notizie
AllowedTypes[]=GMap
AllowedTypes[]=MainStory


[Calendario]
Name=Calendario
NumberOfValidItems=5
NumberOfArchivedItems=2
ManualAddingOfItems=enabled
VieList[]
ViewList[]=calendar
ViewList[]=calendar_ajax
ViewList[]=program_ajax
ViewName[]
ViewName[calendar]=Il calendario
ViewName[calendar_ajax]=Ajax calendario
ViewName[program_ajax]=Programma Ajax


[GMap]
Name=Google Map
ManualAddingOfItems=disabled
CustomAttributes[]
CustomAttributes[]=location
ViewList[]
ViewList[]=gmap
ViewName[]
ViewName[gmap]=Google Map


[3Notizie]
Name=3Notizie
NumberOfValidItems=3
NumberOfArchivedItems=5
ManualAddingOfItems=disabled
FetchClass=csspLatestNews
FetchFixedParameters[]
FetchFixedParameters[Class]=article;corso
FetchParameters[]
FetchParameters[Source]=nodeID
FetchParametersSelectionType[Source]=single
FetchParametersIsRequired[]
FetchParametersIsRequired[Source]=true
ViewList[]
ViewList[]=3notizie
ViewName[]
ViewName[3d_items]=3 Notize raccolte automaticamente


[Manual2Items]
Name=2 Elementi
NumberOfValidItems=2
NumberOfArchivedItems=5
ManualAddingOfItems=enabled
ViewList[]
ViewList[]=2_items1
ViewList[]=2_items2
ViewName[]
ViewName[2_items1]=Tema predefinito
ViewName[2_items2]=Vista speciale

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
