 //console.log("js");
   

 let sessionId = $("#sessionId").val();
 let userName = $("#userName").val();
 let roomNum = $("#roomNum").val();
 let userId = $("#userId").val();
 let userProfile = $("#userProfile").val();
 let chat = "";


//------------------------------------


document.addEventListener("keypress", function(e){
			if(e.keyCode == 13){ //enter press
				send();
			}
		});   

//---------------------------------------------
let ws = new WebSocket("ws://" + location.host + "/oneChat/"+roomNum);		

 function send() {
	

    let option={
        type: "message",
       	sessionId : sessionId,
       	userName : userName,
       	userId: userId,
        inputChat :$("#inputChat").val(),
       	roomNum:roomNum
      };
  

      ws.send(JSON.stringify(option))
    	$("#inputChat").val("");
    
  
       
      }


//---------------------------------------------

 function wsOpen () {

 
	ws.onmessage = function(data) {
   //메시지를 받으면 동작
   let msg = data.data;
   console.log(msg)
   if(msg != null && msg.trim() != ''){
      let d = JSON.parse(msg);
      
	if (roomNum == d.roomNum){ 


      if(d.type=="connect"){
	       	let str = d.username + " 님이 입장하셨습니다.";
			$("#chating").append("<div class='al'>"
	  						+"<div class='al-bubble'>" +str+"</div></div>"
	 						);	
	  }
	  
	  else if(d.type == "disconnect"){
					let str = d.username + " 님이 나가셨습니다.";
					    $("#chating").append("<div class='alo'>"
				  						+"<div class='alo-bubble'>" +str+"</div></div>"
				 						);	
      
      
      }if(d.type == "message"){
	
		console.log("fsdfsfsdfs")
         if(userId == d.userId){
            $("#chating").append("<div class='me'>"
            +"<div class='me-bubble-flex-first'><div class='me-bubble'>" +d.inputChat+"</div>"); 
           
      }else{
         $("#chating").append("<div class = 'you'>"
					         +"<div class = 'you-flex'>"
					         +"<div class='you-profile'>"
					         +"<div class='pic'><img src='/file/user/"+userProfile+"' width='35px' height='35px'></div></div>"
					         +"<div class='you-namebubble'><div class='you-name'><span><strong>"+d.userName+"</strong></span></div>"
					         +"<div class='you-bubble-flex'><div class='you-bubble'>" +d.inputChat+ "</div></div>"
					            );  
         }
         }
            
      }else	{
	
					console.log("roomNum : ", roomNum);
					console.log("d.roomNum : ", d.roomNum);
		}
		   }
		
		}	  
		 
		 }
