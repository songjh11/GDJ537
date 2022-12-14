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

startTime.addEventListener("blur", function () {
    console.log(startTime.value);

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
    // 반납날짜 disabled 하는 조건
    if (startTime.value != '' && startCheck == true) {
        endTime.disabled = false;
    }
    if (startCheck == false) {
        endTime.disabled = true;
    }

    // -------------------------------------------------------------
    // 이미 예약된 시간 확인
    var restart = startTime.value.replace('T', '');
    var restar = restart.replace(/-/gi, '');
    var rest = restar.replace(':', '');
    var selectStartTime = parseFloat(rest);

    console.log("선택한 시작 시간: " + rest);



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

        if ((startTimeNumber < selectStartTime && selectStartTime <= endTimeNumber) == true) {
            alert("예약된 시간입니다.");
            return false;
        }
        else {
            timeCheck = true;
        }
        // console.log("timeCheck: " + timeCheck);
        // console.log("----------------------");
    })


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
        endCheck = false;
        console.log("이전날 선택 - " + endCheck);
        return false;
    }
    else {
        endCheck = true;
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
    else {

        if (end < st) {
            alert("유효하지 않은 시간대입니다.");
            endCheck = false;
            console.log("종료시간이 시작보다 빠름 - " + endCheck);
            return false;
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
                return false;
            }
            else {
                endCheck = true;
            }
        }
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
    CalculatorEndTime();

    console.log("startTime: " + startCheck);
    console.log("endTime: " + endCheck);
    console.log("startValueCheck: " + startValueCheck);
    console.log("endValueCheck: " + endValueCheck);
    console.log("timeCheck: " + timeCheck);

    if ((startCheck == false || endCheck == false || purposeCheck == false || startValueCheck == false || endValueCheck == false || timeCheck == false)) {
        alert("조건을 충족하지 못하였습니다. (다시 입력하세요~)");
        return false;
    }
    else {
        
        
        let a = confirm("정말 예약하시겠습니까?");
        
        if ((a && startCheck && endCheck && purposeCheck && startValueCheck && endValueCheck && timeCheck) == true) {
            frm.submit();
        }
        else if (a == false) {
            alert("취소하였습니다.");
        }
        // if ((startCheck == false || endCheck == false || purposeCheck == false || startValueCheck == false || endValueCheck == false || timeCheck == false)) {
        //     alert("조건을 충족하지 못하였습니다.");
        // }
    }
})
// -----------------------------------------
// 예약자 번호 숫자형으로 변환
var memNum = $("#member").val();

let tt = parseFloat(memNum);

$("#member").val(tt);
