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

            // 비밀번호가 있음
            if(result=1){

                console.log("성공!!");
                // 모달창 띄우기!
                $(".pwModal-overlay").css('display','flex').hide().fadeIn();

            }else{

                // 비밀번호가 없음


            }

        }
    });

    $("#pwCheckBtn").click(function(){

        let pw = $("#roomPwCheck").val();

        console.log("입력한 비밀번호가? ", pw);
        
        $.ajax({
            type:"POST",
            url:"roomPw",
            data:{
                roomNum : roomNum,
                pw : pw
            },
            success:function(roomVO){

                console.log("룸브이오", roomVO);

                if(roomVO=1){
                    console.log("비밀번호 맞음")

                }else{
                    console.log("틀림")
                    // alert("비밀번호가 맞지 않습니다.")
                }
            }
        })

    });

});
