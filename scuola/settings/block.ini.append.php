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

AllowedTypes[]=Poll

[PushToBlock]
ContentClasses[]=school_front
ContentClasses[]=m2000_front
RootSubtree=1


[MainStory]
Name=Notizia principale
NumberOfValidItems=1
NumberOfArchivedItems=5
ManualAddingOfItems=enabled
ViewList[]=main_story1
ViewList[]=main_story2
ViewList[]=main_story3
ViewName[main_story1]=Solo immagine
ViewName[main_story2]=Immagine (grande) e testo
ViewName[main_story3]=Notizia principale (3)

[Manual2Items]
Name=2 Elementi Manuale
NumberOfValidItems=2
NumberOfArchivedItems=5
ManualAddingOfItems=enabled
ViewList[]=2_items1
ViewList[]=2_items2
ViewName[2_items1]=2 Elementi Titolo
ViewName[2_items2]=2 Elementi Senza Titolo


[Manual3Items]
Name=3 Elementi Manuale
NumberOfValidItems=3
NumberOfArchivedItems=5
ManualAddingOfItems=enabled
ViewList[]=3_items1
ViewList[]=3_items2
ViewList[]=3_risalto
ViewName[3_items1]=  3 Elementi Titolo
ViewName[3_items2]=  3 Elementi Senza Titolo
ViewName[3_risalto]= 3 Elementi Non Omogenei

[Manual4Items]
Name=4 Elementi Manuale
NumberOfValidItems=4
NumberOfArchivedItems=5
ManualAddingOfItems=enabled
ViewList[]=4_items1
ViewList[]=4_items2
ViewList[]=4_items3
ViewName[4_items1]=4 Elementi 
ViewName[4_items2]=4 Elementi Grandi
ViewName[4_items3]=4 Elementi Schema


[Manual5Items]
Name=5 Elementi Manuale
NumberOfValidItems=5
NumberOfArchivedItems=5
ManualAddingOfItems=enabled
ViewList[]=5_items1
ViewList[]=5_items2
ViewName[5_items1]=5 Elementi con Titolo
ViewName[5_items2]=5 Elementi senza Titolo

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
ViewName[itemlist1]=Lista 1 colonna titolo
ViewName[itemlist2]=Lista 2 colonne titolo
ViewName[itemlist3]=Lista 2 colonne senza titolo


[Poll]
Name=Sondaggio
ManualAddingOfItems=disabled
CustomAttributes[]=poll_node_id
UseBrowseMode[poll_node_id]=true
ViewList[]=poll
ViewName[poll]=Sondaggio


[LeftCalendar]
Name=Calendario
NumberOfValidItems=5
NumberOfArchivedItems=2
ManualAddingOfItems=enabled
ViewList[]
ViewList[]=calendar_ajax
ViewList[]=program_ajax
ViewName[]
ViewName[calendar_ajax]=Calendario Ajax
ViewName[program_ajax]=Programma

[3Notizie]
Name=3 Elementi Automatici
NumberOfValidItems=3
NumberOfArchivedItems=5
ManualAddingOfItems=disabled
FetchClass=csspLatestNews
FetchFixedParameters[]
FetchFixedParameters[Class]=article
FetchFixedParameters[Class]=file
FetchParameters[]
FetchParameters[Source]=nodeID
# Single / Multiple
FetchParametersSelectionType[Source]=single
FetchParametersIsRequired[]
# True / False
FetchParametersIsRequired[Source]=true
ViewList[]=3notizie
ViewName[3notizie]=  3 Notizie con Data


*/ ?>
