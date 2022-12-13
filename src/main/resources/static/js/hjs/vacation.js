console.log("vacation.js")

function nullCheck(data, dest, kind){
    if(data == null || data == ''){
        $(dest)
        return false;
    }else{
        return true;
    }
}

let results = [false, false, false, false, false, false, false];


$(".mail").click(function(){

    console.log("라디오버튼 클릭");
    console.log("현재 누른것 : " , $(this).val());

});

$(".mail").change(function(){


    console.log("라디오 버튼 체인지");

    let gab = $(this).val();

    if(!gab){
        alert("사유를 고르셔야 합니다.")
    }else{
        
    }

});

$("#textArea").blur(function(){

    let result = nullCheck($("#textArea").val());

    if(!result){
        alert("사유 입력은 필수입니다.")
    }

});


$("#callInput").blur(function(){

    console.log("비상연락망");

    let result = nullCheck($("#callInput").val());

    if(!result){
        alert("비상연락망을 적어주세요.")
    }


});

$("#vcaBtn").click(function(){

    console.log("제출 버튼 클릭");

});



