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

const y1 = document.querySelector("#y1");   // 시작 년
const m1 = document.querySelector("#m1");   // 시작 월
const d1 = document.querySelector("#d1");   // 시작 일

const y2 = document.querySelector("#y2");   // 끝 년
const m2 = document.querySelector("#m2");   // 끝 월
const d2 = document.querySelector("#d2");   // 끝 일

const y3 = document.querySelector("#y3");   // 신청일의 년
const m3 = document.querySelector("#m3");   // 신청일의 달
const d3 = document.querySelector("#d3");   // 신청일의 일

//자바스크립트 에서는 date형식을 사용할때 0월~11월과 같은형식이므로
// +1을 해줘야하지만 number타입으로 사용해서 필요없음

// 시작 년/월/일의 밸류
let yv1 = y1.value;
let mv1 = m1.value;
let dv1 = d1.value;

// 끝 년/월/일의 밸류
let yv2 = y2.value;
let mv2 = m2.value;
let dv2 = d2.value;

// 신청일의 숫자들을 date형식으로 바꿔서 디비에 넣어보자
let yv3 = y3.value;
let mv3 = m3.value;
let dv3 = d3.value;

// s = s.replace(/(\d{4})(\d{2})(\d{2})/g, '$1-$2-$3');

// 시작 년/월/일의 합 (숫자형식)
let bef = yv1 + mv1 + dv1;

// 끝 년/월/일의 합 (숫자형식)
let aft = yv2 + mv2 + dv2;

// 신청일의 년/월/일을 합침
let sumD = yv3 + mv3 + dv3;

console.log("과연? " , sumD.replace(/(\d{4})(\d{2})(\d{2})/g, '$1-$2-$3'));


console.log("1번째 연 월 일", y1.value + m1.value + d1.value);

console.log("숫자일까? ", Number(bef))

console.log("뺄셈 : ", Number(aft) - Number(bef));


$(".mail").click(function(){

    console.log("라디오버튼 클릭");
    console.log("현재 누른것 : " , $(this).val());
    console.log("data속성 : " ,$(this).attr("data-radio"))

    
    let hi = $(this).attr("data-radio");
    $("#checkRadio").val(hi);
    console.log("hi ===>>>" , hi)

    console.log("인풋에 담겨" , $("#checkRadio").val(hi));

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

//선택한것이나 쓴것을 밸류에 담기

$("#dayGap").val((Number(aft) - Number(bef))+'일');
console.log($("#dayGap").val());

$("#dateParse").val(sumD.replace(/(\d{4})(\d{2})(\d{2})/g, '$1-$2-$3'));
console.log("dateParse : ", sumD.replace(/(\d{4})(\d{2})(\d{2})/g, '$1-$2-$3'));


$("#vcaBtn").click(function(){

    console.log("제출 버튼 클릭");
    $("#vcaFrm").submit();

});



