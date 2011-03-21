
$(document).ready(function(){
    onSelectChange();
    $(".selector_root").change(onSelectChange);
});

function onSelectChange(){
    var selected = $(".selector_root option:selected");
    $(".select_source_root option").each(function (i){
        regexp = new RegExp(selected.val(), "ig")
        if (!this.value.match(regexp)){
            $(this).hide();
        }else{
            $(this).show();
        }

    });
}