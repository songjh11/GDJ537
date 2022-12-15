
let frm = document.getElementById("frm");

function nullCheck(data){
    if(data == null || data == ''){
        return false;
    }else{
        return true;
    }
}

function sorryNullCheck(){
    let result = nullCheck($("#text").val());
    if(result){
        frm.submit();
    }else{
        alert("위반내용은 필수입니다.");
    }
}