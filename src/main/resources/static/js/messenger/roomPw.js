$(".roomArea").on("click", ".roomPw", function(){

    let roomNum = $(this).attr("data-room-num");

    // console.log("룸넘이 나오니!", roomNum);

    // ----------- Ajax -----------
    $.ajax({
        type:"GET",
        url:"/messenger/pwCheck",
        data:{
            roomNum:roomNum
        },
        success:function(result){
            console.log("결과는?!", result);
        }
    });
});