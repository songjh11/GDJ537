var a = $("#userID").val();

// console.log(a);

$('.res').click(function () {
    if (a == '0') {
        alert("예약하려면 로그인이 필요합니다.");
    }
})

