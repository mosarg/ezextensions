(function($){
    $.fn.removeTempUser = function(user_module) {
        this.bind('beforeunload', function() {
            if (cancelOnUpload){
                $.ajax({
                    async:false,
                    url:user_module,
                    type:'POST',
                    data:{
                        CancelButton:'Discard'
                    },
                    success:function(){
                        cancelOnUpload=false;
                    }
                });
            }
        }
        );
    }
    var passwordStrength = new function()
    {
        this.countRegexp = function(val, rex)
        {
            var match = val.match(rex);
            return match ? match.length : 0;
        }
        this.getStrength = function(val, minLength)
        {
            var len = val.length;
            // too short =(
            if (len < minLength)
            {
                return 0;
            }
            var nums = this.countRegexp(val, /\d/g),
            lowers = this.countRegexp(val, /[a-z]/g),
            uppers = this.countRegexp(val, /[A-Z]/g),
            specials = len - nums - lowers - uppers;
            // just one type of characters =(
            if (nums == len || lowers == len || uppers == len || specials == len)
            {
                return 1;
            }
            var strength = 0;
            if (nums)	{
                strength+= 2;
            }
            if (lowers)	{
                strength+= uppers? 4 : 3;
            }
            if (uppers)	{
                strength+= lowers? 4 : 3;
            }
            if (specials) {
                strength+= 5;
            }
            if (len > 10) {
                strength+= 1;
            }
            return strength;
        }

        this.getStrengthLevel = function(val, minLength)
        {
            var strength = this.getStrength(val, minLength);
            switch (true)
            {
                case (strength <= 0):
                    return 1;
                    break;
                case (strength > 0 && strength <= 4):
                    return 2;
                    break;
                case (strength > 4 && strength <= 8):
                    return 3;
                    break;
                case (strength > 8 && strength <= 12):
                    return 4;
                    break;
                case (strength > 12):
                    return 5;
                    break;
            }
            return 1;
        }
    }



    var fancyLogin={
        _init:function(){
            this._hideFields();
            this._initPasswordField();
            this._toggleOptional();
        },
        _hideFields:function(){
            var self=this;
            self.element.find('.account_status').hide();
        },
        _initPasswordField:function(){
            var self=this;
            var options=self.options;
            var $password_field_hidden=self.element.find('input[type="password"]');
            var $password_strength=self.element.find('div.password_strength');

            self.element.find('input#password_field_clear').keyup(function(event){
                //alert($(event.target).val());
                var current_password=$(event.target).val();
                var level=passwordStrength.getStrengthLevel(current_password, options.minLength);
                $password_strength.html(options.texts[level]).attr('class' ,options.cssStyle+' password_strength_'+level);

                $password_field_hidden.each(
                    function(){
                        $(this).val(current_password);
                      
                    }
                    );
            })
        },
        _toggleOptional:function(){
            var self=this;
            var options=self.options;

            if(options.hideoptional){
                self.element.find('.optional').each(function(){
                    var $toggle;
                    var $attribute=$(this);
                    $toggle=$('<a class="optional_field rounded shadow"> '+options.strings['show']+' '+
                        $attribute.children('h4').text()+'</a>').insertBefore($attribute);
                    $attribute.hide();
                    $toggle.toggle(
                        function(){
                            $attribute.fadeIn();
                        },
                        function(){
                            $attribute.fadeOut();
                        });
                });
            }
        }
    }

    $.widget("ui.fancyLogin", fancyLogin);

    $.ui.fancyLogin.defaults ={
        texts : {
            1 : 'Too weak',
            2 : 'Weak password',
            3 : 'Normal strength',
            4 : 'Strong password',
            5 : 'Very strong password'
        },
        minLength : 6,
        cssStyle:'rounded password_strength shadow',
        strings:{
            show:'Inserisci'
        },
        hideoptional:true

    };

})(jQuery);


