<?php /* #?ini charset="utf-8"?
[full_provincia_map]
Source=node/view/full.tpl
MatchFile=full/provincia_map.tpl
Subdir=templates
Match[class_identifier]=folder
Match[url_alias]=Area-tecnica/Interventi

  
[full_flussi]
Source=node/view/full.tpl
MatchFile=full/flussi.tpl
Subdir=templates
Match[class_identifier]=folder
Match[url_alias]=Scuole/Flussi



[user_embed]
Source=content/view/embed.tpl
MatchFile=embed/user.tpl
Subdir=templates
Match[class_identifier]=user


[edit_state_ticket] 
Source=content/datatype/edit/ezselection.tpl
MatchFile=content/datatype/edit/state.tpl
Subdir=templates
Match[attribute_identifier]=state
#Match[class_identifier]=ticket

[edit_assigned_ticket] 
Source=content/datatype/edit/ezobjectrelation.tpl
MatchFile=content/datatype/edit/assigned.tpl
Subdir=templates
Match[attribute_identifier]=assigned
#Match[class_identifier]=ticket

[ticket]
Source=node/view/full.tpl
MatchFile=full/ticket.tpl
Subdir=templates
Match[class_identifier]=ticket





[edit_ticket_comment]
Source=content/edit.tpl
MatchFile=edit/edit_comment.tpl
Subdir=templates
Match[class_identifier]=ticket_comment

[ticket_list]
Source=node/view/full.tpl
MatchFile=full/ticketsystem.tpl
Subdir=templates
Match[class_identifier]=ticketsystem

[assigned_to]
Source=content/datatype/view/ezobjectrelation.tpl
MatchFile=content/datatype/view/assigned.tpl
Subdir=templates
Match[attribute_identifier]=assigned


[notification_ticket]
Source=notification/handler/ezsubtree/view/plain.tpl
MatchFile=notification/handler/ezsubtree/view/ticket.tpl
Subdir=templates
Match[class_identifier]=ticket

[notification_ticket_comment]
Source=notification/handler/ezsubtree/view/plain.tpl
MatchFile=notification/handler/ezsubtree/view/ticket_comment.tpl
Subdir=templates
Match[class_identifier]=ticket_comment


[attribute_color]
Source=content/datatype/edit/ezstring.tpl
MatchFile=datatype/edit/color_select.tpl
Subdir=templates
Match[attribute_identifier]=color

[full_filter_scuole]
Source=node/view/full.tpl
MatchFile=full/filter_scuole.tpl
Subdir=templates
Match[node]=808


[full_presentazione]
Source=node/view/full.tpl
MatchFile=full/presentazione.tpl
Subdir=templates
Match[class_identifier]=presentazione



[full_net]
Source=node/view/full.tpl
MatchFile=full/net.tpl
Subdir=templates
Match[class_identifier]=net

[full_polo_territoriale]
Source=node/view/full.tpl
MatchFile=full/polo_territoriale.tpl
Subdir=templates
Match[class_identifier]=polo_territoriale


[full_scuola]
Source=node/view/full.tpl
MatchFile=full/scuola.tpl
Subdir=templates
Match[class_identifier]=scuola

[full_inventary]
Source=node/view/full.tpl
MatchFile=full/inventary.tpl
Subdir=templates
Match[class_identifier]=inventary

[full_inv_item]
Source=node/view/full.tpl
MatchFile=full/inv_item.tpl
Subdir=templates
Match[class_identifier]=inv_item



[full_cont_scuole]
Source=node/view/full.tpl
MatchFile=full/scatola_scuole.tpl
Subdir=templates
Match[class_identifier]=scatola_scuole

[full_corso_page]
Source=node/view/full.tpl
MatchFile=full/corso.tpl
Subdir=templates
Match[class_identifier]=corso

[full_building]
Source=node/view/full.tpl
MatchFile=full/building.tpl
Subdir=templates
Match[class_identifier]=building


[full_school_front]
Source=node/view/full.tpl
MatchFile=full/school_front.tpl
Subdir=templates
Match[class_identifier]=school_front


[full_frontpage_corsi]
Source=node/view/full.tpl
MatchFile=full/frontpage.tpl
Subdir=templates
Match[class_identifier]=frontpage_corsi

[full_folder_corsi]
Source=node/view/full.tpl
MatchFile=full/folder_corsi.tpl
Subdir=templates
Match[class_identifier]=folder_corsi


[block_calendar]
Source=block/view/view.tpl
MatchFile=block/calendar.tpl
Subdir=templates
Match[type]=Calendario
Match[view]=calendar

[block_calendar_ajax]
Source=block/view/view.tpl
MatchFile=block/calendar_ajax.tpl
Subdir=templates
Match[type]=Calendario
Match[view]=calendar_ajax


[block_program_ajax]
Source=block/view/view.tpl
MatchFile=block/program_ajax.tpl
Subdir=templates
Match[type]=Calendario
Match[view]=program_ajax

[block_3notizie]
Source=block/view/view.tpl
MatchFile=block/3notizie.tpl
Subdir=templates
Match[type]=3Notizie
Match[view]=3notizie


[full_filter_folder]
Source=node/view/full.tpl
MatchFile=full/filter.tpl
Subdir=templates
Match[node]=146

[edit_prof_timetable]
Source=content/datatype/edit/ezmatrix.tpl
MatchFile=edit/prof_timetable.tpl
Subdir=templates
Match[attribute_identifier]=orario

[edit_prof_classes]
Source=content/datatype/edit/ezobjectrelationbrowse.tpl
MatchFile=edit/prof_teach_classes.tpl
Subdir=templates
Match[attribute_identifier]=teachwhere


[view_partecipanti]
Source=content/datatype/view/ezobjectrelationbrowse.tpl
MatchFile=view/partecipanti.tpl
Subdir=templates
Match[attribute_identifier]=partecipanti




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

[profUser]
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
MatchFile=edit/schoolselect.tpl
Subdir=templates
Match[attribute_identifier]=school

[user_professore]
Source=node/view/full.tpl
MatchFile=full/professore.tpl
Subdir=templates
Match[class_identifier]=professore
*/ ?><?php /* #?ini charset="utf-8"?

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

[block_3_items3]
Source=block/view/view.tpl
MatchFile=block/3_items3.tpl
Subdir=templates
Match[type]=Manual3Items
Match[view]=3_items3

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

[dynamic_3_items1]
Source=block/view/view.tpl
MatchFile=block/dynamic_3_items1.tpl
Subdir=templates
Match[type]=Dynamic3Items
Match[view]=3_items1

[block_gallery1]
Source=block/view/view.tpl
MatchFile=block/gallery1.tpl
Subdir=templates
Match[type]=Gallery
Match[view]=gallery1

[block_video]
Source=block/view/view.tpl
MatchFile=block/video.tpl
Subdir=templates
Match[type]=Video
Match[view]=video

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

[block_banner1]
Source=block/view/view.tpl
MatchFile=block/banner1.tpl
Subdir=templates
Match[type]=Banner
Match[view]=banner1

[block_banner2]
Source=block/view/view.tpl
MatchFile=block/banner2.tpl
Subdir=templates
Match[type]=Banner
Match[view]=banner2

[block_tag_cloud]
Source=block/view/view.tpl
MatchFile=block/tag_cloud.tpl
Subdir=templates
Match[type]=TagCloud
Match[view]=tag_cloud

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

[block_item_article]
Source=node/view/block_item.tpl
MatchFile=block_item/article.tpl
Subdir=templates
Match[class_identifier]=article


[block_item_inventary]
Source=node/view/block_item.tpl
MatchFile=block_item/inventary.tpl
Subdir=templates
Match[class_identifier]=inventary

[block_item_image]
Source=node/view/block_item.tpl
MatchFile=block_item/image.tpl
Subdir=templates
Match[class_identifier]=image

[block_item_corso]
Source=node/view/block_item.tpl
MatchFile=block_item/corso.tpl
Subdir=templates
Match[class_identifier]=corso



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

[full_banner]
Source=node/view/full.tpl
MatchFile=full/banner.tpl
Subdir=templates
Match[class_identifier]=banner

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

[full_documentation_page]
Source=node/view/full.tpl
MatchFile=full/documentation_page.tpl
Subdir=templates
Match[class_identifier]=documentation_page

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

[full_flash_recorder]
Source=node/view/full.tpl
MatchFile=full/flash_recorder.tpl
Subdir=templates
Match[class_identifier]=flash_recorder

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

[full_product]
Source=node/view/full.tpl
MatchFile=full/product.tpl
Subdir=templates
Match[class_identifier]=product

[full_quicktime]
Source=node/view/full.tpl
MatchFile=full/quicktime.tpl
Subdir=templates
Match[class_identifier]=quicktime

[full_real_video]
Source=node/view/full.tpl
MatchFile=full/real_video.tpl
Subdir=templates
Match[class_identifier]=real_video

[full_silverlight]
Source=node/view/full.tpl
MatchFile=full/silverlight.tpl
Subdir=templates
Match[class_identifier]=silverlight

[full_windows_media]
Source=node/view/full.tpl
MatchFile=full/windows_media.tpl
Subdir=templates
Match[class_identifier]=windows_media

[line_building_room]
Source=node/view/line.tpl
MatchFile=line/building_room.tpl
Subdir=templates
Match[class_identifier]=building_room

[line_net]
Source=node/view/line.tpl
MatchFile=line/net.tpl
Subdir=templates
Match[class_identifier]=net


[line_scuola]
Source=node/view/line.tpl
MatchFile=line/scuola.tpl
Subdir=templates
Match[class_identifier]=scuola


[line_corso]
Source=node/view/line.tpl
MatchFile=line/corso.tpl
Subdir=templates
Match[class_identifier]=corso

[line_polo_territoriale]
Source=node/view/line.tpl
MatchFile=line/corso.tpl
Subdir=templates
Match[class_identifier]=polo_territoriale


[line_building]
Source=node/view/line.tpl
MatchFile=line/building.tpl
Subdir=templates
Match[class_identifier]=building

[line_inv_item]
Source=node/view/line.tpl
MatchFile=line/inv_item.tpl
Subdir=templates
Match[class_identifier]=inv_item

[line_inventary]
Source=node/view/line.tpl
MatchFile=line/inventary.tpl
Subdir=templates
Match[class_identifier]=inventary

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

[line_banner]
Source=node/view/line.tpl
MatchFile=line/banner.tpl
Subdir=templates
Match[class_identifier]=banner

[line_blog]
Source=node/view/line.tpl
MatchFile=line/blog.tpl
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

[line_documentation_page]
Source=node/view/line.tpl
MatchFile=line/documentation_page.tpl
Subdir=templates
Match[class_identifier]=documentation_page

[line_event_calendar]
Source=node/view/line.tpl
MatchFile=line/event_calendar.tpl
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

[line_gallery]
Source=node/view/line.tpl
MatchFile=line/gallery.tpl
Subdir=templates
Match[class_identifier]=gallery

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

[line_product]
Source=node/view/line.tpl
MatchFile=line/product.tpl
Subdir=templates
Match[class_identifier]=product

[line_silverlight]
Source=node/view/line.tpl
MatchFile=line/silverlight.tpl
Subdir=templates
Match[class_identifier]=silverlight

[line_quicktime]
Source=node/view/line.tpl
MatchFile=line/quicktime.tpl
Subdir=templates
Match[class_identifier]=quicktime

[line_real_video]
Source=node/view/line.tpl
MatchFile=line/real_video.tpl
Subdir=templates
Match[class_identifier]=real_video

[line_windows_media]
Source=node/view/line.tpl
MatchFile=line/windows_media.tpl
Subdir=templates
Match[class_identifier]=windows_media

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

[embed_banner]
Source=content/view/embed.tpl
MatchFile=embed/banner.tpl
Subdir=templates
Match[class_identifier]=banner

[embed_file]
Source=content/view/embed.tpl
MatchFile=embed/file.tpl
Subdir=templates
Match[class_identifier]=file

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

[embed_product]
Source=content/view/embed.tpl
MatchFile=embed/product.tpl
Subdir=templates
Match[class_identifier]=product

[embed_quicktime]
Source=content/view/embed.tpl
MatchFile=embed/quicktime.tpl
Subdir=templates
Match[class_identifier]=quicktime

[embed_real_video]
Source=content/view/embed.tpl
MatchFile=embed/real_video.tpl
Subdir=templates
Match[class_identifier]=real_video

[embed_windows_media]
Source=content/view/embed.tpl
MatchFile=embed/windows_media.tpl
Subdir=templates
Match[class_identifier]=windows_media

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

[embed_itemizedsubitems_documentation_page]
Source=content/view/itemizedsubitems.tpl
MatchFile=itemizedsubitems/documentation_page.tpl
Subdir=templates
Match[class_identifier]=documentation_page

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

[embed_horizontallylistedsubitems_product]
Source=node/view/horizontallylistedsubitems.tpl
MatchFile=horizontallylistedsubitems/product.tpl
Subdir=templates
Match[class_identifier]=product

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

[scuola_galleryline]
Source=node/view/galleryline.tpl
MatchFile=galleryline/scuola.tpl
Subdir=templates
Match[class_identifier]=scuola


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

[billboard_banner]
Source=content/view/billboard.tpl
MatchFile=billboard/banner.tpl
Subdir=templates
Match[class_identifier]=banner

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