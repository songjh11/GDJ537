//   let ws;

//    function wsOpen(){
//       ws = new WebSocket("ws://" + location.host + "/chating");
//       wsEvt();
//    }

// //------------------------------------
      
//    function wsEvt() {
//       ws.onopen = function(data){
//          //소켓이 열리면 초기화 세팅하기
//       }
      
//       ws.onmessage = function(data) {
//          let msg = data.data;
//          if(msg != null && msg.trim() != ''){
		
// 			console.log(msg)
            
//            let d = JSON.parse(msg);
//            if(d.type =="getId"){
// 			let a ="getId";
//          let b = d
// 				console.log(a);
//             console.log(b);

//               let si =d.sessionId != null ; d.sessionId ="";
//               console.log(d.sessionId);
//               if(si !=""){
//                  $("#sessionId").val(si); 
//                  console.log(sessionId);
//                  console.log(sessionId.val())
//               }
//            }else if (d.type =="message"){
//               //내가 보냈을 때
//               if(d.sessionId==$("#sessionId").val()){
//                console.log(sessionId);
//                console.log(d.sessionId);
//                  $("#chating").append("<div class='me'>"
//                                    +"<div class='me-bubble-flex-first'><div class='me-bubble'>" +d.msg+"</div>"
//                                   +"<div class='me-count'><span>1</span></div></div></div>");   
//                             console.log("왜 또 안들어와 - -");

//               //남이 보냈을 때
//               }else{
//                   $("#chating").append("<div class = 'you'>"
//                                     +"<div class = 'you-flex'>"
//                                     +"<div class='you-profile'>"
//                                     +"<div class='pic'><img src='/img/chatroom-profile.jpg' width='35px' height='35px'></div></div>"
//                                     +"<div class='you-namebubble'><div class='you-name'><span><strong>"+d.userName+"</strong></span></div>"
//                                     +"<div class='you-bubble-flex'><div class='you-bubble'>" +d.msg+ "</div>"
//                                     +"<div class='you-count'><span>1<span></div></div></div></div></div>"  );
//             console.log("나가 !!!")
//                                  }
                  
//             }else{
//                console.warn("unknown type!")
//             }
//            }

//       }

//       document.addEventListener("keypress", function(e){
//          if(e.keyCode == 13){ //enter press
//             send();
//          }
//       });
//    }

// //--------------------------------------------

//    function chatName(){
//       let userName = $("#userName").val();
//       if(userName == null || userName.trim() == ""){
//          alert("사용자 이름을 입력해주세요.");
//          $("#userName").focus();
//       }else{
//          wsOpen();
//          $("#yourName").hide();
//          $("#yourMsg").show();
//       }
//    }

// //---------------------------------------------

//    function send() {
      
//       let option={
//             type:"message",
//             sessionId:$("#sessionId").val(),
//             userName:$("#userName").val(),
//             msg: $("#chatting").val()
//          }
//       ws.send(JSON.stringify(option))
//       $('#chatting').val("");
//    }






 //console.log("js");
   
 let ws = new WebSocket("ws://" + location.host + "/chatroom");

 let sessionId = $("#sessionId").val();
 let userName = $("#userName").val();
 let inputChat = $("#inputChat").val();
 //let inputChat = document.getElementById('inputChat').value;

ws.onopen= function(){
   console.log("asdf")
}

ws.onmessage=function(e){
   console.log("asdf",e.data)
   let a= JSON.parse(e.data)
   console.log(a.inputChat)
}
//------------------------------------
    
 function wsEvt() {
    ws.onopen = function(data){
       //소켓이 열리면 초기화 세팅하기
    }
 }

//---------------------------------------------

 function send() {
    let option={
       sessionId : sessionId,
       userName : userName,
       inputChat : $("#inputChat").val()
       //inputChat : inputChat
      };
      console.log(option)

      ws.send(JSON.stringify(option))
    $("#inputChat").val();
    
    console.log("s : ", sessionId);
    console.log("u : ", userName);
    console.log("c : ", inputChat);
    
    
    //내가 보냈을 때
      if(sessionId==userName){
         $("#chating").append("<div class='me'>"
                           +"<div class='me-bubble-flex-first'><div class='me-bubble'>" +inputChat+"</div>");   
      
      //남이 보냈을 때
      }else{
          $("#chating").append("<div class = 'you'>"
                            +"<div class = 'you-flex'>"
                            +"<div class='you-profile'>"
                            +"<div class='pic'><img src='/img/chatroom-profile.jpg' width='35px' height='35px'></div></div>"
                            +"<div class='you-namebubble'><div class='you-name'><span><strong>"+userName+"</strong></span></div>"
                            +"<div class='you-bubble-flex'><div class='you-bubble'>" +inputChat+ "</div></div>"
                         );
       }
    
    
    
 }
 
//---------------------------------------------

 //채팅창에서 들어왔을 때
 function wsOpen () {
    let str = userName + " 님이 입장하셨습니다.";
    
    $("#chating").append("<div class='al'>"
                     +"<div class='al-bubble'>" +str+"</div></div>"
                    );   
 }

 //채팅창에서 나갔을 때
 function onClose() {
    console.log("퇴장");
    let str = userName + ": 님이 방을 나가셨습니다.";
    
    $("#chating").append("<div class='al'>"
                     +"<div class='al-bubble'>" +str+"</div></div>"
                    );   
 }
 

