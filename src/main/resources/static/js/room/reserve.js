const btn = document.getElementById("resBtn");
const frm = document.getElementById("frm");
const startTime = document.getElementById("start");
const endTime = document.getElementById("end");
const date = document.getElementById("reserveDate");

startCheck = true;
endCheck = true;
deatCheck = true;

date.addEventListener("blur", function () {
    console.log(date.value);
})

startTime.addEventListener("blur", function () {
    console.log(startTime.value);

    $(".startList").each(function () {
        var b = $(this).val();

        // console.log("b: " + b);

        console.log(b == startTime.value);
        if ((b == startTime.value) == true) {
            alert("이미 예약된 시간입니다.");
            startCheck = false;
        }
        else {
            startCheck = true;
        }
    })
});

endTime.addEventListener("blur", function () {
    console.log(startTime.value.substr(0, 2));
    let st = parseInt(startTime.value.substr(0, 2));
    if (st == 0) {
        st = 12;
    }
    console.log("st: " + st); // 시작 숫자

    let end = parseInt(endTime.value.substr(0, 2))
    if (end == 0) {
        end = 12;
    }
    console.log("endTime: " + end); // 종료 숫자
    
    if (end < st) {
        alert("유효하지 않은 시간대입니다.");
        endCheck = false;
    }
    else {
        endCheck = true;
    }
})

btn.addEventListener("click", function () {
    let a = confirm("정말 예약하시겠습니까?");
    console.log(a);

    if (a == true && startCheck == true && endCheck == true) {
        frm.submit();
    }
    else {
        alert("조건을 충족하지 못하였습니다.");
    }
})

