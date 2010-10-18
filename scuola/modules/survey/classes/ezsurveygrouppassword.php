<?php
//
// Created on: <02-Apr-2004 00:00:00 Jan Kudlicka>
//
// Copyright (C) 1999-2008 eZ Systems as. All rights reserved.
//
// This source file is part of the eZ Publish (tm) Open Source Content
// Management System.
//
// This file may be distributed and/or modified under the terms of the
// "GNU General Public License" version 2 as published by the Free
// Software Foundation and appearing in the file LICENSE.GPL included in
// the packaging of this file.
//
// Licencees holding valid "eZ Publish professional licences" may use this
// file in accordance with the "eZ Publish professional licence" Agreement
// provided with the Software.
//
// This file is provided AS IS with NO WARRANTY OF ANY KIND, INCLUDING
// THE WARRANTY OF DESIGN, MERCHANTABILITY AND FITNESS FOR A PARTICULAR
// PURPOSE.
//
// The "eZ Publish professional licence" is available at
// http://ez.no/products/licences/professional/. For pricing of this licence
// please contact us via e-mail to licence@ez.no. Further contact
// information is available at http://ez.no/home/contact/.
//
// The "GNU General Public License" (GPL) is available at
// http://www.gnu.org/copyleft/gpl.html.
//
// Contact licence@ez.no if any conditions of this licencing isn't clear to
// you.
//

/*! \file ezsurveytextentry.php
 */

class eZSurveyGroupPassword extends eZSurveyEntry {
    function eZSurveyGroupPassword( $row = false ) {

        $row['mandatory'] = 1;
        $row['type'] = 'GroupPassword';
        $this->eZSurveyEntry( $row );
    }

    function processViewActions( &$validation, $params ) {
        $http = eZHTTPTool::instance();
        $locale = eZLocale::instance();
        $variableArray = array();

        $prefix = eZSurveyType::PREFIX_ATTRIBUTE;
        $attributeID = $params['contentobjectattribute_id'];

        $postAnswer = $prefix . '_ezsurvey_answer_' . $this->ID . '_' . $attributeID;
        $answer = trim( $http->postVariable( $postAnswer ) );
        $variableArray['answer'] = trim ( $http->postVariable( $postAnswer ) );
        $votes_counter = $this->attribute( 'text3' );

        if ($votes_counter==$this->attribute( 'text2')){
             $validation['error'] = true;
             $validation['errors'][] = array( 'message' => ezi18n( 'survey', 'Password scaduta!', null,
                array( '%number' => $this->questionNumber() ) ),
                'question_number' => $this->questionNumber(),
                'code' => 'number_answer_question',
                'question' => $this );
            return $variableArray;
        }

        if (strlen( $answer ) == 0 ) {
            $validation['error'] = true;
            $validation['errors'][] = array( 'message' => ezi18n( 'survey', 'Devi inserire una password!', null,
                array( '%number' => $this->questionNumber() ) ),
                'question_number' => $this->questionNumber(),
                'code' => 'number_answer_question',
                'question' => $this );
            return $variableArray;
        }


        if($answer!=$this->attribute('text')) {
            $validation['error'] = true;
            $validation['errors'][] = array( 'message' => ezi18n( 'survey', 'Password errata!', null,
                array( '%number' => $this->questionNumber() ) ),
                'question_number' => $this->questionNumber(),
                'code' => 'number_answer_question',
                'question' => $this );
            return $variableArray;
        }

        $answer = $locale->internalNumber( $answer );

        

        $this->setAttribute('text3',$votes_counter+1);
        $this->store();
        $this->setAnswer( $answer );


        return $variableArray;
    }

    function validateEditActions( &$validation, $params ) {
        parent::validateEditActions( $validation, $params );

        $http = eZHTTPTool::instance();
        $locale = eZLocale::instance();
        $prefix = eZSurveyType::PREFIX_ATTRIBUTE;
        $attributeID = $params['contentobjectattribute_id'];
        $postNumText2 = $prefix . '_ezsurvey_question_' . $this->ID . '_text2_' . $attributeID;
        $reqInteger = true;
        $validator = new eZIntegerValidator();
        if ( $http->hasPostVariable( $postNumText2 ) and
            strlen( trim( $http->postVariable( $postNumText2 ) ) ) > 0 ) {
            $data = $locale->internalNumber( trim( $http->postVariable( $postNumText2 ) ) );
            if ( $reqInteger and is_numeric( $data ) and (int) $data == $data )
                $data = (int) $data;
            if ( $validator->validate( $data ) != eZInputValidator::STATE_ACCEPTED ) {
                $validation['error'] = true;
                if ( $reqInteger ) {
                    $validation['errors'][] = array( 'message' => ezi18n( 'survey', 'Entered text in the question with id %number is not an integer number!', null,
                        array( '%number' => $this->ID ) ),
                        'question_id' => $this->ID,
                        'code' => 'number_not_integer_number',
                        'question' => $this );
                }
                else {
                    $validation['errors'][] = array( 'message' => ezi18n( 'survey', 'Entered text in the question with id %number is not an number!', null,
                        array( '%number' => $this->ID ) ),
                        'question_id' => $this->ID,
                        'code' => 'number_not_number',
                        'question' => $this );
                }
            }
        }


    }

    function processEditActions( &$validation, $params ) {
        parent::processEditActions( $validation, $params );
        $http = eZHTTPTool::instance();
        $locale = eZLocale::instance();
        $prefix = eZSurveyType::PREFIX_ATTRIBUTE;
        $attributeID = $params['contentobjectattribute_id'];
        if ( $this->attribute( 'num' ) ) {
            $reqInteger = true;
            $validator = new eZIntegerValidator();
        }
        else {
            $reqInteger = false;
            $validator = new eZFloatValidator();
        }

        $this->setAttribute( 'text2', trim( $this->attribute( 'text2' ) ) );

        if ( strlen( $this->attribute( 'text2' ) ) > 0 ) {
            $data = $this->attribute( 'text2' );
            $data = trim( $data );
            $data = $locale->internalNumber( $data );
            if ( $reqInteger && is_numeric( $data ) and (int) $data == $data )
                $data = (int) $data;
            if ( $validator->validate( $data ) == eZInputValidator::STATE_ACCEPTED ) {
                $this->setAttribute( 'text2', $data );
            }
        }
        $counter=$this->attribute( 'text3' );

        if ($counter==''){
            $this->setAttribute( 'text3', 0);
        }

    }
}

eZSurveyQuestion::registerQuestionType( 'Group Password', 'GroupPassword' );

?>
