<?php /* #?ini charset="utf-8"?

[ICalSettings]
# Cache Time in Seconds
#
# The timespan a ICS feed is served from the cache in seconds.
# After the end of the timespan, the ICS feed is regenerated and
# again served from the cache.
#
# This means that changes to the content being fed show up
# after the maximum cache time at the latest.
#
# "CacheTime = 0" turns off cacheing.
CacheTime=1200
#CacheTime=0

# Hides this part from the start of the url alias
# This PathPrefix is in addition to site.ini / [SiteAccessSettings] / PathPrefix
PathPrefix=

[EventClass]
# Identifiant of events's class
EventClassID=event

# Dictionay : Describes the attributs of events's class
Dictionary[]
Dictionary[DTSTART]=from_time
Dictionary[DTSTART_Time]=disabled
Dictionary[DTEND]=to_time
Dictionary[DTEND_Time]=disabled
Dictionary[LOCATION]=disabled
Dictionary[CATEGORIES]=category
Dictionary[DESCRIPTION]=text

# Event addons
Dictionary[STATUS]=disabled
Dictionary[CLASS]=disabled
Dictionary[FullDay]=disabled
Dictionary[Frequency]=frequency
Dictionary[FrequencyEnd]=frequency_end
Dictionary[CLASS]=frequency_end

*/ ?>