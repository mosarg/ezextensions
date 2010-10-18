<?php /*

[General]
AllowedTypes[]
AllowedTypes[]=LeftCalendar
AllowedTypes[]=3Notizie
AllowedTypes[]=MainStory
AllowedTypes[]=Manual2Items
AllowedTypes[]=Manual3Items
AllowedTypes[]=Manual4Items
AllowedTypes[]=Manual5Items
AllowedTypes[]=Gallery
AllowedTypes[]=ItemList
AllowedTypes[]=TagCloud
AllowedTypes[]=Poll

[MainStory]
Name=Notizia principale
NumberOfValidItems=1
NumberOfArchivedItems=5
ManualAddingOfItems=enabled
ViewList[]=main_story1
ViewList[]=main_story2
ViewList[]=main_story3
ViewName[main_story1]=Notizia principale (1)
ViewName[main_story2]=Notizia principale (2)
ViewName[main_story3]=Notizia principale (3)

[Manual2Items]
Name=2 Elementi Manuale
NumberOfValidItems=2
NumberOfArchivedItems=5
ManualAddingOfItems=enabled
ViewList[]=2_items1
ViewList[]=2_items2
ViewName[2_items1]=2 Elementi (1)
ViewName[2_items2]=2 Elementi (2)


[Manual3Items]
Name=3 Elementi Manuale
NumberOfValidItems=3
NumberOfArchivedItems=5
ManualAddingOfItems=enabled
ViewList[]=3_items1
ViewList[]=3_items2
ViewList[]=3_risalto
ViewName[3_items1]=3 Elementi (1)
ViewName[3_items2]=3 Elementi (2)
ViewName[3_risalto]=3 Risalto

[Manual4Items]
Name=4 Elementi Manuale
NumberOfValidItems=4
NumberOfArchivedItems=5
ManualAddingOfItems=enabled
ViewList[]=4_items1
ViewList[]=4_items2
ViewList[]=4_items3
ViewName[4_items1]=4 Elementi (1)
ViewName[4_items2]=4 Elementi (2)
ViewName[4_items3]=4 Elementi Risalto


[Manual5Items]
Name=5 Elementi Manuale
NumberOfValidItems=5
NumberOfArchivedItems=5
ManualAddingOfItems=enabled
ViewList[]=5_items1
ViewList[]=5_items2
ViewName[5_items1]=5 Elementi (1)
ViewName[5_items2]=5 Elementi (2)

[Gallery]
Name=Galleria multimediale Manuale
NumberOfValidItems=4
NumberOfArchivedItems=5
ManualAddingOfItems=enabled
ViewList[]=gallery_standard
ViewList[]=gallery_2colonne
ViewName[gallery_standard]=Galleria 1 colonna
ViewName[gallery_2colonne]=Galleria 2 colonne

[ItemList]
Name=Lista elementi
NumberOfValidItems=12
NumberOfArchivedItems=5
ManualAddingOfItems=enabled
ViewList[]=itemlist1
ViewList[]=itemlist2
ViewList[]=itemlist3
ViewName[itemlist1]=Lista 1 colonna
ViewName[itemlist2]=Lista 2 colonne
ViewName[itemlist3]=Lista 3 colonne

[TagCloud]
Name=Nuvola etichette
ManualAddingOfItems=disabled
CustomAttributes[]=subtree_node_id
UseBrowseMode[subtree_node_id]=true
ViewList[]=tag_cloud
ViewName[tag_cloud]=Nuvola etichette

[Poll]
Name=Sondaggio
ManualAddingOfItems=disabled
CustomAttributes[]=poll_node_id
UseBrowseMode[poll_node_id]=true
ViewList[]=poll
ViewName[poll]=Sondaggio

[LeftCalendar]
Name=Calendario
NumberOfValidItems=3
NumberOfArchivedItems=4
ManualAddingOfItems=enabled
ViewList[]=calendar
ViewList[]=programma
ViewName[calendar]=Il calendario
ViewName[programma]=Programma eventi

[3Notizie]
Name=3 Notizie automatiche
NumberOfValidItems=3
NumberOfArchivedItems=5
ManualAddingOfItems=disabled
FetchClass=csspLatestNews
FetchFixedParameters[]
FetchFixedParameters[Class]=article
FetchParameters[]
FetchParameters[Source]=nodeID
# Single / Multiple
FetchParametersSelectionType[Source]=single
FetchParametersIsRequired[]
# True / False
FetchParametersIsRequired[Source]=true
ViewList[]=3notizie
ViewName[3notizie]=3 Notizie raccolte automaticamente

*/ ?>
