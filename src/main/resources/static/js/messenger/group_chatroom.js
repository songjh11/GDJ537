
	//console.log("js");
	
	//let ws = new WebSocket("ws://" + location.host + "/chatroom");

	let sessionId = $("#sessionId").val();
	let userName = $("#userName").val();
	let userId = $("#userId").val();
	let chat = "";
	//let inputChat = document.getElementById('inputChat').value;


//------------------------------------

	function wsOpen(){
		ws = new WebSocket("ws://" + location.host + "/chatroom");
		wsEvt();
		
		let str = userName + " 님이 입장하셨습니다.";
		$("#chating").append("<div class='al'>"
	  						+"<div class='al-bubble'>" +str+"</div></div>"
	 						);	
	}
		
		
		
	function wsEvt() {
		ws.onopen = function(data){
			//소켓이 열리면 초기화 세팅하기
		}
		
		ws.onmessage = function(data) {
			let msg = data.data;
			if(msg != null && msg.trim() != ''){
				
			let d = JSON.parse(msg);
			
			if(d.type == "message"){
				//내가 보냈을 때
			    if(sessionId == userId){
					console.log("ggg");
				    $("#chating").append("<div class='me'>"
				  	  					+"<div class='me-bubble-flex-first'><div class='me-bubble'>" +chat+"</div>");	
			  
			    //남이 보냈을 때
			    }else{
					  $("#chating").append("<div class = 'you'>"
											+"<div class = 'you-flex'>"
											+"<div class='you-profile'>"
											+"<div class='pic'><img src='/img/chatroom-profile.jpg' width='35px' height='35px'></div></div>"
											+"<div class='you-namebubble'><div class='you-name'><span><strong>"+userName+"</strong></span></div>"
											+"<div class='you-bubble-flex'><div class='you-bubble'>" +chat+ "</div></div>"
										);
				  }
			   }
			}

		}

		document.addEventListener("keypress", function(e){
			if(e.keyCode == 13){ //enter press
				send();
			}
		});
	}

//---------------------------------------------

	function send() {
		chat = $("#inputChat").val();
		
		let option={
				type : "message",
				sessionId : sessionId,
				userName : userName,
				userId : userId,
				chat : chat
			}
		ws.send(JSON.stringify(option))
		$("#inputChat").val("");
		
		console.log("se : ", sessionId);
		console.log("us : ", userId);
	}
	
//---------------------------------------------

	//채팅창에서 들어왔을 때
//	function wsOpen () {
//		let str = userName + " 님이 입장하셨습니다.";
		
//		$("#chating").append("<div class='al'>"
//	  						+"<div class='al-bubble'>" +str+"</div></div>"
//	 						);	
//	}

	//채팅창에서 나갔을 때
	function onClose() {
		console.log("퇴장");
		let str = userName + ": 님이 방을 나가셨습니다.";
		
		$("#chating").append("<div class='al0'>"
	  						+"<div class='alo-bubble'>" +str+"</div></div>"
	 						);	
	}
	












	
	