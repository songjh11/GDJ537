
console.log("s");

let plus = document.getElementsByClassName("plus");
console.log(plus);
console.log(plus.length);
let total = document.getElementById("total");
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
