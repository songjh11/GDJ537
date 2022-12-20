
// 예약자 번호 숫자형으로 변환
var memNum = $("#member").val();
let tt = parseFloat(memNum);
$("#member").val(tt);

// ----------------------------------------
// 로그인을 하지 않았을 시 예약하는 페이지로 넘어가지 못하게
$.ajax({
    url: './roomReserve',
    type: 'GET',
    data: {
        memberNum: memNum
    },
    success: function (rs) {
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

let today = new Date(); // 오늘 날짜 생성

startCheck = false;          // 예약 시작 시간 - 오늘보다 이전 일들을 선택했을 때 false
startValueCheck = false;     // 예약 시작 시간에서 선택한 값이 없을 때 false
endCheck = false;            // 예약 종료 시간 - 예약 시작 시간보다 이전 일들을 선택했을 때 false
endValueCheck = false;       // 예약 종료 시간에서 선택한 값이 없을 때 false
purposeCheck = false;        // 사용 목적의 value가 빈 칸일때
timeCheck = false;           // 예약 시간이 중복될 때 false
holidayCheck = false;        // 주말 선택시 false
betweenDayCheck = false;     // 내가 선택한 예약 시간 사이에 예약이 존재하면 false

startTime.addEventListener("blur", function () {
    var startDate = startTime.value.toString().substr(0, 10);

    let y = parseFloat(startDate.split('-')[0]); // 선택한 연도
    let m = parseFloat(startDate.split('-')[1]); // 선택한 월
    let d = parseFloat(startDate.split('-')[2]); // 선택한 일
    if (d < 10) {
        d = d % 10; // 선택한 일이 10보다 작을 때 일을 10으로 나눈 나머지 값으로 만들기
        // ex) 01 -> 1
    }

    let year = parseFloat(today.getFullYear()); // 오늘의 연도
    let month = parseFloat(today.getMonth() + 1);  // 오늘의 월
    let da = parseFloat(today.getDate());  // 오늘 일

    // 선택할 수 없는 것 만들기 - 유효성 검사
    // 연도 - 선택한 연도가 현재 연도보다 같거나 커야 함 - 선택한 연도가 현재 연도보다 작으면 에러
    // 달 - 연도 조건 충족 + 이전 달은 선택 못함 - 연도 조건 충족 + 선택한 달이 같거나 커야 함
    // 일 - 연도, 달 조건 충족 + 이전 일은 선택 못함 - 연도, 달 조건 충족 + 선택한 일이 같거나 커야 함

    // 선택한 연도 < 오늘 연도 || (연도가 같을 때 && 선택한 달 < 오늘 달) || 연도, 달 동일, 선택한 일이 오늘 일보다 전일 일때
    if (y < year || (m < month && y == year) || (d < da && m == month && y == year)) {
        alert("선택할 수 없는 날입니다.");
        startCheck = false;
        console.log("시작 날 선택 - " + startCheck);
        
        return false;
    }
    else {
        startCheck = true;
    }

    // -------------------------------------------------------------
    // 이미 예약된 시간 확인 - 선택한 시작 시간 -> 값을 비교하기 위해 숫자형으로 변환한다.
    var restart = startTime.value.replace('T', '');
    var restar = restart.replace(/-/gi, '');
    var rest = restar.replace(':', '');
    var selectStartTime = parseFloat(rest); // 내가 선택한 예약 시작 시간을 숫자형으로 변환

    // 선택한 종료시간
    var reend = endTime.value.replace('T', '');
    var reen = reend.replace(/-/gi, '');
    var ree = reen.replace(':', '');
    var selectEndTime = parseFloat(ree); // 내가 선택한 예약 종료 시간을 숫자형으로 변환

    // console.log("선택한 시작 시간: " + rest);

    $(".timeCheck").each(function () {
        // 현재 DB에 저장되어 있는 예약된 시간 가져오기
        // 예약 시작 시간 숫자형으로 변환
        var a = $(this).children('.startTimeCheck').val().replace('T', '');
        var a1 = a.replace(/-/gi, '');
        var stTime = a1.replace(':', '');
        var startTimeNumber = parseFloat(stTime);

        // 예약 종료 시간 숫자형으로 변환
        var b = $(this).children('.endTimeCheck').val().replace('T', '');
        var b1 = b.replace(/-/gi, '');
        var eTime = b1.replace(':', '');
        var endTimeNumber = parseFloat(eTime);

        // 숫자형으로 변환하여 비교하기 - DB에 저장되어 있으면 사용할 수 없도록 설정
        if (startTimeNumber < selectStartTime && selectStartTime <= endTimeNumber) {
            alert("이미 예약된 시간입니다.");
            timeCheck = false;
            return false;
        }
        else {
            timeCheck = true;
        }

        // 전체 예약시간 안에 예약된 날짜 있으면 안되게 하기
        // -> 선택한 예약 시작날과 종료날 사이에 예약된 날짜가 있으면 alert
        // 내가 선택 - 예약 시작 startDate || 예약 종료일 endDate
        // 예약된 시간 - startTimeNumber, endTimeNumber
        // startDate <  startTimeNumber  < endDate ?
        // -> alert("중간에 예약된 날이 존재합니다.");

        var imchooseStartDate = startTime.value.toString().replace('T', '').replace(/-/gi, '').replace(':', '');
        var imchooseStartDateFloat = parseFloat(imchooseStartDate);
        var imchooseEndDate = endTime.value.toString().replace('T', '').replace(/-/gi, '').replace(':', '');
        var imchooseEndDateFloat = parseFloat(imchooseEndDate);

        // 내가 선택한 시간 중 안에 겹치는 것이 존재하면 선택할 수 없도록 설정
        if (imchooseStartDateFloat < startTimeNumber && endTimeNumber < imchooseEndDateFloat) {
            alert("중간에 예약된 날이 존재합니다.");
            betweenDayCheck = false;
            return false;
        }
        else {
            betweenDayCheck = true;
        }
    })

    // 날짜의 요일 구하기
    var week = new Array('일', '월', '화', '수', '목', '금', '토');
    var dayWeek = new Date(startDate).getDay(); // 내가 선택한 예약 시작 시간의 일을 가져옴
    var todayLabel = week[dayWeek]; // 일의 순서에 따라 배열에 있는 요일 가져옴

    console.log("선택한 요일은 : " + todayLabel);
    if (todayLabel == '일' || todayLabel == '토') {
        alert("주말은 선택할 수 없습니다.");
        holidayCheck = false;
        return false;
    }
    else {
        holidayCheck = true;
    }

    // 예약 종료 날짜 disabled 하는 조건
    // 이미 예약된 시간일 때 종료일 선택 못하게 설정
    if ((startCheck && timeCheck && holidayCheck) == true) {
        endTime.disabled = false;
    }
    else {
        endTime.disabled = true;
    }

    // blur 시 빈칸일 때
    if (startTime.value == '') {
        startText.style.display = 'block';
        startValueCheck = false;
        return false;
    }
    else {
        startText.style.display = 'none';
        startValueCheck = true;
    }

    // 시작 시간이 종료 시간보다 크면 종료시간을 초기화
    if (selectStartTime >= selectEndTime) {
        endTime.value = '';
        endCheck = false;
        endValueCheck = false;
        return false;
    }

    // 내가 선택한 시간의 분을 0으로 변경
    var startHour = startTime.value.toString().substr(13, 15);
    startHour = ':00';
    startTime.value = startTime.value.toString().substr(0, 13) + startHour;

})

function CalculatorEndTime() {
    var startDate = startTime.value.toString().substr(0, 10);
    var endDate = endTime.value.toString().substr(0, 10);

    let y = parseFloat(endDate.split('-')[0]); // 예약 종료 시간 - 연도
    let m = parseFloat(endDate.split('-')[1]); // 예약 종료 시간 - 월
    let d = parseFloat(endDate.split('-')[2]); // 예약 종료 시간 - 일
    if (d < 10) {
        d = d % 10; // 01, 02 -> 1, 2
    }

    let year = parseFloat(startDate.split('-')[0]); // 시작 시간의 연도
    let month = parseFloat(startDate.split('-')[1]); // 시작 시간의 월
    let da = parseFloat(startDate.split('-')[2]); // 시작 시간의 일

    // 시작 시간보다 종료일이 더 작을 때 에러
    if (y < year || (m < month && y == year) || (d < da && m == month && y == year)) {
        alert("날짜와 시간을 다시 선택해주세요");
        endCheck = false;
        console.log("이전날 선택 - " + endCheck);
        return false;
    }
    else {
        endCheck = true;
    }

    // -------------------------------------------------------------
    // 이미 예약된 시간 확인하기
    var reend = endTime.value.replace('T', '');
    var reen = reend.replace(/-/gi, '');
    var ree = reen.replace(':', '');
    var selectEndTime = parseFloat(ree);

    // console.log("선택한 종료 시간: " + ree);

    $(".timeCheck").each(function () {
        // 이미 예약되어 있는 시작시간
        var a = $(this).children('.startTimeCheck').val().replace('T', '');
        var a1 = a.replace(/-/gi, '');
        var stTime = a1.replace(':', '');
        var startTimeNumber = parseFloat(stTime);

        // 이미 예약되어 있는 종료시간
        var b = $(this).children('.endTimeCheck').val().replace('T', '');
        var b1 = b.replace(/-/gi, '');
        var eTime = b1.replace(':', '');
        var endTimeNumber = parseFloat(eTime);

        if (startTimeNumber < selectEndTime && selectEndTime <= endTimeNumber) {
            alert("예약된 시간과 중복됩니다.");
            timeCheck = false;
            return false;
        }
        else {
            timeCheck = true;
        }

        // 위 코드와 동일
        var imchooseStartDate = startTime.value.toString().replace('T', '').replace(/-/gi, '').replace(':', '');
        var imchooseStartDateFloat = parseFloat(imchooseStartDate);
        var imchooseEndDate = endTime.value.toString().replace('T', '').replace(/-/gi, '').replace(':', '');
        var imchooseEndDateFloat = parseFloat(imchooseEndDate);

        if (imchooseStartDateFloat < startTimeNumber && endTimeNumber < imchooseEndDateFloat) {
            alert("중간에 예약된 날이 존재합니다.");
            betweenDayCheck = false;
            return false;
        }
        else {
            betweenDayCheck = true;
        }
    })

    // 마감시간 점검 - 시간만 계산
    let st = parseInt(startTime.value.substr(11, 15));
    if (st == 0) { // 오전 12시 선택시 출력이 0으로 나옴
        st = 12;
    }

    let end = parseInt(endTime.value.substr(11, 15))
    if (end == 0) { // 오전 12시 선택시 출력이 0으로 나옴
        end = 12;
    }

    // 분 계산
    let startSub = (startTime.value.substr(11)).substr(3, 4);
    let endSub = (endTime.value.substr(11)).substr(3, 4);
    let a = parseFloat(startSub)
    let b = parseFloat(endSub)

    // 동일한 시간 선택 시
    if (startTime.value == endTime.value) {
        alert("동일한 시간은 사용할 수 없습니다.");
        endCheck = false;
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
        holidayCheck = true;
    }

    $("#purpose").focus();
};

endTime.addEventListener("blur", function () {
    // blur 시 빈칸일 때 endText 문구 출력
    if (endTime.value == '') {
        endText.style.display = 'block';
        endValueCheck = false;
    }
    else {
        endText.style.display = 'none';
        endValueCheck = true;
    }
    CalculatorEndTime();

    // 내가 선택한 분을 00으로 변경
    var endHour = endTime.value.toString().substr(13, 15);
    endHour = ':00';
    endTime.value = endTime.value.toString().substr(0, 13) + endHour;

    // 동일한 시간 선택 시
    if (startTime.value == endTime.value) {
        alert("동일한 시간은 사용할 수 없습니다.");
        endCheck = false;
        return false;
    }
    else {
        endCheck = true;
    }
})

purpose.addEventListener("blur", function () {

    // blur 시 빈칸일 때 - 사용 목적이 빈칸이 아닐 때
    if (purpose.value == '') {
        purposeText.style.display = 'block';
        purposeCheck = false;
        console.log("purpost check: " + purposeCheck);
        return false;
    }
    else {
        purposeText.style.display = 'none';
        purposeCheck = true;
        console.log("purpost check: " + purposeCheck);
    }
})

btn.addEventListener("click", function () {
    console.log("버튼 클릭시")
    console.log("startTime: " + startCheck);
    console.log("endTime: " + endCheck);
    console.log("startValueCheck: " + startValueCheck);
    console.log("endValueCheck: " + endValueCheck);
    console.log("timeCheck: " + timeCheck);
    console.log("purposeCheck: " + purposeCheck);
    console.log("holidayCheck: " + holidayCheck);
    console.log("betweenCheck: " + betweenDayCheck);

    // 유효성 검사에 실패하였을 때
    if ((startCheck == false || endCheck == false || purposeCheck == false || startValueCheck == false || endValueCheck == false || timeCheck == false || holidayCheck == false || betweenDayCheck == false)) {
        alert("조건을 충족하지 못하였습니다. (다시 입력하세요~)");
        location.reload();
        return false;
    }
    else {
        let a = confirm("예약하시겠습니까?");

        // 조건에 총족하였을 때
        if ((a && startCheck && endCheck && purposeCheck && startValueCheck && endValueCheck && timeCheck && holidayCheck && betweenDayCheck) == true) {
            frm.submit();
        }
        else if (a == false) {
            alert("취소하였습니다.");
        }
    }
})

