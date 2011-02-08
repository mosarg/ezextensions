var classint  = {
    _init: function() {
        if(this.options.isTeacher){
            this._renderInterface();
            
        }
    },
    _renderInterface:function(){
        var self=this;
        var buttons,$buttons,$remove_button;
        buttons='<div class="buttons"><button id="show_std">Mostra studenti</button>'
        $buttons=$(buttons).prependTo(self.element);

        self.element.find('#hide').hide();
       
        $buttons.find('#show_std').click(function(){
           var show_button=this;
           self.element.find('#hide').show();
           $(show_button).attr('disabled','true');
           $remove_button=$('<button id="show_std">Nascondi</button>').appendTo($buttons);
           $remove_button.click(function(){
               $(show_button).removeAttr('disabled');
               self.element.find('#hide').hide();
               $remove_button.remove();
               
           });
        });
        self.element.find('#email_form button').click(function(){
            self._sendUsersEmail();

        });
    },
    _sendUsersEmail:function(){
        var self=this;
        var $emailForm=this.element.find('#email_form')
        var users_email=new Array();
        var email_message,post_data;

        email_message=$emailForm.find('textarea').val();

        this.element.find('.select:checked').each(function(){
            users_email.push($(this).val());
        });
        post_data=JSON.stringify({
            'email_message':email_message,
            'users_email':users_email,
            'email_subject':self.options.emailSubject
        });
        $.ez('scuola::sendUserMessage::'+this.options.classId,{
            postdata:post_data
        });
    }
    
};

$.widget("ui.classint", classint);

$.ui.classint.defaults ={
      isTeacher:false,
      classId:0,
      emailSubject:''
  };
