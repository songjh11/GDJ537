let frm = document.getElementById("frm");

function nullCheck(data){
    if(data == null || data == ''){
        return false;
    }else{
        return true;
    }
}

let caca = false;

function vacaNullCheck(){
    let s1 = document.getElementById("s1");
    let s2 = document.getElementById("s2");
    let s3 = document.getElementById("s3");
    let s4 = document.getElementById("s4");
    let s5 = document.getElementById("s5");
    if(s1||s2||s3||s4||s5){
        caca = true
    }else{
        caca = false;
    }
    let result2 = nullCheck($("#sasa").val())
    let result3 = nullCheck($("#start").val())
    let result4 = nullCheck($("#stop").val())
    if(caca&&result2&&result3&&result4){
        frm.submit();
    }else{
        alert("종류, 사유, 기간을 확인해주세요!");
    }
}
