let am = document.getElementById("am");
let pm = document.getElementById("pm");
let frm = document.getElementById("frm");

function checkAll(){
    let result = nullCheck(am.value);
    let result2 = nullCheck(pm.value);
    if(result&&result){
        frm.submit();
    }else{
        alert("오전, 오후를 작성해주세요");
    }
}