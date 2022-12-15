
$('input[name=id]').click(function(){
    if($('input[name=id]:checked').val() == 'CA') {
        $('#carChecked').css("display","inline");
    }else{
        $('#carChecked').css("display", "none");
    }

})