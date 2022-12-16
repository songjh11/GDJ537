//nullCheck 함수
function nullCheck(data){
    if(data == null || data == ''){
        return false;
    }else{
        return true;
    }
}

console.log("s");
let frm = document.getElementById("frm");
let plus = document.getElementsByClassName("plus");
console.log(plus);
console.log(plus.length);
let total = document.getElementById("total");
let account = document.getElementById("account");
let sum = 0 ;

for(let i=0; i<plus.length; i++){
    plus[i].addEventListener("blur",function(){
        console.log(plus[i].value);
        sum = sum + Number(plus[i].value);
       abc(sum);
    })
}

function abc(sum){
    total.value = sum;
}


function checkAll(){
    let result = nullCheck(total.value);
    let result2 = nullCheck(account.value);
    let result3 = nullCheck($("#cdate").val());
    let result4 = nullCheck($("#title").val());
    let result5 = nullCheck($("#account").val());
    if(result&&result2&&result3&&result4&&result5){
        frm.submit();
    }else{
        alert("정보를 입력해주세요");
    }
}
