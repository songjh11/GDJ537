$(".roomArea").on("click", ".roomLink", function(){
    console.log("자바스크립트 연결 되었니?")
    let roomNum = $(this).attr("data-room-num");

    // console.log("룸넘이 나오니!", roomNum);

    // 비밀번호가 있는지 확인
    // ----------- Ajax -----------
    $.ajax({
        type:"POST",
        url:"pwCheck",
        data:{
            roomNum:roomNum
        },
        success:function(result){
            // let result = JSON.parse(obj);
            console.log("결과는?!", result);

            if(result=1){

                console.log("성공!!");
                // 모달창 띄우기!
                $(".pwModal-overlay").css('display','flex').hide().fadeIn();

                // $.ajax{

                // }

            }

        }
    });
});