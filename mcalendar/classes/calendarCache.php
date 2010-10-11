<?php


/**
 * Description of calendarCache
 *
 * @author mosa
 */
class calendarCache {



/************************************************
* @start  = calendar start timewindow
* @end    = calendar end time window
* @cal_id = calendar node id
* @data = cache file content
*************************************************/

    public static function storeCache($start,$end,$cal_id,$data) {
        $cache_dir=eZSys::cacheDirectory();
        $cal_cache_dir=$cache_dir.'/mcalendar';
        if ( !file_exists( $cal_cache_dir ) ) eZDir::mkdir( $cal_cache_dir, octdec('0777'), true );
        $timespan=(int)$end-(int)$start;
        $time_midpoint=round(((int)$end+(int)$start)/2);

        switch ($timespan) {
            case ($timespan>604800):
                eZFile::create($cal_id.'_month_'.date("n_o",$time_midpoint),$cal_cache_dir,json_encode($data));
                break;
            case ($timespan<86400):
                eZFile::create($cal_id.'_day_'.date("z_o",$time_midpoint),$cal_cache_dir,json_encode($data));
                break;
            default:
                eZFile::create($cal_id.'_week_'.date("W_o",$time_midpoint),$cal_cache_dir,json_encode($data));
                break;
        }
    }
    public static function isCached($start,$end,$cal_id) {
        $cache_dir=eZSys::cacheDirectory().'/mcalendar/';
        $timespan=(int)$end-(int)$start;
        $time_midpoint=round(((int)$end+(int)$start)/2);
        $file=$cache_dir.'_month_'.$cal_id.date("n_o",$time_midpoint);
        switch ($timespan) {
            case ($timespan>604800):
                if (file_exists($cache_dir.$cal_id.'_month_'.date("n_o",$time_midpoint))) return true;
                break;
            case ($timespan<86400):
                if (file_exists($cache_dir.$cal_id.'_day_'.date("z_o",$time_midpoint))) return true;
                break;
            default:
                if (file_exists($cache_dir.$cal_id.'_week_'.date("W_o",$time_midpoint))) return true;
                break;
        }
        return false;
    }

    public static function getCache($start,$end,$cal_id) {

        $cache_dir=eZSys::cacheDirectory().'/mcalendar/';
        $timespan=(int)$end-(int)$start;
        $time_midpoint=round(((int)$end+(int)$start)/2);

        switch ($timespan) {
            case ($timespan>604800):
                $cache_file=$cache_dir.$cal_id.'_month_'.date("n_o",$time_midpoint);
                break;
            case ($timespan<86400):
                $cache_file=$cache_dir.$cal_id.'_day_'.date("z_o",$time_midpoint);
                break;
            default:
                $cache_file=$cache_dir.$cal_id.'_week_'.date("W_o",$time_midpoint);
                break;
        }
        return json_decode(eZFile::getContents($cache_file));
    }

    public static function expireCache($event_start,$event_end,$cal_id) {
        $cache_dir=eZSys::cacheDirectory().'/mcalendar/';
        $toExpire=array();

        $time_midpoint=round(((int)$event_end+(int)$event_start)/2);
        $event_month=(int)date("n",$time_midpoint);
        $event_year=date("o",$time_midpoint);
        $event_week=date("W",$time_midpoint);
        $event_day=date("z",$time_midpoint);
        
        array_push($toExpire,$cache_dir.$cal_id.'_week_'.$event_week.'_'.$event_year);
        array_push($toExpire,$cache_dir.$cal_id.'_day_'.$event_day.'_'.$event_year);

        for($i=-1;$i<2;$i++) {
            $event_month_clean=$event_month+$i;
            if ($event_month_clean>12) {$event_month_clean=$event_month_clean%12;$event_year+=1;}
            array_push($toExpire,$cache_dir.$cal_id.'_month_'.$event_month_clean.'_'.$event_year);
        }

        foreach($toExpire as $expireFile) {
            if (file_exists($expireFile)) eZFileHandler::unlink($expireFile);
            
        }

    }

}
?>
