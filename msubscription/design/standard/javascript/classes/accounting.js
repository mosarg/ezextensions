/****************************************************************************
 * New jquery widget to interact with users accounting to courses
 *
 ****************************************************************************/
var accounting={

/**
 * Widget constructor
 * @constructor
 */

    _init: function() {
        if(this.options.user_login!='anonymous'){
            this._renderInterface();
            this._setupEventDelegation();
            this._subscriptionState();
            this._loadAccountersList();
            this._exportData();
        }
    },
 /**
 *
 *
 */
    _sendMessage:function(message){
        this.element.find('p#message').text(message);
    },
    _subscriptionState:function(){
        var action='msubscription::hasAccount';
        var self=this;
        var options=this.options;

        if(options.admin) return false;

        $.ez(action,{
            postdata:'ready'
        },function(data){

            self._setData('state',data.content.reg_status);
            self._setData('stored_accounting_structure',data.content.accounting_structure);
            self._setSubscriptionState();
        });
    },
    _setButtonsState:function(state_subscribe,state_unsubscribe){

        $('button#modify').attr('disabled',state_subscribe);
        $('button#unsubscribe').attr('disabled',state_unsubscribe);
    },
    _setSubscriptionState: function() {
        var color='red';
        var options=this.options;
        if ((options.state)){
            color='green';
            this._setButtonsState(false,false);
            this.element.find('form').hide();
        }else{
            this._setButtonsState(true,true);
            this.element.find('form').show();
        }

        if ((options.stored_accounting_structure!=options.center_location)&&(options.state)){
            this._setButtonsState(true,false);
            this._sendMessage('Sei già iscritto al test center '+options.stored_accounting_structure);
        }

        this.element.find('div#semaphore').css({
            background: color
        });
    },
    _renderInterface:function(){
        var self=this;
        var options=this.options;
        var $interface,buttons,$buttons,semaphore,message;

        $interface=self.element.find('#interface');

        semaphore='<p class="label">'+options.accounting_state+'</p>';
        semaphore+='<div id="semaphore"></div>';
        message='<div><p id="message"></p></div>';
        buttons = "<div class=\"subscription-buttons\">\
                       <button id=\"modify\">Modifica accounting</button>\
                       <button id=\"unsubscribe\">Disiscriviti</button>\
                       </div>";
        if (options.admin){
            this._renderAdminInterface($interface);
        }else{

            $(semaphore).appendTo($interface);
            $buttons=$(buttons).appendTo($interface);
            $(message).appendTo($interface);
            $buttons.find('#modify').click(function(){
                self._editData();
            });
            $buttons.find('#unsubscribe').click(function(){
                self._removeAccount();
            })
            $('form').submit(function(){
               return self._validate();
            
            });
            self._programmaticForm();
        }

    },
    _programmaticForm:function(){
        var self=this;
        var options=this.options;
        var $base_element,$base_container,expander;
        var $subforms;

        $base_container=self.element.find('#prog_cont');
        $base_element=$base_container.find('.prog');

        self._setData('prog_form_html',$base_container.html());
        $base_element.remove();
        for (var i = 0;i<options.rules_content.length;i++){
            expander='<div class="subform rounded" id="'+options.rules_content[i].identifier+'"><a class="show_subform">'+
            options.rules_content[i].columns[0]+'</a></div>';
            $subforms=$(expander).appendTo($base_container);
            $subforms.data('subform_filter',options.rules_content[i]);
        }
    },
    _createSubform:function($target){
        var self=this;
        var $prog_form_html;
        var rule=$target.parent('div').data('subform_filter');
        var options=self.options;

        if (!options.active_subform){
            self._setData('active_subform',true);
            $prog_form_html=$(options.prog_form_html).appendTo($target.parent('.subform'));
        }else{
            self.element.find('.prog').remove();
            $prog_form_html=$(options.prog_form_html).appendTo($target.parent('.subform'));
        }
        self._applyRule($prog_form_html,rule.columns);
    },
    _applyRule:function($subform,rule,labels){
        var self=this;
        var options=self.options;
        var price= new Object();
        var number_of_items=new Object();
        var current_price,match;

        $subform.find('input').each(function(){
            $(this).parent('div').hide();
        });

        for(var i=1;i<options.rules_labels.length;i++){
            $subform.find('input#'+options.rules_labels[i].identifier).each(function(){
                if(rule[i]=='yes'){
                    match=options.rules_labels[i].identifier.match(/[a-zA-Z_]+/);
                    current_price=options.prices[match];

                    if (price[match+'_price']) price[match+'_price']+=Number(current_price);
                    else price[match+'_price']=Number(current_price);

                    if (number_of_items[match]) number_of_items[match]+=1;
                    else number_of_items[match]=1;

                    $(this).attr('checked',true);
                    $(this).parent('div').show();
                    if($(this).attr('type')=='checkbox') $(this).hide();

                }
            });

        }


        self._setPrices(price,number_of_items);

    },
    _setPrices:function(prices,number_of_items){
        var self=this;
        var total=0;
        var $prices_info=self.element.find('fieldset#prices_info');
        var $temp,text_elements=0;
        self.element.find('#paymentInfo').val(JSON.stringify(prices));
        $prices_info.find('div.price').hide();
        for (var i in prices){
            if (prices[i]){
                total+=prices[i];
                $prices_info.find('#'+i).each(
                    function(){

                        $(this).children('span').html(String(prices[i]));
                        $(this).show();
                    }
                    );
            }
        }

        $prices_info.find('#total span').html(String(total));
        $prices_info.find('#total').show();
        $prices_info.find('#payment_info span').hide();



        for(var i in number_of_items){

            $temp=$prices_info.find('span[title='+i+']');
            if($temp) text_elements+=1;
            if (number_of_items[i]>1){

                $temp.html(number_of_items[i]+' Esami');
                $temp.show();
            }
            else $temp.show();
        }
        if (text_elements>1) $prices_info.find('span[title=separator]').show();
    },
    _loading:function(){
        $('.class-membership-application-form').hide();
        $('<div class="loading"></div>').appendTo('.content-view-full');

    },
    _validate:function(){
        var $dialog;
        var self=this;
        var options=self.options;
        if (options.active_subform){
            self._loading();
            return true;}
        else {
             $dialog=$('<div id="info_dialog"></div>').appendTo(self.element);
             $('<p>'+options.validate_message+'</p>').appendTo($dialog);
             $dialog.dialog({
             bgiframe: true,
             modal: true,
             buttons: {
                Ok: function() {
                    $(this).dialog('close');
                }
            }
        });
        return false;
        }
    },
      _renderAdminInterface:function($interface){
        var self=this;
        var $table,table,emailForm,$emailForm;
        var options=this.options;
        table='<table class="users_list">\n\
                       <thead>\n\
                          <tr>\n\
                            <th><button id="toggle_select">'+options.tableHeader.select+'</button></th>\n\
                            <th>'+options.tableHeader.user_firstname+'</th>\n\
                            <th>'+options.tableHeader.user_surname+'</th>\n\
                            <th>'+options.tableHeader.email+'</th>\n\
                            <th>'+options.tableHeader.username+'</th>\n\
                            <th>'+options.tableHeader.user_id+'</th>\n\
                            <th>'+options.tableHeader.actions+'</th>\n\
                          </tr>\n\
                       </thead></table>';

        emailForm='<div id="email_form"><textarea name="message" cols=40 rows=10></textarea>\n\
                    <button id="sendEmail">Email</button></div>';

        $('<div id="csv"></div>').appendTo($interface);
        $table=$(table).appendTo($interface);
        $emailForm=$(emailForm).appendTo($interface);
        $table.find('button#toggle_select').click(
            function(){
                self._checkAllSubscribers();
            }
            );
        $emailForm.find('button').click(function(){
            self._sendUsersEmail($emailForm);
        });
    },
    _loadAccountersList:function(){
        var self=this;
        var options=this.options;
        var action='msubscription::listAccounters::'+options.center_location+'::'+options.object_id;
        var $usersTable=self.element.find('.users_list');
        $.ez(action,{
            postdata:'ready'
        },function(data){
            self._renderAccountersList(data.content,$usersTable);
        })
    },
    _getAccountingData:function(){
        var self=this;
        var action='msubscription::getAccountingData';
        $.ez(action,{
            postdata:'ready'
        },function(data){
            
            self.element.find('.attribute-message').each(function(){
                var block=this;
               
                $(this).children('input,select').val(data.content[$(this).attr('id')]);


                $(this).children('input[type=checkbox]').attr('checked',
                    data.content[$(this).attr('id')]=='on'
                    );
                $(this).children('input.checklist').each(
                    function(){
                        $(this).attr('checked',
                            data.content[$(block).attr('id')].toString().match($(this).val())!=null );
                    }
                    );
            })

        })
    },
    _removeAccount:function(){
        var self=this;
        var action='msubscription::removeAccount';
        $.ez(action,{
            postdata:'ready'
        },function(){
            self._subscriptionState();
        });
    },
    _editData:function(){
        var self=this;
        self.element.find('form').show();
        self._getAccountingData();
    },
    _checkAllSubscribers:function(){

        this.element.find('input.select').each(function(){
            $(this).attr('checked',!$(this).attr('checked'));
        })
    },
    _renderAccountersList:function(list,$usersTable){

        for (var i in list){
            this._renderAccounter(list[i],$usersTable);
        }
    },
    _renderAccounter:function(accounter,$usersTable){
        var $user,userline;
        var options=this.options;
        var pdf_link;
        pdf_link='<a class="pdf" href="'+options.module_url+'/pdf/'+
        options.object_id+'/'+
        accounter.user_id+'/'+options.center_location+'"></a>';

        userline='<tr id="'+accounter.user_id+'" class="user_entry">\n\
                        <td><input  class="select" id="'+accounter.user_id+'" type="checkbox" value="'+accounter.email+'"/></td>\n\
                        <td>'+accounter.first_name+'</td>\n\
                        <td>'+accounter.last_name+'</td>\n\
                        <td>'+accounter.email+'</td>\n\
                        <td>'+accounter[options.accounting_code]+'</td>\n\
                        <td>'+accounter.email+'</td>\n\
                        <td><button class="unsubscribe">Rimuovi</button>\n\
                            '+pdf_link+'</td>\n\
                        </tr>';

        $user=$(userline).appendTo($usersTable);
        $user.data('accounter',accounter);
    },
    _exportData:function(){
        var self=this;
        var options=this.options;
        var action=options.module_url+'/csv/'+options.object_id+'/'+options.center_location+'/accounting';
        var $csv=self.element.find('#csv');

        $('<a href="'+action+'">Download Csv</a>').appendTo($csv);
    },
    _removeAccounter:function($target){
        var $accounter=$target.closest('tr');
        var options=this.options;
        var accounter=$accounter.data('accounter');
        var action='msubscription::removeAccounter::'+accounter.user_id+'::'+options.object_id;

        $.ez(action,{postdata:'ready'});
        $accounter.remove();
    },
    _sendUsersEmail:function($emailForm){

        var users_email=new Array();
        var email_message,post_data;
        var options=this.options;
        email_message=$emailForm.find('textarea').val();

        this.element.find('.select:checked').each(function(){
            users_email.push($(this).val());
        });
        post_data=JSON.stringify({
            'email_message':email_message,
            'users_email':users_email
        });
        $.ez('msubscription::sendUserMessage::'+options.object_id,{
            postdata:post_data
        });
    },
    _setupEventDelegation : function() {
        var self = this;
        var options = this.options;
        this.element.click(function(event){
            var $target=$(event.target);
            if ($target.hasClass('unsubscribe')) {
                self._removeAccounter($target)
            }
            if ($target.hasClass('show_subform')) {
                self._createSubform($target);
            }
        });
    }
}

$.widget("ui.accounting", accounting);

$.ui.accounting.defaults ={
    state:false,
    user_login:'',
    accounting_state:'Accounting State',
    admin:false,
    tableHeader:{
        'username':'Username',
        'email':'Email',
        'select':'Select',
        'user_firstname':'User firstname',
        'user_surname':'User lastname',
        'user_id':'User Id',
        'actions':'Actions'
    },
    center_location:'',
    object_id:0,
    base_url:'',
    accounting_code:'skill_code',
    module_url:'',
    stored_accounting_structure:'',
    prog_form_html:'',
    rules_labels:'',
    rules_content:'',
    active_subform:false,
    validate_message:'Per poterti registrare devi acquistare almeno o la Skill Card o degli esami'
};