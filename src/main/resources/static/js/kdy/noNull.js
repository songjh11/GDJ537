let frm = document.getElementById("frm");

function nullCheck(data){
    if(data == null || data == ''){
        return false;
    }else{
        return true;
    }
}

function workReportNullCheck(){
    console.log($("#am").val())
    console.log($("#pm").val())
    let result = nullCheck($("#am").val());
    let result2 = nullCheck($("#pm").val());
    if(result&&result2){
        frm.submit();
    }else{
        alert("오전, 오후 입력란은 필수입니다.");
    }
}