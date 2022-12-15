let today = new Date();

$(".startTime").each(function () {
    var startTime = $(this).val().toString();

    var a = startTime.replace('T', '');
    var a1 = a.replace(/-/gi, '');
    var stTime = a1.replace(':', '');
    var startTimeNumber = parseFloat(stTime);

    console.log("예약 시작 날짜: " + startTimeNumber);

    let year = parseFloat(today.getFullYear()); // 년도
    let month = parseFloat(today.getMonth() + 1);  // 월
    let day = parseFloat(today.getDate());  // 날짜
    let hour = parseFloat(today.getHours());
    let min = parseFloat(today.getMinutes());

    let totalToday = year + "" + month + "" + day + '' + hour + '' + min;
    let todayNumber = parseFloat(totalToday);
    console.log("오늘 날짜: ", todayNumber);

    // if (todayNumber == startTimeNumber) {
    //     $.ajax({
    //         url: './',
    //         type: 'POST',

    //     })
    // }
})

