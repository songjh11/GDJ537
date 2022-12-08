const btn = document.getElementById("resBtn");
const frm = document.getElementById("frm");
const startTime = document.getElementById("start");
const endTime = document.getElementById("end");
const date = document.getElementById("reserveDate");
let today = new Date();

startCheck = true;
endCheck = true;
dateCheck = true;

date.addEventListener("blur", function () {
    console.log(date.value);
    let y = parseFloat(date.value.split('-')[0]);
    let m = parseFloat(date.value.split('-')[1]);
    let d = parseFloat(date.value.split('-')[2]);
    if (d < 10) {
        d = d % 10;
    }

    let year = parseFloat(today.getFullYear()); // 년도
    let month = parseFloat(today.getMonth() + 1);  // 월
    let da = parseFloat(today.getDate());  // 날짜

    // 선택할 수 없는 것 만들기

    // 연도 - 선택한 연도가 현재 연도보다 작아야 함
    // 달 - 현 연도 에서 이전 달은 선택 못함
    // 일 - 현 연도, 달에서 이전 일은 선택 못함
    console.log(y < year);
    console.log(m < month && y == year);
    console.log(d < da && m == month && y == year);

    if (y < year || (m < month && y == year) || (d < da && m == month && y == year)) {
        alert("선택할 수 없는 날입니다.");
        dateCheck = false;
    }
    else {
        dateCheck = true;
    }
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
    // console.log(a);

    if (a == true && startCheck == true && endCheck == true && dateCheck == true) {
        frm.submit();
    }
    else {
        alert("조건을 충족하지 못하였습니다.");
    }
})

