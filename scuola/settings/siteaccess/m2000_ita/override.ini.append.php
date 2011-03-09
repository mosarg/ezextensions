<?php /* #?ini charset="utf-8"?


[albo]
Source=node/view/full.tpl
MatchFile=full/albo.tpl
Subdir=templates
Match[class_identifier]=folder
Match[url_alias]=Albo

[albo-embed]
Source=node/view/embed.tpl
MatchFile=embed/dmsfolder.tpl
Subdir=templates
Match[class_identifier]=folder
Match[url_alias]=Albo



[progetti]
Source=node/view/full.tpl
MatchFile=full/progetti.tpl
Subdir=templates
Match[class_identifier]=macroarea
Match[url_alias]=Progetti


[media_folder]
Source=node/view/full.tpl
MatchFile=full/media/folder.tpl
Subdir=templates
Match[class_identifier]=folder
Match[navigation_part_identifier]=ezmedianavigationpart


[content_browse]
Source=content/browse.tpl
MatchFile=browse/browse.tpl
Subdir=templates
Match[class_identifier]=gallery

[edit_alunno]
Source=content/edit.tpl
MatchFile=edit/edit_alunno.tpl
Subdir=templates
Match[class_identifier]=alunno

[edit_form]
Source=content/edit.tpl
MatchFile=edit/edit_form.tpl
Subdir=templates
Match[class_identifier]=ecdl_skill_exam_form


[pagelayout_classi]
Source=pagelayout.tpl
MatchFile=pagelayout_classi.tpl
Subdir=templates
Match[section]=7

[pagelayout_alunni]
Source=pagelayout.tpl
MatchFile=pagelayout_classi.tpl
Subdir=templates
Match[section]=10

[pagelayout_docenti_personal]
Source=pagelayout.tpl
MatchFile=pagelayout_docenti.tpl
Subdir=templates
Match[section]=16

[edit_m2000_front]
Source=content/edit.tpl
MatchFile=edit/frontpage.tpl
Subdir=templates
Match[class_identifier]=m2000_front

[edit_school_front]
Source=content/edit.tpl
MatchFile=edit/frontpage.tpl
Subdir=templates
Match[class_identifier]=school_front

[edit_macroarea]
Source=content/edit.tpl
MatchFile=edit/frontpage.tpl
Subdir=templates
Match[class_identifier]=macroarea

[full_ecdl_skill_exam_form]
Source=node/view/full.tpl
MatchFile=full/ecdl_skill_exam_form.tpl
Subdir=templates
Match[class_identifier]=ecdl_skill_exam_form


[full_alunno]
Source=node/view/full.tpl
MatchFile=full/alunno.tpl
Subdir=templates
Match[class_identifier]=alunno

[full_laboratory]
Source=node/view/full.tpl
MatchFile=full/laboratory.tpl
Subdir=templates
Match[class_identifier]=laboratory

[full_course]
Source=node/view/full.tpl
MatchFile=full/course.tpl
Subdir=templates
Match[class_identifier]=course


[full_libro]
Source=node/view/full.tpl
MatchFile=full/libro.tpl
Subdir=templates
Match[class_identifier]=libro

[full_dipendenti]
Source=node/view/full.tpl
MatchFile=full/dipendenti.tpl
Subdir=templates
Match[class_identifier]=dipendenti

[full_contatti]
Source=node/view/full.tpl
MatchFile=full/contatti.tpl
Subdir=templates
Match[class_identifier]=contatti

[full_dir_circolari]
Source=node/view/full.tpl
MatchFile=full/dir_circolari.tpl
Subdir=templates
Match[class_identifier]=dir_circolari

[full_ufficio]
Source=node/view/full.tpl
MatchFile=full/ufficio.tpl
Subdir=templates
Match[class_identifier]=ufficio

[full_progetto]
Source=node/view/full.tpl
MatchFile=full/progetto.tpl
Subdir=templates
Match[class_identifier]=progetto

[full_folder_circolari]
Source=node/view/full.tpl
MatchFile=full/folder_circolari.tpl
Subdir=templates
Match[class_identifier]=folder_circolari

[full_m2000_front]
Source=node/view/full.tpl
MatchFile=full/frontpage_m2000.tpl
Subdir=templates
Match[class_identifier]=m2000_front


[full_macroarea]
Source=node/view/full.tpl
MatchFile=full/macroarea.tpl
Subdir=templates
Match[class_identifier]=macroarea

[full_school_front]
Source=node/view/full.tpl
MatchFile=full/frontpage_scuola.tpl
Subdir=templates
Match[class_identifier]=school_front

[full_course_org]
Source=node/view/full.tpl
MatchFile=full/course_org.tpl
Subdir=templates
Match[class_identifier]=course_org


[attribute_available_exams]
Source=content/datatype/view/sckenhancedselection.tpl
MatchFile=datatype/view/selection.tpl
Subdir=templates
Match[attribute_identifier]=available_exams

[attribute_exams_list_collect]
Source=content/datatype/collect/sckenhancedselection.tpl
MatchFile=datatype/collect/selection.tpl
Subdir=templates
Match[attribute_identifier]=exams_list

[attribute_checkbox_collect]
Source=content/datatype/collect/ezboolean.tpl
MatchFile=datatype/collect/checkbox.tpl
Subdir=templates


[attribute_string_collect]
Source=content/datatype/collect/ezstring.tpl
MatchFile=datatype/collect/string.tpl
Subdir=templates



[attribute_birth_date_collect]
Source=content/datatype/collect/ezbirthday.tpl
MatchFile=datatype/collect/birthday.tpl
Subdir=templates
Match[attribute_identifier]=birth_date

[attribute_color]
Source=content/datatype/edit/ezstring.tpl
MatchFile=datatype/edit/color_select.tpl
Subdir=templates
Match[attribute_identifier]=color

[attribute_gallery_image_select]
Source=content/datatype/edit/ezobjectrelationlist.tpl
MatchFile=datatype/edit/gallery_image_select.tpl
Subdir=templates
Match[attribute_identifier]=gallery_image

[attribute_materie]
Source=content/datatype/view/sckenhancedselection.tpl
MatchFile=datatype/view/selezione_materie.tpl
Subdir=templates
Match[attribute_identifier]=materie

[attribute_coordinatore]
Source=content/datatype/view/ezobjectrelationlist.tpl
MatchFile=datatype/view/multirelation.tpl
Subdir=templates
Match[attribute_identifier]=coordinatore

[attribute_link]
Source=content/datatype/view/ezobjectrelationbrowse.tpl
MatchFile=datatype/view/multirelationbrowse.tpl
Subdir=templates
Match[attribute_identifier]=link

[attribute_contatti]
Source=content/datatype/view/ezmatrix.tpl
MatchFile=embed/matrix_slim.tpl
Subdir=templates
Match[attribute_identifier]=contatti


[block_calendar_tabella]
Source=block/view/view.tpl
MatchFile=block/calendar_ajax.tpl
Subdir=templates
Match[type]=LeftCalendar
Match[view]=calendar_ajax

[block_calendar_programma]
Source=block/view/view.tpl
MatchFile=block/program_ajax.tpl
Subdir=templates
Match[type]=LeftCalendar
Match[view]=program_ajax




[block_3notizie]
Source=block/view/view.tpl
MatchFile=block/3notizie.tpl
Subdir=templates
Match[type]=3Notizie
Match[view]=3notizie

[block_3notizie1]
Source=block/view/view.tpl
MatchFile=block/3_items1.tpl
Subdir=templates
Match[type]=3Notizie
Match[view]=3_items1

[block_3notizie2]
Source=block/view/view.tpl
MatchFile=block/3_items2.tpl
Subdir=templates
Match[type]=3Notizie
Match[view]=3_items2

[block_3notizie3]
Source=block/view/view.tpl
MatchFile=block/3_risalto.tpl
Subdir=templates
Match[type]=3Notizie
Match[view]=3_risalto


[edit_selezione_scuole]
Source=content/datatype/edit/sckenhancedselection.tpl
MatchFile=datatype/edit/selezione_materie.tpl
Subdir=templates
Match[attribute_identifier]=materie

[edit_coordinatore]
Source=content/datatype/edit/ezobjectrelationlist.tpl
MatchFile=datatype/edit/multirelationlist.tpl
Subdir=templates
Match[attribute_identifier]=coordinatore


[edit_prof_timetable]
Source=content/datatype/edit/ezmatrix.tpl
MatchFile=datatype/edit/prof_timetable.tpl
Subdir=templates
Match[attribute_identifier]=orario

[edit_form_rules]
Source=content/datatype/edit/ezmatrix.tpl
MatchFile=datatype/edit/rules.tpl
Subdir=templates
Match[attribute_identifier]=filling_rules

[view_form_rules]
Source=content/datatype/view/ezmatrix.tpl
MatchFile=datatype/view/rules.tpl
Subdir=templates
Match[attribute_identifier]=filling_rules


[edit_matricealunni]
Source=content/datatype/edit/ezmatrix.tpl
MatchFile=datatype/edit/matricealunni.tpl
Subdir=templates
Match[attribute_identifier]=matricealunni


[edit_prof_classes]
Source=content/datatype/edit/ezobjectrelationbrowse.tpl
MatchFile=datatype/edit/prof_teach_classes.tpl
Subdir=templates
Match[attribute_identifier]=teachwhere

[full_classe]
Source=node/view/full.tpl
MatchFile=full/classe.tpl
Subdir=templates
Match[class_identifier]=classe

[full_forum_reply]
Source=node/view/full.tpl
MatchFile=full/m2forum_reply.tpl
Subdir=templates
Match[class_identifier]=forum_reply

[personal_prof_folder]
Source=node/view/full.tpl
MatchFile=full/prof_personal_folder.tpl
Subdir=templates
Match[class_identifier]=proffolder

[prof_helper_class]
Source=node/view/full.tpl
MatchFile=full/helper_prof.tpl
Subdir=templates
Match[class_identifier]=infoprof

[prof_info_element]
Source=node/view/full.tpl
MatchFile=full/helper_prof.tpl
Subdir=templates
Match[class_identifier]=infoprof
    
[prof_timetable]
Source=content/datatype/view/ezmatrix.tpl
MatchFile=embed/timetable.tpl
Subdir=templates
Match[attribute_identifier]=orario

[profgroup]
Source=node/view/full.tpl
MatchFile=full/profgroup.tpl
Subdir=templates
Match[class_identifier]=profgroup

[classgroup]
Source=node/view/full.tpl
MatchFile=full/classgroup.tpl
Subdir=templates
Match[class_identifier]=classgroup

[school_attribute_edit]
Source=content/datatype/edit/sckenhancedselection.tpl
MatchFile=datatype/edit/schoolselect.tpl
Subdir=templates
Match[attribute_identifier]=school

[user_professore]
Source=node/view/full.tpl
MatchFile=full/professore.tpl
Subdir=templates
Match[class_identifier]=professore

[block_2_items1]
Source=block/view/view.tpl
MatchFile=block/2_items1.tpl
Subdir=templates
Match[type]=Manual2Items
Match[view]=2_items1

[block_2_items2]
Source=block/view/view.tpl
MatchFile=block/2_items2.tpl
Subdir=templates
Match[type]=Manual2Items
Match[view]=2_items2

[block_main_story1]
Source=block/view/view.tpl
MatchFile=block/main_story1.tpl
Subdir=templates
Match[type]=MainStory
Match[view]=main_story1

[block_main_story2]
Source=block/view/view.tpl
MatchFile=block/main_story2.tpl
Subdir=templates
Match[type]=MainStory
Match[view]=main_story2

[block_main_story3]
Source=block/view/view.tpl
MatchFile=block/main_story3.tpl
Subdir=templates
Match[type]=MainStory
Match[view]=main_story3

[block_3_items1]
Source=block/view/view.tpl
MatchFile=block/3_items1.tpl
Subdir=templates
Match[type]=Manual3Items
Match[view]=3_items1

[block_3_items2]
Source=block/view/view.tpl
MatchFile=block/3_items2.tpl
Subdir=templates
Match[type]=Manual3Items
Match[view]=3_items2

[block_3_risalto]
Source=block/view/view.tpl
MatchFile=block/3_risalto.tpl
Subdir=templates
Match[type]=Manual3Items
Match[view]=3_risalto

[block_4_items1]
Source=block/view/view.tpl
MatchFile=block/4_items1.tpl
Subdir=templates
Match[type]=Manual4Items
Match[view]=4_items1

[block_4_items2]
Source=block/view/view.tpl
MatchFile=block/4_items2.tpl
Subdir=templates
Match[type]=Manual4Items
Match[view]=4_items2

[block_4_items3]
Source=block/view/view.tpl
MatchFile=block/4_items3.tpl
Subdir=templates
Match[type]=Manual4Items
Match[view]=4_items3

[block_5_items1]
Source=block/view/view.tpl
MatchFile=block/5_items1.tpl
Subdir=templates
Match[type]=Manual5Items
Match[view]=5_items1


[block_gallery1]
Source=block/view/view.tpl
MatchFile=block/gallery_standard.tpl
Subdir=templates
Match[type]=Gallery
Match[view]=gallery_standard

[block_gallery_2colonne]
Source=block/view/view.tpl
MatchFile=block/gallery_2colonne.tpl
Subdir=templates
Match[type]=Gallery
Match[view]=gallery_2colonne

[block_itemlist1]
Source=block/view/view.tpl
MatchFile=block/itemlist1.tpl
Subdir=templates
Match[type]=ItemList
Match[view]=itemlist1

[block_itemlist2]
Source=block/view/view.tpl
MatchFile=block/itemlist2.tpl
Subdir=templates
Match[type]=ItemList
Match[view]=itemlist2

[block_itemlist3]
Source=block/view/view.tpl
MatchFile=block/itemlist3.tpl
Subdir=templates
Match[type]=ItemList
Match[view]=itemlist3


[block_poll]
Source=block/view/view.tpl
MatchFile=block/poll.tpl
Subdir=templates
Match[type]=Poll
Match[view]=poll

[block_flash_recorder]
Source=block/view/view.tpl
MatchFile=block/flash_recorder.tpl
Subdir=templates
Match[type]=FlashRecorder
Match[view]=flash_recorder


[block_item_link]
Source=node/view/block_item.tpl
MatchFile=block_item/link.tpl
Subdir=templates
Match[class_identifier]=link


[block_item_survey]
Source=node/view/block_item.tpl
MatchFile=block_item/survey.tpl
Subdir=templates
Match[class_identifier]=survey


[block_item_progetto]
Source=node/view/block_item.tpl
MatchFile=block_item/progetto.tpl
Subdir=templates
Match[class_identifier]=progetto

[block_item_folder]
Source=node/view/block_item.tpl
MatchFile=block_item/folder.tpl
Subdir=templates
Match[class_identifier]=folder

[block_item_file]
Source=node/view/block_item.tpl
MatchFile=block_item/file.tpl
Subdir=templates
Match[class_identifier]=file


[block_item_article]
Source=node/view/block_item.tpl
MatchFile=block_item/article.tpl
Subdir=templates
Match[class_identifier]=article


[block_item_article_mainpage]
Source=node/view/block_item.tpl
MatchFile=block_item/article_mainpage.tpl
Subdir=templates
Match[class_identifier]=article_mainpage


[block_item_article_subpage]
Source=node/view/block_item.tpl
MatchFile=block_item/article.tpl
Subdir=templates
Match[class_identifier]=article_subpage


[block_item_flash_player]
Source=node/view/block_item.tpl
MatchFile=block_item/flash_player.tpl
Subdir=templates
Match[class_identifier]=flash_player

[block_item_image]
Source=node/view/block_item.tpl
MatchFile=block_item/image.tpl
Subdir=templates
Match[class_identifier]=image

[block_item_gallery]
Source=node/view/block_item.tpl
MatchFile=block_item/gallery.tpl
Subdir=templates
Match[class_identifier]=gallery

[block_item_contatti]
Source=node/view/block_item.tpl
MatchFile=block_item/contatti.tpl
Subdir=templates
Match[class_identifier]=contatti

[full_article]
Source=node/view/full.tpl
MatchFile=full/article.tpl
Subdir=templates
Match[class_identifier]=article

[full_article_mainpage]
Source=node/view/full.tpl
MatchFile=full/article_mainpage.tpl
Subdir=templates
Match[class_identifier]=article_mainpage

[full_article_subpage]
Source=node/view/full.tpl
MatchFile=full/article_subpage.tpl
Subdir=templates
Match[class_identifier]=article_subpage



[full_blog]
Source=node/view/full.tpl
MatchFile=full/blog.tpl
Subdir=templates
Match[class_identifier]=blog

[full_blog_post]
Source=node/view/full.tpl
MatchFile=full/blog_post.tpl
Subdir=templates
Match[class_identifier]=blog_post

[full_comment]
Source=node/view/full.tpl
MatchFile=full/comment.tpl
Subdir=templates
Match[class_identifier]=comment



[full_event_calendar]
Source=node/view/full.tpl
MatchFile=full/event_calendar.tpl
Subdir=templates
Match[class_identifier]=event_calendar

[full_event]
Source=node/view/full.tpl
MatchFile=full/event.tpl
Subdir=templates
Match[class_identifier]=event

[full_feedback_form]
Source=node/view/full.tpl
MatchFile=full/feedback_form.tpl
Subdir=templates
Match[class_identifier]=feedback_form

[full_file]
Source=node/view/full.tpl
MatchFile=full/file.tpl
Subdir=templates
Match[class_identifier]=file

[full_flash]
Source=node/view/full.tpl
MatchFile=full/flash.tpl
Subdir=templates
Match[class_identifier]=flash

[full_flash_player]
Source=node/view/full.tpl
MatchFile=full/flash_player.tpl
Subdir=templates
Match[class_identifier]=flash_player


[full_dmsfolder]
Source=node/view/full.tpl
MatchFile=full/dmsfolder.tpl
Subdir=templates
Match[class_identifier]=dmsfolder



[full_folder]
Source=node/view/full.tpl
MatchFile=full/folder.tpl
Subdir=templates
Match[class_identifier]=folder

[full_forum]
Source=node/view/full.tpl
MatchFile=full/forum.tpl
Subdir=templates
Match[class_identifier]=forum

[full_forum_reply]
Source=node/view/full.tpl
MatchFile=full/forum_reply.tpl
Subdir=templates
Match[class_identifier]=forum_reply

[full_forum_topic]
Source=node/view/full.tpl
MatchFile=full/forum_topic.tpl
Subdir=templates
Match[class_identifier]=forum_topic

[full_forums]
Source=node/view/full.tpl
MatchFile=full/forums.tpl
Subdir=templates
Match[class_identifier]=forums

[full_frontpage]
Source=node/view/full.tpl
MatchFile=full/frontpage.tpl
Subdir=templates
Match[class_identifier]=frontpage

[full_gallery]
Source=node/view/full.tpl
MatchFile=full/gallery.tpl
Subdir=templates
Match[class_identifier]=gallery

[full_image]
Source=node/view/full.tpl
MatchFile=full/image.tpl
Subdir=templates
Match[class_identifier]=image

[full_infobox]
Source=node/view/full.tpl
MatchFile=full/infobox.tpl
Subdir=templates
Match[class_identifier]=infobox

[full_link]
Source=node/view/full.tpl
MatchFile=full/link.tpl
Subdir=templates
Match[class_identifier]=link

[full_multicalendar]
Source=node/view/full.tpl
MatchFile=full/multicalendar.tpl
Subdir=templates
Match[class_identifier]=multicalendar

[full_poll]
Source=node/view/full.tpl
MatchFile=full/poll.tpl
Subdir=templates
Match[class_identifier]=poll

[line_macroarea]
Source=node/view/line.tpl
MatchFile=line/macroarea.tpl
Subdir=templates
Match[class_identifier]=macroarea



[line_laboratory]
Source=node/view/line.tpl
MatchFile=line/laboratory.tpl
Subdir=templates
Match[class_identifier]=laboratory

[line_course]
Source=node/view/line.tpl
MatchFile=line/course.tpl
Subdir=templates
Match[class_identifier]=course

[line_course_org]
Source=node/view/line.tpl
MatchFile=line/course_org.tpl
Subdir=templates
Match[class_identifier]=course_org


[line_proffolder]
Source=node/view/line.tpl
MatchFile=line/line_proffolder.tpl
Subdir=templates
Match[class_identifier]=proffolder

[line_survey]
Source=node/view/line.tpl
MatchFile=line/line_survey.tpl
Subdir=templates
Match[class_identifier]=survey


[line_dmsfolder]
Source=node/view/line.tpl
MatchFile=line/line_dmsfolder.tpl
Subdir=templates
Match[class_identifier]=dmsfolder

[line_gallery]
Source=node/view/line.tpl
MatchFile=line/line_gallery.tpl
Subdir=templates
Match[class_identifier]=gallery



[line_dipendenti]
Source=node/view/line.tpl
MatchFile=line/line_dipendenti.tpl
Subdir=templates
Match[class_identifier]=dipendenti

[line_classe]
Source=node/view/line.tpl
MatchFile=line/line_classe.tpl
Subdir=templates
Match[class_identifier]=classe


[line_progetto]
Source=node/view/line.tpl
MatchFile=line/line_progetto.tpl
Subdir=templates
Match[class_identifier]=progetto


[line_libro]
Source=node/view/line.tpl
MatchFile=line/line_libro.tpl
Subdir=templates
Match[class_identifier]=libro

[line_ufficio]
Source=node/view/line.tpl
MatchFile=line/line_ufficio.tpl
Subdir=templates
Match[class_identifier]=ufficio

[line_article]
Source=node/view/line.tpl
MatchFile=line/article.tpl
Subdir=templates
Match[class_identifier]=article

[line_article_mainpage]
Source=node/view/line.tpl
MatchFile=line/article_mainpage.tpl
Subdir=templates
Match[class_identifier]=article_mainpage

[line_article_subpage]
Source=node/view/line.tpl
MatchFile=line/article_subpage.tpl
Subdir=templates
Match[class_identifier]=article_subpage



[line_blog]
Source=node/view/line.tpl
MatchFile=line/line_blog.tpl
Subdir=templates
Match[class_identifier]=blog

[line_blog_post]
Source=node/view/line.tpl
MatchFile=line/blog_post.tpl
Subdir=templates
Match[class_identifier]=blog_post

[line_comment]
Source=node/view/line.tpl
MatchFile=line/comment.tpl
Subdir=templates
Match[class_identifier]=comment


[line_event_calendar]
Source=node/view/line.tpl
MatchFile=line/line_event_calendar.tpl
Subdir=templates
Match[class_identifier]=event_calendar

[line_event]
Source=node/view/line.tpl
MatchFile=line/event.tpl
Subdir=templates
Match[class_identifier]=event

[line_feedback_form]
Source=node/view/line.tpl
MatchFile=line/feedback_form.tpl
Subdir=templates
Match[class_identifier]=feedback_form

[line_file]
Source=node/view/line.tpl
MatchFile=line/file.tpl
Subdir=templates
Match[class_identifier]=file

[line_flash]
Source=node/view/line.tpl
MatchFile=line/flash.tpl
Subdir=templates
Match[class_identifier]=flash


[line_media_folder]
Source=node/view/line.tpl
MatchFile=line/media/folder.tpl
Subdir=templates
Match[class_identifier]=folder
Match[navigation_part_identifier]=ezmedianavigationpart

[line_folder]
Source=node/view/line.tpl
MatchFile=line/folder.tpl
Subdir=templates
Match[class_identifier]=folder




[line_forum]
Source=node/view/line.tpl
MatchFile=line/forum.tpl
Subdir=templates
Match[class_identifier]=forum

[line_forum_reply]
Source=node/view/line.tpl
MatchFile=line/forum_reply.tpl
Subdir=templates
Match[class_identifier]=forum_reply

[line_forum_topic]
Source=node/view/line.tpl
MatchFile=line/forum_topic.tpl
Subdir=templates
Match[class_identifier]=forum_topic

[line_forums]
Source=node/view/line.tpl
MatchFile=line/forums.tpl
Subdir=templates
Match[class_identifier]=forums

[line_image]
Source=node/view/line.tpl
MatchFile=line/image.tpl
Subdir=templates
Match[class_identifier]=image

[line_infobox]
Source=node/view/line.tpl
MatchFile=line/infobox.tpl
Subdir=templates
Match[class_identifier]=infobox

[line_link]
Source=node/view/line.tpl
MatchFile=line/link.tpl
Subdir=templates
Match[class_identifier]=link

[line_multicalendar]
Source=node/view/line.tpl
MatchFile=line/multicalendar.tpl
Subdir=templates
Match[class_identifier]=multicalendar

[line_poll]
Source=node/view/line.tpl
MatchFile=line/poll.tpl
Subdir=templates
Match[class_identifier]=poll




[edit_comment]
Source=content/edit.tpl
MatchFile=edit/comment.tpl
Subdir=templates
Match[class_identifier]=comment

[edit_file]
Source=content/edit.tpl
MatchFile=edit/file.tpl
Subdir=templates
Match[class_identifier]=file

[edit_forum_topic]
Source=content/edit.tpl
MatchFile=edit/forum_topic.tpl
Subdir=templates
Match[class_identifier]=forum_topic

[edit_ezsubtreesubscription_forum_topic]
Source=content/datatype/edit/ezsubtreesubscription.tpl
MatchFile=datatype/edit/ezsubtreesubscription/forum_topic.tpl
Subdir=templates
Match[class_identifier]=forum_topic

[edit_forum_reply]
Source=content/edit.tpl
MatchFile=edit/forum_reply.tpl
Subdir=templates
Match[class_identifier]=forum_reply

[edit_frontpage]
Source=content/edit.tpl
MatchFile=edit/frontpage.tpl
Subdir=templates
Match[class_identifier]=frontpage

[highlighted_object]
Source=content/view/embed.tpl
MatchFile=embed/highlighted_object.tpl
Subdir=templates
Match[classification]=highlighted_object

[embed_article]
Source=content/view/embed.tpl
MatchFile=embed/article.tpl
Subdir=templates
Match[class_identifier]=article

[embed_file]
Source=content/view/embed.tpl
MatchFile=embed/file.tpl
Subdir=templates
Match[class_identifier]=file

[embed_dmsfolder]
Source=node/view/embed.tpl
MatchFile=embed/dmsfolder.tpl
Subdir=templates
Match[class_identifier]=dmsfolder


[embed_folder_circolari]
Source=node/view/embed.tpl
MatchFile=embed/folder_circolari.tpl
Subdir=templates
Match[class_identifier]=folder_circolari


[embed_dir_circolari]
Source=node/view/embed.tpl
MatchFile=embed/folder_circolari.tpl
Subdir=templates
Match[class_identifier]=dir_circolari



[embed_flash]
Source=content/view/embed.tpl
MatchFile=embed/flash.tpl
Subdir=templates
Match[class_identifier]=flash

[itemized_sub_items]
Source=content/view/embed.tpl
MatchFile=embed/itemized_sub_items.tpl
Subdir=templates
Match[classification]=itemized_sub_items

[vertically_listed_sub_items]
Source=content/view/embed.tpl
MatchFile=embed/vertically_listed_sub_items.tpl
Subdir=templates
Match[classification]=vertically_listed_sub_items

[horizontally_listed_sub_items]
Source=content/view/embed.tpl
MatchFile=embed/horizontally_listed_sub_items.tpl
Subdir=templates
Match[classification]=horizontally_listed_sub_items

[itemized_subtree_items]
Source=content/view/embed.tpl
MatchFile=embed/itemized_subtree_items.tpl
Subdir=templates
Match[classification]=itemized_subtree_items

[embed_folder]
Source=content/view/embed.tpl
MatchFile=embed/folder.tpl
Subdir=templates
Match[class_identifier]=folder

[embed_forum]
Source=content/view/embed.tpl
MatchFile=embed/forum.tpl
Subdir=templates
Match[class_identifier]=forum

[embed_gallery]
Source=content/view/embed.tpl
MatchFile=embed/gallery.tpl
Subdir=templates
Match[class_identifier]=gallery

[embed_image]
Source=content/view/embed.tpl
MatchFile=embed/image.tpl
Subdir=templates
Match[class_identifier]=image

[embed_poll]
Source=content/view/embed.tpl
MatchFile=embed/poll.tpl
Subdir=templates
Match[class_identifier]=poll


[embed_inline_image]
Source=content/view/embed-inline.tpl
MatchFile=embed-inline/image.tpl
Subdir=templates
Match[class_identifier]=image

[embed_itemizedsubitems_gallery]
Source=content/view/itemizedsubitems.tpl
MatchFile=itemizedsubitems/gallery.tpl
Subdir=templates
Match[class_identifier]=gallery

[embed_itemizedsubitems_forum]
Source=content/view/itemizedsubitems.tpl
MatchFile=itemizedsubitems/forum.tpl
Subdir=templates
Match[class_identifier]=forum

[embed_itemizedsubitems_folder]
Source=content/view/itemizedsubitems.tpl
MatchFile=itemizedsubitems/folder.tpl
Subdir=templates
Match[class_identifier]=folder

[embed_itemizedsubitems_event_calendar]
Source=content/view/itemizedsubitems.tpl
MatchFile=itemizedsubitems/event_calendar.tpl
Subdir=templates
Match[class_identifier]=event_calendar



[embed_itemizedsubitems_itemized_sub_items]
Source=content/view/itemizedsubitems.tpl
MatchFile=itemizedsubitems/itemized_sub_items.tpl
Subdir=templates

[embed_event_calendar]
Source=content/view/embed.tpl
MatchFile=embed/event_calendar.tpl
Subdir=templates
Match[class_identifier]=event_calendar

[embed_horizontallylistedsubitems_article]
Source=node/view/horizontallylistedsubitems.tpl
MatchFile=horizontallylistedsubitems/article.tpl
Subdir=templates
Match[class_identifier]=article

[embed_horizontallylistedsubitems_event]
Source=node/view/horizontallylistedsubitems.tpl
MatchFile=horizontallylistedsubitems/event.tpl
Subdir=templates
Match[class_identifier]=event

[embed_horizontallylistedsubitems_image]
Source=node/view/horizontallylistedsubitems.tpl
MatchFile=horizontallylistedsubitems/image.tpl
Subdir=templates
Match[class_identifier]=image



[factbox]
Source=content/datatype/view/ezxmltags/factbox.tpl
MatchFile=datatype/ezxmltext/factbox.tpl
Subdir=templates

[quote]
Source=content/datatype/view/ezxmltags/quote.tpl
MatchFile=datatype/ezxmltext/quote.tpl
Subdir=templates

[table_cols]
Source=content/datatype/view/ezxmltags/table.tpl
MatchFile=datatype/ezxmltext/table_cols.tpl
Subdir=templates
Match[classification]=cols

[table_comparison]
Source=content/datatype/view/ezxmltags/table.tpl
MatchFile=datatype/ezxmltext/table_comparison.tpl
Subdir=templates
Match[classification]=comparison

[image_galleryline]
Source=node/view/galleryline.tpl
MatchFile=galleryline/image.tpl
Subdir=templates
Match[class_identifier]=image

[flash_galleryline]
Source=node/view/galleryline.tpl
MatchFile=galleryline/flash_player.tpl
Subdir=templates
Match[class_identifier]=flash_player

[image_galleryslide]
Source=node/view/galleryslide.tpl
MatchFile=galleryslide/image.tpl
Subdir=templates
Match[class_identifier]=image

[article_listitem]
Source=node/view/listitem.tpl
MatchFile=listitem/article.tpl
Subdir=templates
Match[class_identifier]=article

[image_listitem]
Source=node/view/listitem.tpl
MatchFile=listitem/image.tpl
Subdir=templates
Match[class_identifier]=image


[billboard_flash]
Source=content/view/billboard.tpl
MatchFile=billboard/flash.tpl
Subdir=templates
Match[class_identifier]=flash

[tiny_image]
Source=content/view/tiny.tpl
MatchFile=tiny_image.tpl
Subdir=templates
Match[class_identifier]=image
*/ ?>