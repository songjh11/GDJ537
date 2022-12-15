// $(".roomPw").click(function(){
    
//     let roomNum = $(".roomPw").attr("data-room-num");
    
//     console.log("방번호야아아 와줘 ㅠㅠ ", roomNum);
    
//     // a태그 클릭시 비밀번호가 있는지 요청
//     // ------------ Ajax ------------
//     console.log("넘아 왔니? ", roomNum);
//     $.ajax({

//         type:"GET",
//         url :"/messenger/roomPw",
//         data:{
//             roomNum : roomNum
//         },
//         success : function(result){
//             console.log("성공?!",result);
//             if(result!==''){
//                 console.log("비번이 없닝?!!");
//             }
//         }

//     });

// });

// $('.roomPw').on('click', function(){
//     let multiIdx = $(this).index();
//     console.log("뭐닝?",multiIdx);
//     let multiCount = ++multiArr[multiIdx];
//     $(this).text("버튼이 "+ multiCount+ "번 눌렸습니다.");
// });

// $('.roomPw').each(function(){
//     if ($(this).hasClass("on")) {
//         let roomNum = $(this).attr("data-room-num");
//         console.log("룸번호!!",roomNum);
//         $(this).parent().addClass('active')
//        }else {
//          $(this).parent().removeClass('active')
//        }
// })

// let roomNum = "";

// $(".roomPw").on("click", function(e){
//     if($(e.target).hasClass("host")) {
// 	} else {
// 		roomNum = $(this).attr("data-room-num");
        
//         // a태그 클릭시 비밀번호가 있는지 요청
//         // ------------ Ajax ------------
//         console.log("넘아 왔니? ", roomNum);
//         $.ajax({

//             type:"GET",
//             url :"/messenger/roomPw",
//             data:{
//                 roomNum : roomNum
//             },
//             success : function(result){
//                 console.log("성공?!",result);
//                 if(result!==''){
//                     console.log("비번이 없닝?!!");
//                 }
//             }

//         });

//     }
    
// });

// $(".roomPw").each(function(index, item){
    
//     let index = $(this).index();

// })