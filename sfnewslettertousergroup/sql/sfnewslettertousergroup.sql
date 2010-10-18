CREATE TABLE IF NOT EXISTS `sfnewslettertousergroup` (
  `usergroupid` varchar(10) collate utf8_unicode_ci NOT NULL,
  `subscriptionlistid` varchar(10) collate utf8_unicode_ci NOT NULL,
  PRIMARY KEY  (`usergroupid`(6))
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;