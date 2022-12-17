 //console.log("js");
   

 let sessionId = $("#sessionId").val();
 let userName = $("#userName").val();
 let inputChat = $("#inputChat").val();
 //let inputChat = document.getElementById('inputChat').value;


   

   

//------------------------------------



   


document.addEventListener("keypress", function(e){
			if(e.keyCode == 13){ //enter press
				send();
			}
		});   

//---------------------------------------------

 function send() {
    let option={
        type: "message",
       	sessionId : sessionId,
       	userName : userName,
       	inputChat : $("#inputChat").val()
      };
  

      ws.send(JSON.stringify(option))
    	$("#inputChat").val("");
    
  
       
      }


//---------------------------------------------

 //채팅창에서 들어왔을 때
 function wsOpen () {
	ws.onmessage = function(data) {
   //메시지를 받으면 동작
   let msg = data.data;
   console.log(msg)
   if(msg != null && msg.trim() != ''){
      let d = JSON.parse(msg);
      
      //--------------
      if(d.type=="connect"){
	       	let str = d.username + " 님이 입장하셨습니다.";
			$("#chating").append("<div class='al'>"
	  						+"<div class='al-bubble'>" +str+"</div></div>"
	 						);	
	  }
      
      //--------------
      
      else if(d.type == "getId"){
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
            
      }//타입이 연결해제
				else if(d.type == "disconnect"){
					let str = d.username + " 님이 나가셨습니다.";
					    $("#chating").append("<div class='alo'>"
				  						+"<div class='alo-bubble'>" +str+"</div></div>"
				 						);	
   }

}	  
 
 }
 }
