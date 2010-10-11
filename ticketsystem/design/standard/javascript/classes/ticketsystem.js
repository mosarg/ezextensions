var ticketsystem  = {
    _init: function() {
        var self=this;
        self._renderInterface();
    },
    _renderInterface:function(){
        var self=this;
        var state_options=self.options.state_options;
        var $select;
        $select=$('<select></select>');

        for (var i in state_options){
            $('<option value="'+state_options[i].id+'">'+state_options[i].name+'</option>').appendTo($select);
        }
          
        var $assegnee=self.element.find('.assegnee');

        var $acquire_button=$assegnee.append($('<button>Prendi in carico</button>')).
        click(
            function(event){
                self._acquireTicket(event,$(this).attr('title'));
            }
            ).
        each(
            function(){
                if($(this).children('span').html().length>5){
                    $(this).children('button').attr('disabled','disabled');
                }
            });

       

        self.element.find('.state').append($select).change(function(event){
            self._changeTicketState(event,$(this).attr('title'));
        });
    },
    _changeTicketState:function(event,object_id){
        var $select=$(event.target);
        var new_state=$select.val();
        var state_label=$select.children('option:selected').text();
        var options=this.options;
        var $cell=$(event.target).parent('td');
        var ezaction='ticketsystem::changeTicketState::'+object_id+'::'+new_state+'::'+options.node_id
        $.ez(ezaction,{
            postdata: 'ready'
        },
        function(data){
            $cell.children('span').html(state_label);
        });
    },
    _acquireTicket:function(event,object_id){
     
        var options=this.options;
        var $cell=$(event.target).parent('td');
        var post_data=JSON.stringify({
            'object_id':object_id,
            'node_id':options.node_id
        });
        var ezaction='ticketsystem::acquireTicket::'+object_id+'::'+options.node_id
        $.ez(ezaction,{
            postdata: post_data
        },
        function(data){
            $cell.children('span').html(options.current_user_name);
            $cell.children('button').attr('disabled','disabled');
        });
    }
}


$.widget("ui.ticketsystem", ticketsystem);

$.ui.ticketsystem.defaults ={
    node_id:2,
    object_id:2,
    current_month:''
};