<?php
/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of exportPdf
 *
 * @author mosa
 */
class exportPdf {

    private $paradoxPDFExtensionDir;
    private $javaExec;
    private $fileSep;


function __construct() {

        $this->mpdfPath='/var/www/libs/mpdf/';
        $this->javaExec = '/usr/bin/java';
        $fileSep = eZSys::fileSeparator();
        $this->fileSep = $fileSep;
        $this->paradoxPDFExtensionDir = eZSys::rootDir().$fileSep.eZExtension::baseDirectory().$fileSep.'msubscription';
        $this->paradoxPDFExec = $this->paradoxPDFExtensionDir.$fileSep.'bin'.$fileSep.'paradoxpdf.jar';
       }



    public function generatePDF_paradox($xhtml,$output_pdf)
    {


        $cache_dir = eZSys::cacheDirectory();
        $html_temp_dir=$cache_dir.'/temp_xhtml_2convert';
        if ( !file_exists( $html_temp_dir )) eZDir::mkdir( $html_temp_dir, octdec('0777'), true );

        $rand = md5('paradoxpdf'. getmypid() . mt_rand());

        $tmpXHTMLFile = $html_temp_dir.'/'.$rand.'.xhtml';

        eZFile::create($tmpXHTMLFile, false, $xhtml) ;
      
        //run jar in headless mode
        $command = $this->javaExec." -Djava.awt.headless=true";

        $command .= " -jar ".$this->paradoxPDFExec." $tmpXHTMLFile $output_pdf";

        //fix to get all command output
        $command .= "  2>&1";

        //Enter the Matrix
        exec($command, $output, $returnCode);

        //Cant trust java return code so we test if a plain pdf file is genereated
//        if (!(eZFileHandler::doExists($output_pdf) && $this->size=filesize($output_pdf)))
//        {
//            $this->writeCommandLog($command, $output, false);
//            return false;
//        }
//
//        $this->writeCommandLog($command, $output, true);

        return true;
    }
    public function generatePDF_mpdf($xhtml,$output_pdf){
        define('_MPDF_PATH',$this->mpdfPath);
        include($this->mpdfPath.'mpdf.php');
        $mpdf=new mPDF();
        $mpdf->WriteHTML($xhtml);
        $mpdf->Output($output_pdf);

    }

}


?>
