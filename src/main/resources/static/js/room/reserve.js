const btn = document.getElementById("resBtn");
const frm = document.getElementById("frm");
const startTime = document.getElementById("start");
const endTime = document.getElementById("end");

let today = new Date();

startCheck = true;
endCheck = true;

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
        dateCheck = false;
    }
    else {
        dateCheck = true;
    }
    if (startTime.value != '' && dateCheck == true) {
        endTime.disabled = false;
    }
    if (dateCheck == false) {
        endTime.disabled = true;
    }
})

endTime.addEventListener("blur", function () {
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
    if (end < st) {
        alert("유효하지 않은 시간대입니다.");
        endCheck = false;
    }
    else {
        endCheck = true;
    }

    console.log(endTime.value);
    console.log(startTime.value);
    var startSub = parseInt((startTime.value.substr(11)).substr(3, 4));
    console.log(startSub);
    var endSub = parseInt((endTime.value.substr(11)).substr(3, 4));
    console.log(endSub);

    // 분 계산
    if (end == st && startsub < endSub) {
        alert("유효하지 않은 시간대입니다.");
        endCheck = false;
    }
    else {
        endCheck = true;
    }
})

// date.addEventListener("blur", function () {
//     console.log(date.value);
//     let y = parseFloat(date.value.split('-')[0]);
//     let m = parseFloat(date.value.split('-')[1]);
//     let d = parseFloat(date.value.split('-')[2]);
//     if (d < 10) {
//         d = d % 10;
//     }

//     let year = parseFloat(today.getFullYear()); // 년도
//     let month = parseFloat(today.getMonth() + 1);  // 월
//     let da = parseFloat(today.getDate());  // 날짜

//     // 선택할 수 없는 것 만들기

//     // 연도 - 선택한 연도가 현재 연도보다 작아야 함
//     // 달 - 현 연도 에서 이전 달은 선택 못함
//     // 일 - 현 연도, 달에서 이전 일은 선택 못함
//     console.log(y < year);
//     console.log(m < month && y == year);
//     console.log(d < da && m == month && y == year);

//     if (y < year || (m < month && y == year) || (d < da && m == month && y == year)) {
//         alert("선택할 수 없는 날입니다.");
//         dateCheck = false;
//     }
//     else {
//         dateCheck = true;
//     }
// })

// startTime.addEventListener("blur", function () {
//     console.log(startTime.value);

//     $(".startList").each(function () {
//         var b = $(this).val();

//         // console.log("b: " + b);

//         console.log(b == startTime.value);
//         if ((b == startTime.value) == true) {
//             alert("이미 예약된 시간입니다.");
//             startCheck = false;
//         }
//         else {
//             startCheck = true;
//         }
//     })
// });

// endTime.addEventListener("blur", function () {
//     console.log(startTime.value.substr(0, 2));
//     let st = parseInt(startTime.value.substr(0, 2));
//     if (st == 0) {
//         st = 12;
//     }
//     console.log("st: " + st); // 시작 숫자

//     let end = parseInt(endTime.value.substr(0, 2))
//     if (end == 0) {
//         end = 12;
//     }
//     console.log("endTime: " + end); // 종료 숫자

//     if (end < st) {
//         alert("유효하지 않은 시간대입니다.");
//         endCheck = false;
//     }
//     else {
//         endCheck = true;
//     }
// })

btn.addEventListener("click", function () {
    let a = confirm("정말 예약하시겠습니까?");
    // console.log(a);

    if (a == true && startCheck == true && endCheck == true) {
        frm.submit();
    }
    else {
        alert("조건을 충족하지 못하였습니다.");
    }
})


