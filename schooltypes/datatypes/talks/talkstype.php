<?php
/**
 * This file contains talks class (used to record professors parlors)
 *
 * @version    0.1
 * @package    schooltypes
 * @subpackage talks
 * @author     mosarg
 * @copyright  2008 e-moka no-rights.reserved
 * @license    Gnu GPL V3
 */


class talksType extends eZDataType{
	const DATATYPE_STRING       = "talks";
	const DEFAULT_FIELD         = "data_text1";
	const DEFAULT_VARIABLE      = "_talks_default_value_";
	const SHOW_IN_VIEW_FIELD    = "data_text2";
	const SHOW_IN_VIEW_VARIABLE = "_talks_show_in_view_";

	
	  public function __construct()
    		{
        	parent::__construct( self::DATATYPE_STRING,"talks",array( 'serialize_supported' => true,'object_serialize_map' => array( 'data_text' => 'value' ) ) );
        	
    		}
/**
     *Set default values 
     * @param mixed $contentObjectAttribute         Class eZContentObjectAttribute.
     * @param mixed $currentVersion                 Should be NULL on initial obj creation.
     * @param mixed $originalContentObjectAttribute Class eZContentObjectAttribute.         
     *
     * @return void
*/

	public function initializeObjectAttribute( $contentObjectAttribute, $currentVersion, $originalContentObjectAttribute ){
        		if ( $currentVersion != false ){
				$dataText = $originalContentObjectAttribute->attribute( "data_text" );
            		    	$contentObjectAttribute->setAttribute( "data_text", $dataText );
        			$contentObjectAttribute->store();
        		}
            		
    		eZDebug::writeNotice("Debug talkstype","talkstype:test");
    	}
/**
     * Fetches the http post var string input and stores it in the data instance.
     *
     * @param mixed  $http                   Class eZHTTPTool.
     * @param string $base                   Seems to be always 'ContentObjectAttribute'.
     * @param mixed  $contentObjectAttribute Class eZContentObjectAttribute.
     *
     * @return boolean
*/
	
	
	
	public function fetchObjectAttributeHTTPInput( $http, $base, $contentObjectAttribute ){
        	if ( $http->hasPostVariable( $base . "_data_text_" . $contentObjectAttribute->attribute( "id" ) ) )
        		{
            		$data = $http->postVariable( $base . "_data_text_" . $contentObjectAttribute->attribute( "id" ) );
            		$contentObjectAttribute->setHTTPValue( $data );
            		//$locale = eZLocale::instance();
            		//$data = $locale->internalNumber( $data );
			$contentObjectAttribute->setAttribute( "data_text", $data );
            		return true;
        		}
        	return false;
	}
            
	public function validateObjectAttributeHTTPInput( $http, $base, $contentObjectAttribute ){
        //if ( $http->hasPostVariable( $base . "_data_float_" . $contentObjectAttribute->attribute( "id" ) ) )
        //{
          //  $data = $http->postVariable( $base . "_data_float_" . $contentObjectAttribute->attribute( "id" ) );
           // $data = str_replace(" ", "", $data );
           // $classAttribute = $contentObjectAttribute->contentClassAttribute();
           // $min = $classAttribute->attribute( self::MIN_FIELD );
           // $max = $classAttribute->attribute( self::MAX_FIELD );
           // $input_state = $classAttribute->attribute( self::INPUT_STATE_FIELD );
            //if( ( $classAttribute->attribute( "is_required" ) == false ) &&  ( $data == "" ) )
            //{
             //   return eZInputValidator::STATE_ACCEPTED;
            //}
	return eZInputValidator::STATE_ACCEPTED;
    	}
/**
* Handles the input specific for one attribute from the class edit interface.
* 
* @param mixed  $http           Class eZHTTPTool.
* @param string $base           Seems to be always 'ContentClassAttribute'.
* @param mixed  $classAttribute Class eZContentClassAttribute.
*
* @return boolean
*/
    	public function fetchClassAttributeHTTPInput( $http, $base, $classAttribute ){
       		
       		$attributeContent = $this->classAttributeContent( $classAttribute );
       		$classAttributeID = $classAttribute->attribute( 'id' );
       		$defaultValueName =  $base . self::DEFAULT_VARIABLE . $classAttributeID;
        	$showInViewName = $base . self::SHOW_IN_VIEW_VARIABLE . $classAttributeID;

        	if ( $http->hasPostVariable( $defaultValueName ) ){
            		//$locale = eZLocale::instance();
            		$defaultValueValue = $http->postVariable( $defaultValueName );
            		$defaultValueValue = str_replace(" ", "", $defaultValueValue );
            		//$defaultValueValue = $locale->internalNumber( $defaultValueValue );
            		$showInViewValue = $http->postVariable( $showInViewName );
            		
			$hasPostData = true;
        	}
        	
        	$currentOptions = $attributeContent['options'];
        	$hasPostData = false;
		if ( $http->hasPostVariable( $base . "_talks_option_name_array_" . $classAttributeID ) ){
            		$nameArray = $http->postVariable( $base . "_talks_option_name_array_" . $classAttributeID );
			// Fill in new names for options
            			foreach ( array_keys( $currentOptions ) as $key ){
                			$currentOptions[$key]['name'] = $nameArray[$currentOptions[$key]['id']];
            			}
           	 $hasPostData = true;
		}
        	if ( $http->hasPostVariable( $base . "_talks_newoption_button_" . $classAttributeID ) ){
            		$currentCount = 0;
            			foreach ( $currentOptions as $option ){
                			$currentCount = max( $currentCount, $option['id'] );
            			}
            		$currentCount += 1;
            		$currentOptions[] = array( 'id' => $currentCount,'name' => '' );
            		$hasPostData = true;

        	}
        	
        	if ( $http->hasPostVariable( $base . "_talks_removeoption_button_" . $classAttributeID ) ){
            		if ( $http->hasPostVariable( $base . "_talks_option_remove_array_". $classAttributeID ) ){
                		$removeArray = $http->postVariable( $base . "_talks_option_remove_array_". $classAttributeID );
				foreach ( array_keys( $currentOptions ) as $key ){
                    			if ( isset( $removeArray[$currentOptions[$key]['id']] ) and
                         		$removeArray[$currentOptions[$key]['id']] )
                        		unset( $currentOptions[$key] );
                		}
                	$hasPostData = true;
            		}
        	}
        	
        	
        	if ( $hasPostData ){
			// Serialize XML
            		$doc = new DOMDocument( '1.0', 'utf-8' );
            		$root = $doc->createElement( "talksselection" );
            		$doc->appendChild( $root );
            		$options = $doc->createElement( "options" );
			$root->appendChild( $options );
            		foreach ( $currentOptions as $optionArray ){
                		unset( $optionNode );
                		$optionNode = $doc->createElement( "option" );
                		$optionNode->setAttribute( 'id', $optionArray['id'] );
                		$optionNode->setAttribute( 'name', $optionArray['name'] );
				$options->appendChild( $optionNode );
            		}	
			$xml = $doc->saveXML();
			$classAttribute->setAttribute( "data_text5", $xml );
			
			$classAttribute->setAttribute( self::DEFAULT_FIELD, $defaultValueValue );
            		$classAttribute->setAttribute( self::SHOW_IN_VIEW_FIELD, $showInViewValue );
            		$classAttribute->setAttribute("data_text3","culone");
			return true;
        		}
        	
        	
        	
        	return false;
    	}

