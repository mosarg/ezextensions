{def $skill_card=''
     $exams=''}


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
        <h1>ISIS Malignani 								{$extra_info.accounting_structure}</h1><br />

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
                    {if eq($form_attr.exams_list,'empty')|not()}
                      <tr>
                       <td colspan="3"><p><span class="title">Lista esami: </span> {$form_attr.exams_list}</p></td>
                     </tr>
                    {/if}
                    {if eq($form_attr.skill_code,'empty')|not()}
                    <tr>
                        <td colspan="3"><p><span class="title">Codice Skill Card: </span>  {$form_attr.skill_code}</p> </td>
                    </tr>
                    {/if}
               </table>
            </div>
     

            <table>
                {if is_set($extra_info.payment_info.mod_price)}
                <tr>
                    <td><h4>Costo totale dei corsi acquistati: {$extra_info.payment_info.mod_price}€</h4></td>
                </tr>
                {/if}
                {if is_set($extra_info.payment_info.skill_buy_price)}
                <tr>
                    <td>
                       <h4>Costo della skill card: {$extra_info.payment_info.skill_buy_price}€</h4>
                    </td>
                    {set $skill_card='Skills Card'}
                </tr>
                {/if}
                <tr>
                    <td>
                      <h4>Totale da versare: {sum($extra_info.payment_info.mod_price,$extra_info.payment_info.skill_buy_price)}€</h4>
                    </td>
                    {set $exams='Esami'}
                </tr>
                <tr>
                    <td>
                        {$extra_info.static_form_data[pay_info]} "{$extra_info.accounting_structure} {$skill_card} {$exams} - {$form_attr.first_name}  {$form_attr.last_name}"
                    </td>
                </tr>
             </table>

            <p>{$extra_info.static_form_data[privacy]}</p>
           

           Accettazione Si <input type="checkbox" checked="checked"/> No<input type="checkbox" />
        </div>
    </body>
</html>