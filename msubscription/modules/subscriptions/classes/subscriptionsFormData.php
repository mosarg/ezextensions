<?php
/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of subscriptionsFormData
 *
 * @author mosa
 */


require_once( 'kernel/common/template.php' );
class subscriptionsFormData {

/*******************************************************************************
* Formats usefull post variables for db storing
********************************************************************************/

    public static function extractPostVariables($postData) {

        $dataArray=array();
        $dateArray=array();
        foreach ($postData as $key=>$value) {
            if (preg_match('/_(\d+)/',$key,$matches)) {

                if(preg_match('/_(year|month|day)_/',$key,$date)) {
                    $dateArray[$date[1]]=$value;
                    $dataArray[$matches[1]]=$dateArray;
                }
                else $dataArray[$matches[1]]=$value;
            }

        }
        return $dataArray;
    }
/**********************************************************************************
* Extract options from select datatypes
***********************************************************************************/
  public static function extractOptions($options) {
        $schoolOptions=array();
        foreach($options as $option) {
            $schoolOptions[$option["identifier"]]=$option["name"];
        }
        return $schoolOptions;
    }
/*************************************************************************************
* Simplifyes complex associative array and renders something like key=>'string value'
**************************************************************************************/

    public static function simplify($account) {
        $simpleArray=array();
        
        $entry=array_combine(
            array_keys($account[0]['data']),
            array_keys($account[0]['data'])
            );
        ksort($entry);
        array_push($simpleArray,$entry);

        foreach ($account as $record) {

            if (isset($record['labels'])){
                    
                foreach ($record['labels'] as $key=>$attribute){
                    $values=array_values($record['data'][$key]);
                    $record['data'][$key]=array_intersect_key($attribute,array_combine($values,$values));
                }
                $entry=array_map(array('subscriptionsFormData','implodeArray'),$record['data']);
                ksort($entry);
                array_push($simpleArray,$entry);
            }
             
        }
        return $simpleArray;

    }
/*******************************************************************************
* Implodearray callback 
********************************************************************************/
    public static function implodeArray($value) {
        $separator=' ';
        if (is_array($value)) {
            if (isset($value['day'])) $separator='/';
            return implode($separator,$value);
        }
        else if($value=='') return 'empty';
        else return $value;
    }
/*******************************************************************************
* Helper method to start file downloading
********************************************************************************/

    public static function download($file,$isAttachedDownload = true,$overrideFilename = false) {


        if ( file_exists( $file ) ) {
            $mimeinfo = eZMimeType::findByURL( $file );
            ob_clean();
                     
            header( 'X-Powered-By: eZ Publish' );
            header( 'Content-Length: ' . filesize( $file ) );
            header( 'Content-Type: ' . $mimeinfo['name'] );

            if( $overrideFilename ) {
                $mimeinfo['filename'] = $overrideFilename;
            }
            if ( $isAttachedDownload ) {
                header( 'Content-Disposition: attachment; filename='.$mimeinfo['filename'] );
            }
            else {
                header( 'Content-Disposition: inline; filename='.$mimeinfo['filename'] );
            }
            
            header( 'Content-Transfer-Encoding: binary' );
            header( 'Accept-Ranges: bytes' );

            ob_end_clean();

            @readfile( $file );
            eZExecution::cleanExit();
        }
        else {
            eZExecution::cleanExit();
            return false;
        }
    }

public static function form2Pdf($attributes,$extra_info,$class_name,$file_name){

            $template='design:pdf/'.$class_name.'.tpl';
            $storage_dir = eZSys::storageDirectory();
            $msubscriptions_dir=$storage_dir.'/msubscriptions/pdf';
            if ( !file_exists( $msubscriptions_dir ) ) eZDir::mkdir( $msubscriptions_dir, octdec('0777'), true );
            $simple_data=self::simplify($attributes);
            $data=self::renderForm($template,$simple_data[1],$extra_info);
            $pdf_file = $msubscriptions_dir. '/'.$file_name.'.pdf';
            $style_sheet='';
            self::createPdf($data, $style_sheet, $pdf_file);
            return $pdf_file;
}

/*******************************************************************************
* creates pdf from xhtml input currently using mPdf
********************************************************************************/

public static function createPdf($data,$style_sheet_file,$file) {


        $pdf=new exportPdf();
        //$pdf->generatePDF_paradox($data,$file);
        $pdf->generatePDF_mpdf($data, $file);

    }

public static function renderForm($template,$attributes,$extra_info) {
        $tpl = templateInit();
        $tpl->setVariable( 'form_attr',$attributes );
        $tpl->setVariable('extra_info',$extra_info);
        return $tpl->fetch( $template);
    }

/*******************************************************************************
*Send user notification email with attachments
*
*******************************************************************************/

public static function sendEmail($sender,$receiver,$message){


$mail = new ezcMailComposer();
$mail->from = new ezcMailAddress( $sender['email'], $sender['name'] );
$mail->addTo( new ezcMailAddress( $receiver['email'], $receiver['name']) );
$mail->subject = $message['subject'];
$mail->plainText = $message['body'];
$mail->addAttachment($message['attachment']);
$mail->build();
$transport = new ezcMailMtaTransport();
$transport->send( $mail );


}


}


?>