	public function validateClassAttributeHTTPInput( $http, $base, $classAttribute ){
		return  eZInputValidator::STATE_ACCEPTED;
	}
	public function metaData( $contentObjectAttribute ){
        	return $contentObjectAttribute->attribute( "data_text" );
    	}
	
	
	function classAttributeContent( $classAttribute ){
	
	$dom = new DOMDocument( '1.0', 'utf-8' );
        $xmlString = $classAttribute->attribute( 'data_text5' );
        $optionArray = array();
        if ( $xmlString != '' )
        {
            $success = $dom->loadXML( $xmlString );
            if ( $success )
            {
                $options = $dom->getElementsByTagName( 'option' );

                foreach ( $options as $optionNode )
                {
                    $optionArray[] = array( 'id' => $optionNode->getAttribute( 'id' ),
                                            'name' => $optionNode->getAttribute( 'name' ) );
                }
            }
        }

        if ( count( $optionArray ) == 0 )
        {
            $optionArray[] = array( 'id' => 0,
                                    'name' => '' );
        }
        $attrValue = array( 'options' => $optionArray);
        return $attrValue;
	
    }
	
	
	function objectAttributeContent( $contentObjectAttribute ){
        	return $contentObjectAttribute->attribute( "data_text" );
    	}
	
	public function title( $contentObjectAttribute, $name = null ){
        	return $contentObjectAttribute->attribute( "data_text" );
    	}
	public function hasObjectAttributeContent( $contentObjectAttribute ){
        	return true;
    	}
    	
    	
    	
    	
    	
    	
	public function serializeContentClassAttribute( $classAttribute, $attributeNode, $attributeParametersNode ){
        $defaultValue = $classAttribute->attribute( self::DEFAULT_FIELD );
        $giorno=$classAttribute->attribute('data_text3');
        
        $xmlString = $classAttribute->attribute( 'data_text5' );
	$dom = new DOMDocument( '1.0', 'utf-8' );
        $success = $dom->loadXML( $xmlString );
        $domRoot = $dom->documentElement;
        $options = $domRoot->getElementsByTagName( 'options' )->item( 0 );
        
        $importedOptionsNode = $attributeParametersNode->ownerDocument->importNode( $options, true );
        $attributeParametersNode->appendChild( $importedOptionsNode );
        
        
        $attributeParametersNode->appendChild( eZDOMDocument::createElementTextNode('default-value', $defaultValue ));
        $attributeParametersNode->appendChild(eZDOMDocument::createElementTextNode('giorno',$giorno));
        
       }
	
	
	
	
	
	
	public function unserializeContentClassAttribute( $classAttribute, $attributeNode, $attributeParametersNode ){
        	$defaultValue = $attributeParametersNode->elementTextContentByName( 'default-value' );
        	$giorno="cipiripi";
        	$classAttribute->setAttribute( self::DEFAULT_FIELD, $defaultValue );
        	$classAttribute->setAttribute('data_text3',$giorno);
        	
        	$options = $attributeParametersNode->getElementsByTagName( 'options' )->item( 0 );
        	$doc = new DOMDocument( '1.0', 'utf-8' );
        	$root = $doc->createElement( 'talksselection' );
        	$doc->appendChild( $root );
		$importedOptions = $doc->importNode( $options, true );
        	$root->appendChild( $importedOptions );

        	$xml = $doc->saveXML();
        	$classAttribute->setAttribute( 'data_text5', $xml );
        }

}
eZDataType::register( talksType::DATATYPE_STRING, "talksType" );

?>