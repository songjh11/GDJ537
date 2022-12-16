
// 예약자 번호 숫자형으로 변환
var memNum = $("#member").val();
let tt = parseFloat(memNum);
$("#member").val(tt);

console.log(memNum);

$.ajax({
    url: './roomReserve',
    type: 'GET',
    data: {
        memberNum: memNum
    },
    success: function (rs) {
        console.log(rs);
        if (rs == null) {
            alert("예약하려면 로그인이 필요합니다.")
            history.back();
        }
    },
    error: function (status, error) {
        console.log(status);
        console.log(error);
    }
})

// -----------------------------------------
const btn = document.getElementById("resBtn");
const frm = document.getElementById("frm");
const startTime = document.getElementById("start");
const endTime = document.getElementById("end");
const purpose = document.getElementById("purpose");
const startText = document.getElementById("startText");
const endText = document.getElementById("endText");
const purposeText = document.getElementById("purposeText");

let today = new Date();

startCheck = false;
endCheck = false;
purposeCheck = false;

startTime.addEventListener("blur", function () {
    console.log(startTime.value);

    var startDate = startTime.value.toString().substr(0, 10);
    console.log(startDate);

    let y = parseFloat(startDate.split('-')[0]);
    let m = parseFloat(startDate.split('-')[1]);
    let d = parseFloat(startDate.split('-')[2]);
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

    // console.log(y < year);
    // console.log(m < month && y == year);
    // console.log(d < da && m == month && y == year);

    if (y < year || (m < month && y == year) || (d < da && m == month && y == year)) {
        alert("선택할 수 없는 날입니다.");
        console.log("시작 날 선택 - " + startCheck);
    }
    else {
        startCheck = true;
    }
    // 반납날짜 disabled 하는 조건
    if (startTime.value != '' && startCheck == true) {
        endTime.disabled = false;
    }
    if (startCheck == false) {
        endTime.disabled = true;
    }

    // blur 시 빈칸일 때
    if (startTime.value == '') {
        startText.style.display = 'block';
        startCheck = false;
    }
    else {
        startText.style.display = 'none';
        startCheck = true;
    }
})

function CalculatorEndTime() {
    var startDate = startTime.value.toString().substr(0, 10);
    var endDate = endTime.value.toString().substr(0, 10);

    console.log(endDate);

    let y = parseFloat(endDate.split('-')[0]);
    let m = parseFloat(endDate.split('-')[1]);
    let d = parseFloat(endDate.split('-')[2]);
    if (d < 10) {
        d = d % 10;
    }

    let year = parseFloat(startDate.split('-')[0]);
    let month = parseFloat(startDate.split('-')[1]);
    let da = parseFloat(startDate.split('-')[2]);

    if (y < year || (m < month && y == year) || (d < da && m == month && y == year)) {
        alert("선택할 수 없는 날입니다.");
        dateCheck = false;
        console.log("이전날 선택 - " + dateCheck);
    }
    else {
        dateCheck = true;
    }

    let st = parseInt(startTime.value.substr(11, 15));
    if (st == 0) {
        st = 12;
    }
    console.log("st: " + st); // 시작 숫자

    let end = parseInt(endTime.value.substr(11, 15))
    if (end == 0) {
        end = 12;
    }
    console.log("endTime: " + end); // 종료 숫자

    // 시간 계산
    if (startTime.value == endTime.value) {
        alert("동일한 시간은 사용할 수 없습니다.");
        endCheck = false;
        console.log("시간 동일 - " + endCheck)
        return false;
    }
    else { // 날짜, 시간이 동일하지 않을때
        // 같은 날에 종료 시간이 시작 시간보다 커야 함
        // 또는
        // 같은 날 종료 시간과 시작 시간이 동일하고 시작분이 종료 분보다 작아야 함
        if (d == da && end < st || (d == da && end == st && a > b)) {
            alert("시작 시간보다 빨리 끝날 수 없습니다.");
            endCheck = false;
            console.log("종료시간이 시작보다 빠름 - " + endCheck);
            return false;
        }
        else {
            endCheck = true;
        }
    }

    // 날짜의 요일 구하기
    var week = new Array('일', '월', '화', '수', '목', '금', '토');
    var dayWeek = new Date(endDate).getDay();
    var todayLabel = week[dayWeek];

    console.log("선택한 요일은 : " + todayLabel);
    if (todayLabel == '일' || todayLabel == '토') {
        alert("주말은 선택할 수 없습니다.");
        holidayCheck = false;
        return false;
    }
    else {

        if (end < st) {
            alert("유효하지 않은 시간대입니다.");
            endCheck = false;
            console.log("종료시간이 시작보다 빠름 - " + endCheck);
        }
        else {
            // console.log(endTime.value);
            // console.log(startTime.value);
            let startSub = (startTime.value.substr(11)).substr(3, 4);
            // console.log(startSub);
            let endSub = (endTime.value.substr(11)).substr(3, 4);
            // console.log(endSub);

            // 분 계산
            let a = parseFloat(startSub)
            let b = parseFloat(endSub)
            // console.log(a >= b);
            if (end == st && a > b) {
                alert("유효하지 않은 시간대입니다.");
                endCheck = false;
                console.log("시간동일 분 계산 - " + endCheck);
            }
            else {
                endCheck = true;
            }
        }
    }
};

endTime.addEventListener("blur", function () {
    CalculatorEndTime();

    // blur 시 빈칸일 때
    if (endTime.value == '') {
        endText.style.display = 'block';
        endCheck = false;
    }
    else {
        endText.style.display = 'none';
        endCheck = true;
    }
})

purpose.addEventListener("click", function () {
    console.log("사용목적 클릭시")
    CalculatorEndTime();
    console.log("startTime: " + startCheck);
    console.log("endTime: " + endCheck);
})

purpose.addEventListener("blur", function () {
    if ((purpose.value) != '') {
        purposeCheck = true;
    }

    // blur 시 빈칸일 때
    if (purpose.value == '') {
        purposeText.style.display = 'block';
        purposeCheck = false;
    }
    else {
        purposeText.style.display = 'none';
        purposeCheck = true;
    }
})

btn.addEventListener("click", function () {
    let a = confirm("정말 예약하시겠습니까?");

    if (a == true && startCheck == true && endCheck == true && purposeCheck == true) {
        frm.submit();
    }
    else if (a == false) {
        alert("취소하였습니다.");
    }
    else {
        alert("조건을 충족하지 못하였습니다.");
    }
})

