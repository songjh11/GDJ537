
// 예약자 번호 숫자형으로 변환
var memNum = $("#member").val();
let tt = parseFloat(memNum);
$("#member").val(tt);

// console.log(memNum);

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

let today = new Date();

startCheck = false;
startValueCheck = false;
endCheck = false;
endValueCheck = false;
purposeCheck = false;
timeCheck = false;
holidayCheck = false;
betweenDayCheck = false;

startTime.addEventListener("blur", function () {
    var startDate = startTime.value.toString().substr(0, 10);

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
        startCheck = false;
        console.log("시작 날 선택 - " + startCheck);
        
        return false;
    }
    else {
        startCheck = true;
    }

    // -------------------------------------------------------------
    // 이미 예약된 시간 확인 - 선택한 시작 시간
    var restart = startTime.value.replace('T', '');
    var restar = restart.replace(/-/gi, '');
    var rest = restar.replace(':', '');
    var selectStartTime = parseFloat(rest);

    // 선택한 종료시간
    var reend = endTime.value.replace('T', '');
    var reen = reend.replace(/-/gi, '');
    var ree = reen.replace(':', '');
    var selectEndTime = parseFloat(ree);

    // console.log("선택한 시작 시간: " + rest);

    $(".timeCheck").each(function () {
        var a = $(this).children('.startTimeCheck').val().replace('T', '');
        var a1 = a.replace(/-/gi, '');
        var stTime = a1.replace(':', '');
        var startTimeNumber = parseFloat(stTime);

        var b = $(this).children('.endTimeCheck').val().replace('T', '');
        var b1 = b.replace(/-/gi, '');
        var eTime = b1.replace(':', '');
        var endTimeNumber = parseFloat(eTime);

        // console.log("예약된 시간: " + startTimeNumber);
        // console.log("예약된 종료 시간: " + endTimeNumber);

        // console.log("예약시작시간보다 선택한 시간이 클때: ", startTimeNumber < selectStartTime);
        // console.log("선택한 시간이 예약 종료 시간보다 작을때: ", selectStartTime <= endTimeNumber);
        // console.log("if에 들어감: " + (startTimeNumber < selectStartTime || selectStartTime <= endTimeNumber) == true);
        // console.log(startTimeNumber < selectStartTime && selectStartTime <= endTimeNumber);

        if (startTimeNumber < selectStartTime && selectStartTime <= endTimeNumber) {
            alert("이미 예약된 시간입니다.");
            timeCheck = false;
            return false;
        }
        else {
            // alert("사용 가능한 시간입니다.");
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

        // console.log("내가 선택한 시작 시간: " + imchooseStartDate);
        // console.log("내가 선택한 종료 시간: " + imchooseEndDate);
        // console.log("시작 시간: " + startTimeNumber);

        if (imchooseStartDateFloat < startTimeNumber && endTimeNumber < imchooseEndDateFloat) {
            // console.log("내가 선택한 시작 시간 < 예약된 시작시간 || 내가 선택한 종료 시간 < 예약된 시작시간");
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
    var dayWeek = new Date(startDate).getDay();
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

    // 반납날짜 disabled 하는 조건
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

    var startHour = startTime.value.toString().substr(13, 15);
    startHour = ':00';
    startTime.value = startTime.value.toString().substr(0, 13) + startHour;

    console.log("0분으로: " + startTime.value);
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

        // console.log("예약된 시간: " + startTimeNumber);
        // console.log("예약된 종료 시간: " + endTimeNumber);

        // console.log("예약시작시간보다 선택한 시간이 클때: ", startTimeNumber < selectStartTime);
        // console.log("선택한 시간이 예약 종료 시간보다 작을때: ", selectStartTime <= endTimeNumber);
        // console.log("if에 들어감: " + (startTimeNumber < selectStartTime || selectStartTime <= endTimeNumber) == true);
        // console.log(startTimeNumber < selectEndTime && selectEndTime <= endTimeNumber);

        if (startTimeNumber < selectEndTime && selectEndTime <= endTimeNumber) {
            alert("예약된 시간과 중복됩니다.");
            timeCheck = false;
            return false;
        }
        else {
            // alert("사용 가능한 시간입니다.");
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

        // console.log("내가 선택한 시작 시간: " + imchooseStartDate);
        // console.log("내가 선택한 종료 시간: " + imchooseEndDate);
        // console.log("시작 시간: " + startTimeNumber);

        if (imchooseStartDateFloat < startTimeNumber && endTimeNumber < imchooseEndDateFloat) {
            // console.log("내가 선택한 시작 시간 < 예약된 시작시간 || 내가 선택한 종료 시간 < 예약된 시작시간");
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
    if (st == 0) {
        st = 12;
    }
    // console.log("st: " + st); // 시작 숫자

    let end = parseInt(endTime.value.substr(11, 15))
    if (end == 0) {
        end = 12;
    }
    // console.log("endTime: " + end); // 종료 숫자

    // 분 계산
    let startSub = (startTime.value.substr(11)).substr(3, 4);
    let endSub = (endTime.value.substr(11)).substr(3, 4);
    let a = parseFloat(startSub)
    let b = parseFloat(endSub)

    // 조건 주기
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
        holidayCheck = true;
    }
};

endTime.addEventListener("blur", function () {
    // blur 시 빈칸일 때
    if (endTime.value == '') {
        endText.style.display = 'block';
        endValueCheck = false;
    }
    else {
        endText.style.display = 'none';
        endValueCheck = true;
    }
    CalculatorEndTime();

    var endHour = endTime.value.toString().substr(13, 15);
    endHour = ':00';
    endTime.value = endTime.value.toString().substr(0, 13) + endHour;

    console.log(endTime.value);
})

purpose.addEventListener("blur", function () {
    if ((purpose.value) != '') {
        purposeCheck = true;
    }

    // blur 시 빈칸일 때
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
    // CalculatorEndTime();

    console.log("startTime: " + startCheck);
    console.log("endTime: " + endCheck);
    console.log("startValueCheck: " + startValueCheck);
    console.log("endValueCheck: " + endValueCheck);
    console.log("timeCheck: " + timeCheck);
    console.log("purposeCheck: " + purposeCheck);
    console.log("holidayCheck: " + holidayCheck);
    console.log("betweenCheck: " + betweenDayCheck);

    if ((startCheck == false || endCheck == false || purposeCheck == false || startValueCheck == false || endValueCheck == false || timeCheck == false || holidayCheck == false || betweenDayCheck == false)) {
        alert("조건을 충족하지 못하였습니다. (다시 입력하세요~)");
        location.reload();
        return false;
    }
    else {

        let a = confirm("정말 예약하시겠습니까?");

        if ((a && startCheck && endCheck && purposeCheck && startValueCheck && endValueCheck && timeCheck && holidayCheck && betweenDayCheck) == true) {
            frm.submit();
        }
        else if (a == false) {
            alert("취소하였습니다.");
        }
    }
})

