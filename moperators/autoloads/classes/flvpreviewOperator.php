<?php
/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of flvpreviewOperator
 *
 * @author mosa
 */
class flvpreviewOperator extends mOperator {
//put your code here
    function __construct() {
        parent::__construct('flvpreview','height','width','frame');
    }

    static function execute($operatorValue,$namedParameters) {
        $format='jpg';
        $storage_dir = eZSys::storageDirectory();
        $preview_dir = $storage_dir . '/flvpreview';
        if ( !file_exists( $preview_dir ) )
        {
            $ini =& eZINI::instance();
            $mod = $ini->variable( 'FileSettings', 'StorageDirPermissions' );
            eZDir::mkdir( $preview_dir, octdec( $mod ), true );
        }


        $flvfile = eZClusterFileHandler::instance( $operatorValue );
        if ( !$flvfile->exists() ) {
            eZDebug::writeError( "File not readable or doesn't exist", "pdfpreview");
            return;
        }

        
        preg_match('/(\w+)$|(\w+)\.\w+$/',$operatorValue,$matches);
        $filename=array_pop($matches);
        $filename=$filename.$namedParameters['width'].$namedParameters['height'].$namedParameters['frame'].'.'.$format;
        $width = (int) $namedParameters['width'];
        if ( isset( $namedParameters['height'] ) and $namedParameters['height'] > 0 )
            $height = (int) $namedParameters['height'];
        else
            $height = (int) $namedParameters['width'];
        $page =1;
        $source = $operatorValue;
        $target = "$preview_dir/$filename";

        if ( !file_exists( $target ) ) {
            $fileHandler = eZClusterFileHandler::instance( $target );
            if ( $fileHandler->exists() ) {
                $fileHandler->fetch(true);
            }
            else {
                $flvfile->fetch(true);

                $ffmpeg=new FFMPEG_movie( $flvfile->filePath, false );
                $frame_count = $ffmpeg->getFrameCount() - 1;

                if ( is_numeric( $namedParameters['frame']) ) {
                    $frame_number = min( $namedParameters['frame'], $frame_count );
                    $frame_number = max( 1, $frame_number );
                }
                else{
                $frame_number = ceil( $frame_count / 2 );}

                $frame = $ffmpeg->getFrame($frame_number);
                $gd_image = $frame->toGDImage();
               
                $ret = imagejpeg($gd_image,$target );
                if ( $ret )
                {
                 $fileHandler = eZClusterFileHandler::instance();
                 $fileHandler->fileStore( $target, 'flvpreview-image', true );
                 $img = new Imagick($target);
                 $img->thumbnailImage($height,$width,true);
                 $img->writeImage($target);
                 $img->clear();
                 $img->destroy();

                 }
             }

        }
        return $target;
    }#end main method

#-----
}


?>
