let frm = document.getElementById("frm");

function nullCheck(data){
    if(data == null || data == ''){
        return false;
    }else{
        return true;
    }
}

let cateCheck = document.getElementsByClassName("mail")

function vacaNullCheck(){
 let caCh = false;
    for(let i=0; i<cateCheck.length; i++){
        if(cateCheck[i].checked == true){
            caCh = true;
        }
    }
    let result2 = nullCheck($("#sasa").val())
    let result3 = nullCheck($("#start").val())
    let result4 = nullCheck($("#stop").val())
    if(caCh&&result2&&result3&&result4){
        frm.submit();
    }else{
        alert("종류, 사유, 기간을 확인해주세요!");
    }
}
