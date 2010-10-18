
var substate  = {
    _init: function() {
        if(this.options.user_login!='anonymous'){

            this._renderInterface();

            if(this.options.admin){
                this._loadSubscribersList();
                this._exportData();
            }
            else{
                this._subscriptionState();
                this._accountingState();
            }
            this._setupEventDelegation();
        }
    },
    subscribe:function(){
        var self=this;
        var options=this.options;
        var accounting_code;
        var exams_list=new Object();
        var n_exams=0;
        if (options.accounting_code=='')
            accounting_code=self.element.find('input#accounting_code').val();
        else
            accounting_code=options.accounting_code;
        
        if (accounting_code=='')
            alert('Devi inserire il codice della skill card');
        else{
            var action='msubscription::subscribe::'+this.getCourseId()+'::'+accounting_code;

            self.element.find('.exam_item:checked').each(function(){
                n_exams+=1;
                exams_list[$(this).attr('id')]=$(this).val();
            });
         if (n_exams==0) {alert('Devi selezionare almeno un esame'); return false;}

            $.ez(action,{
                postdata:JSON.stringify(exams_list)
            },function(){
                self._subscriptionState();
                self._accountingState();
                self._renderAccountingForm();
            });
        }
    },
    unsubscribe:function(){
        var self=this;
        var action='msubscription::unsubscribe::'+this.getCourseId();
        $.ez(action,{
            postdata:'ready'
        },function(){
            self._subscriptionState();
        });
    },
    getCourseId: function() {
        return this._getData('courseId');
    },
    _subscriptionState:function(){
        var action='msubscription::isSubscribed::'+this.getCourseId();
        var self=this;

        $.ez(action,{
            postdata:'ready'
        },function(data){
            self._setData('state',data.content);
            self._countSubscribers();
        });
         
    },
    _accountingState:function(){
        var self=this;
        var action='msubscription::hasAccount';

        $.ez(action,{
            postdata:'ready'
        },function(data){
            self._setData('accounting_state',data.content.reg_status);
            self._setData('accounting_code',data.content.accounting_code);
            self._renderAccountingForm();
        });
    },
    _setButtonsState:function(state_subscribe,state_unsubscribe){
        
        $('button#subscribe').attr('disabled',state_subscribe);
        $('button#unsubscribe').attr('disabled',state_unsubscribe);
        if(state_subscribe) $('.checkbox_list').hide();
        else $('.checkbox_list').show();

    },
    _sendMessage:function(message){
        this.element.find('p#message').text(message);
    },
    _setSubscriptionState: function() {
        var color='red';

        if ((this.options.state)){
            color='green';
            this._setButtonsState(true, false);
        }else{
            this._setButtonsState(false, true);
        }
       
        if (this.options.full) this._setButtonsState(true,false);
       
        if (!this.options.accounting_state){
            this._setButtonsState(true, true);
            this._sendMessage('Devi acquistare gli esami prima di poterti sottoscrivere');
        }
        this.element.find('div#semaphore').css({
            background: color
        });
    },
    _countSubscribers:function(){
        var self=this;
        var action='msubscription::countSubscribers::'+this.getCourseId();
        $.ez(action,{
            postdata:'ready'
        },function(data){
            self._setData('subscribers_number',data.content);
            if(data.content>=self.options.max_subscribers) self._setData('full',true);
            else self._setData('full',false);
            self.element.find('#n_subscriptions').trigger('count');
            self._setSubscriptionState();
        })
    },
    _renderSubscribersNumber:function(e){
        $(e.target).text(e.data.body.options.subscribers_number+'/'+e.data.max_sub);
 
    },
    _checkAllSubscribers:function(){
       
        this.element.find('input.select').each(function(){
            $(this).attr('checked',!$(this).attr('checked'));
        })
    },
    _renderAccountingForm:function(){
        var self=this;
        var options=this.options;
        
        if(options.accounting_code=='')
            self.element.find('div#accounting_form').show();
        else
            self.element.find('div#accounting_form').hide();

    },
    _renderInterface:function(){
        var self=this;
        var options=this.options;
        var $interface,$n_subscriptions,buttons,semaphore,message,accounting_code
        ,$accounting_code;

        accounting_code='<div id="accounting_form"><label>Codice skill card</label>'
        accounting_code+='<input id="accounting_code" type="text"/></div>';
        semaphore='<p class="label">'+options.subscription_state+'</p>';
        semaphore+='<div id="semaphore"></div>';
        semaphore+='<p class="label">'+options.subscribed_users+'</p>';
        message='<div><p id="message"></p></div>';
        if (options.admin){
            this._renderAdminInterface(self.element);
        }else{
            $(semaphore).appendTo(self.element);
            $n_subscriptions=$('<div id="n_subscriptions"></div>').appendTo(self.element);
            $n_subscriptions.bind('count',{
                body:self,
                max_sub:options.max_subscribers
            },self._renderSubscribersNumber);
            $interface=$('<div id="substate_edit"></div>').appendTo(self.element);
            buttons = "<div class=\"subscription-buttons\">\
                    <button id=\"subscribe\">Iscriviti </button>\
                    <button id=\"unsubscribe\"> Disiscriviti</button>\
                    </div>";
            $(buttons).appendTo($interface);
            $accounting_code=$(accounting_code).appendTo($interface);
            $accounting_code.hide();
            $(message).appendTo($interface);
            self._renderExamsList($interface);
            self.element.find("#subscribe").click(function(){
                self.element.substate('subscribe');
                return false;
            });
            self.element.find("#unsubscribe").click(function(){
                self.element.substate('unsubscribe');
                return false;
            });
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
    _exportData:function(){
        var self=this;
        var options=this.options;
        var action=options.module_url+'/csv/'+options.courseId+'/'+options.courseId+'/subscription';
        var $csv=self.element.find('#csv');

        $('<a href="'+action+'">Download Csv</a>').appendTo($csv);
    },
    _sendUsersEmail:function($emailForm){
         
        var users_email=new Array();
        var email_message,post_data;

        email_message=$emailForm.find('textarea').val();

        this.element.find('.select:checked').each(function(){
            users_email.push($(this).val());
        });
        post_data=JSON.stringify({
            'email_message':email_message,
            'users_email':users_email
        });
        $.ez('msubscription::sendUserMessage::'+this.getCourseId(),{
            postdata:post_data
        });
    },
    _loadSubscribersList:function(){
        var self=this;
        var action='msubscription::listSubscribers::'+this.getCourseId();
        var $usersTable=self.element.find('.users_list');
        $.ez(action,{
            postdata:'ready'
        },function(data){
            self._renderSubscribersList(data.content,$usersTable);
        })
    },
    _renderExamsList:function($interface){
        var options=this.options;
        var form='<div class="checkbox_list">';
        for (var i in options.available_exams){
            form+='<input class="exam_item" type="checkbox" id="'+options.available_exams[i].id+
            '" value="'+options.available_exams[i].name+'"/>'+options.available_exams[i].name+'<br />';
        }
        form+='</div>';
        $(form).appendTo($interface);
    },
    _renderSubscribersList:function(list,$usersTable){
          
        for (var i in list){
            this._renderSubscriber(list[i],$usersTable);
        }
    },
    _renderSubscriber:function(subscriber,$usersTable){
        var $user,userline;
        userline='<tr id="'+subscriber.userID+'" class="user_entry">\n\
                        <td><input  class="select" id="'+subscriber.userID+'" type="checkbox" value="'+subscriber.email+'"/></td>\n\
                        <td>'+subscriber.name+'</td>\n\
                        <td>'+subscriber.surname+'</td>\n\
                        <td>'+subscriber.email+'</td>\n\
                        <td>'+subscriber.username+'</td>\n\
                        <td>'+subscriber.userID+'</td>\n\
                        <td><button class="unsubscribe">Rimuovi</button>\n\
                            <button class="info">Info</button></td>\n\
                        </tr>';

        $user=$(userline).appendTo($usersTable);
        $user.data('subscriber',subscriber);
    },
    _removeSubscriber:function($target){
        var $subscriber=$target.closest('tr');
        var subscriber=$subscriber.data('subscriber');
        var action='msubscription::removeSubscriber::'+this.getCourseId()+'::'+subscriber.userID+'::'+subscriber.email;
        $.ez(action,{postdata:'ready'});
        $subscriber.remove();
    },
    _showSubscriberInfo:function($target){
        var $subscriber=$target.closest('tr');
        var subscriber=$subscriber.data('subscriber');
        var $dialog,$list,exams_list;
        exams_list=eval('('+subscriber.exams_list+')');

        $dialog=$('<div id="info_dialog"></div>').appendTo($target);
        $list=$('<ul class="list"></ul>"').appendTo($dialog);
        for (var i in exams_list){
          
            $('<li>'+exams_list[i]+'</li>').appendTo($list);
        }
        $dialog.dialog({
            bgiframe: true,
            modal: true,
            buttons: {
                Ok: function() {
                    $(this).dialog('close');
                }
            }
        });

          
    },

    //*****************************************************************************************
    // Global event delegation setup. I'm doing this in order not to bind an event
    // to each subscriber's table line
    //
    //*****************************************************************************************

    _setupEventDelegation : function() {
        var self = this;
        var options = this.options;
        this.element.click(function(event){
            var $target=$(event.target);
            if ($target.hasClass('unsubscribe')) {
                    
                self._removeSubscriber($target)
            }
            if ($target.hasClass('info')) {

                self._showSubscriberInfo($target)
            }

        });
    }
};

$.widget("ui.substate", substate);

$.ui.substate.defaults ={
    courseId:2,
    state:false,
    accounting_state:false,
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
    user_login:'',
    subscribers_number:0,
    max_subscribers:0,
    subscription_state:'',
    subscribed_users:'',
    full:false,
    accounting_code:'',
    available_exams:'',
    module_url:''
};