<html>
    <head>
        {literal}
        <style type="text/css">
           p{float:left;margin-right:2em;}
                    .title{
               font-weight:bold;
               font-size:1.1em;}
           .separator{width:100%;border-bottom:3px solid black;}
         
        </style>
        {/literal}


    </head>
    <body>
        <h1>ISIS Malignani 								AFVL0001</h1><br />

        <h2>Modulo d’ordine acquisto Skills Card ed Esami  ECDL CORE  </h2>

        <div class="document">
            <div class="user_data">
                <table width="100%">
                    <tr >
                        <td colspan="2"><p><span class="title">Nome: </span> {$form_attr.first_name}</p></td>
                        <td><p><span class="title">Cognome: </span>{$form_attr.last_name}</p></td>
                        
                </tr>
                <tr>
                    <td colspan="2"><p><span class="title">Indirizzo: </span> {$form_attr.address}</p></td>
                        <td><p><span class="title">Cap: </span>{$form_attr.cap}</p></td>
                </tr>
                <tr>
                    <td><p><span class="title">Città: </span> {$form_attr.city}</p></td>
                    <td><p><span class="title">Provincia: </span>{$form_attr.prov}</p></td>
                    <td><p><span class="title">Nazione: </span>Italia</p></td>
                </tr>
                </table>


                <div class="separator"></div>

                <table width="100%">
                    <tr>
                        
                        <td colspan="2"><p><span class="title">Email: </span> {$form_attr.email}</p></td>
                        <td><p><span class="title">Telefono: </span> {$form_attr.phone}</p></td>
                    </tr>
                    <tr>
                        <td><p><span class="title">Sesso: </span> {$form_attr.sex}</p></td>
                        <td><p><span class="title">Data di Nascita: </span> {$form_attr.birth_date}</p></td>
                        <td><p><span class="title">Luogo di Nascita: </span> {$form_attr.birth_place}</p></td>
                    </tr>
                </table>
               <div class="separator"></div>

               <table width="100%">
                    <tr>
                        <td colspan="2"><p><span class="title">Titolo di studio: </span> {$form_attr.school_title}</p></td>
                        <td><p><span class="title">Occupazione: </span> {$form_attr.occupation}</p></td>

                        </tr>
                    <tr>
                       <td colspan="3"><p><span class="title">Lista esami: </span> {$form_attr.exams_list}</p></td>
                     </tr>
                     <tr>
                          <td><p><span class="title">Sesso: </span> {$form_attr.sex}</p></td>
                        <td><p><span class="title">Data di Nascita: </span> {$form_attr.birth_date}</p></td>
                        <td><p><span class="title">Luogo di Nascita: </span> {$form_attr.birth_place}</p></td>
                     </tr>
                </table>



            </div>

            <p style="width:100%; text-align:justify;">
           Legge 196/2003 - Sono al corrente e autorizzo l’ISIS Malignani ad utilizzare i miei dati
           anagrafici per  includerli nelle  liste degli  iscritti al progetto ECDL. Sono  inoltre al corrente
           che tali dati verranno comunicati ad AICA che li utilizzerà per statistiche interne e per
           accreditare coloro che hanno sostenuto gli esami ECDL.
           In ogni momento potrò avere accesso ai miei dati, chiedendone  la modifica o
           la cancellazione, dandone  comunicazione all’ISIS Malignani o direttamente all'AICA (tel.02-7645501).
           NB: compilare anche il modulo AICA QA-ESAMOD16
            </p>
           Accettazione Si <input type="checkbox" checked="checked"/> No<input type="checkbox" />
        </div>
    </body>
</html>