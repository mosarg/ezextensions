<?php
//
// Definition of eZiCal class
/*!

  \brief Permet de formaliser le modèle iCal pour eZ.
 */
class Calendar
{
   
    const VERSION = '0.1';

    /* Gestion du status */
    const STATUSID_0 = 'TENTATIVE';
    const STATUSID_1 = 'CONFIRMED';
    const STATUSID_3 = 'CANCELLED';

    /* Gestion des class*/
    const CLASSID_0 = 'PUBLIC';
    const CLASSID_1 = 'PRIVATE';
    const CLASSID_2 = 'CONFIDENTIAL';

    /* Constante de périodicité */
    const FREQUENCY_NONE_ID = 0;
    const FREQUENCY_DAILY_OPEN_ID = 1;
    const FREQUENCY_DAILY_ID = 2;
    const FREQUENCY_WEEKLY_ID = 3;
    const FREQUENCY_BIMONTHLY_ID = 4;
    const FREQUENCY_MONTHLY_ID = 5;
    const FREQUENCY_ANNUAL_ID = 6;


    public $eventClass = array();
    public $calendarSettings = array();



    /*!
     Constructeur d'eZiCal
     */
    private function __construct()
    {
        /* Récupération des paramètres */
        $ini = eZINI::instance('calendar.ini');
        $this->eventClass = $ini->variableMulti('EventClass', array(
                                                    'EventClassID'   => 'EventClassID',
                                                    'Dictionary'     => 'Dictionary',
                                                ) );
        $this->calendarSettings = $ini->variableMulti('ICalSettings', array(
                                                        'CacheTime'     => 'CacheTime',
                                                        'PathPrefix'     => 'PathPrefix',
                                                ) );
    }

    /*!
     Récupérer l'instance d'eZiCal

     \return
     */
    static function instance()
    {
        $impl = &$GLOBALS["CalendarGlobalInstance"];
        $class = get_class( $impl );

        if ( $class != 'Calendar')
        {
            $impl = new Calendar();
        }
        return $impl;
    }

    /*!
     Fonction retournant le contenu du fichier ICS

     \return string
     \TODO Utiliser les paramètres limit/offset
     */
    /*!
     Fonction retournant le noeud courant pour l'exportation ICS

     \return integer
     */
    public function getNodeID()
    {
        $Module = &$GLOBALS['eZRequestedModule'];

        if ( array_key_exists(0, $Module->OriginalParameters) && is_int($Module->OriginalParameters[0]) )
        {
            $nodeID = $Module->OriginalParameters[0];
        }
        else
        {
            $uriString = '';

            if ( array_key_exists(0, $Module->OriginalParameters) )
            {
                $uriString = $Module->OriginalParameters[0];
            }

        	/* Prefixe */
            if ( $this->calendarSettings['PathPrefix'] != ''  )
            {
                $uriString = eZURLAliasML::cleanURL( $this->calendarSettings['PathPrefix'] ) . $uriString;
            }

            eZURLAliasML::cleanURL($uriString);

            if ( empty( $uriString ) )
            {
                $ini = eZINI::instance('site.ini');
                $uri = eZURI::instance( $ini->variable( 'SiteSettings', 'IndexPage') );
                $url = $uri->elements();
                $url = eZURLAliasML::urlToAction( $url );
                $nodeID = eZURLAliasML::nodeIDFromAction( $url );
            }
            else
            {
               $uri = eZURI::instance($uriString);
               eZURLAliasML::translate($uri);
               $url = $uri->elements();
               $url = eZURLAliasML::urlToAction( $url );
               $nodeID = eZURLAliasML::nodeIDFromAction( $url );
            }
        }
        return $nodeID;
    }
}    //EOC

?>