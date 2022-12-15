 //console.log("js");
   
 let ws = new WebSocket("ws://" + location.host + "/chating");

 let sessionId = $("#sessionId").val();
 let userName = $("#userName").val();
 let inputChat = $("#inputChat").val();
 //let inputChat = document.getElementById('inputChat').value;


   

   

//------------------------------------
    
 function wsEvt() {
    ws.onopen = function(data){
       //소켓이 열리면 초기화 세팅하기  
       
       	let str = userName + " 님이 입장하셨습니다.";
		$("#chating").append("<div class='al'>"
	  						+"<div class='al-bubble'>" +str+"</div></div>"
	 						);	
       
    }
 }

 ws.onmessage = function(data) {
   //메시지를 받으면 동작
   let msg = data.data;
   if(msg != null && msg.trim() != ''){
      let d = JSON.parse(msg);
      if(d.type == "getId"){
         var si = d.sessionId != null ? d.sessionId : "";
      }else if(d.type == "message"){
         if(d.sessionId == $("#sessionId").val()){
            $("#chating").append("<div class='me'>"
            +"<div class='me-bubble-flex-first'><div class='me-bubble'>" +d.inputChat+"</div>"); 
           
      }else{
         $("#chating").append("<div class = 'you'>"
         +"<div class = 'you-flex'>"
         +"<div class='you-profile'>"
         +"<div class='pic'><img src='/img/chatroom-profile.jpg' width='35px' height='35px'></div></div>"
         +"<div class='you-namebubble'><div class='you-name'><span><strong>"+d.userName+"</strong></span></div>"
         +"<div class='you-bubble-flex'><div class='you-bubble'>" +d.inputChat+ "</div></div>"
            );  
         }
            
      }else{
         console.warn("unknown type!")
      }
   }
}

//---------------------------------------------

 function send() {
    let option={
        type: "message",
       sessionId : sessionId,
       userName : userName,
       inputChat : $("#inputChat").val()
      };
  

      ws.send(JSON.stringify(option))
    $("#inputChat").val();
    
  
       
      }
 

//---------------------------------------------

 //채팅창에서 들어왔을 때
 //function wsOpen () {
 //   let str = userName + " 님이 입장하셨습니다.";
 //   
 //   $("#chating").append("<div class='al'>"
 //                    +"<div class='al-bubble'>" +str+"</div></div>"
 //                   );   
// }

 //채팅창에서 나갔을 때
 function onClose() {
    console.log("퇴장");
    let str = userName + ": 님이 방을 나가셨습니다.";
    
    $("#chating").append("<div class='al'>"
                     +"<div class='al-bubble'>" +str+"</div></div>"
                    );   
 }