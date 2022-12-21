

//------------------------------------

	let sessionId = $("#sessionId").val();
	let userName = $("#userName").val();
	let userId = $("#userId").val();
	let userProfile = $("#userProfile").val();
	let chat = "";
	let roomNum = $("#roomNum").val(); //param.roomNum

//------------------------------------
	//enter 치면 메세지 보내기
	document.addEventListener("keypress", function(e){
			if(e.keyCode == 13){ //enter press
				send();
			}
		});
		
//------------------------------------		
let ws = new WebSocket("ws://" + location.host + "/chatroom/"+roomNum);

function send() {
		chat = $("#inputChat").val();
		
		let option={
				type : "message",
				sessionId : sessionId,
				userName : userName,
				userId : userId,
				chat : chat,
				roomNum : roomNum
			}
		ws.send(JSON.stringify(option))
		$("#inputChat").val("");
	}
	
//---------------------------------------------

	function wsOpen(){	
		
		ws.onmessage = function(data) {
			//socketHadler - afterConnectionEstablished의 message
			let msg = data.data;
			console.log("msg : ", msg);
			
			//msg 내용 parse
			if(msg != null && msg.trim() != ''){
				let d = JSON.parse(msg);
				console.log("d : ", d);
			
				//roomNum이 동일할 때
				if (roomNum == d.roomNum){
					
					//타입 연결일때 (접속)
					if(d.type == "connect"){
						let str = d.username + "님이 입장하셨습니다.";
						    $("#chating").append("<div class='al'>"
					  						+"<div class='al-bubble'>" +str+"</div></div>"
					 						);		
					}
					
					//타입이 연결해제
					else if(d.type == "disconnect"){
						let str = d.username + "님이 나가셨습니다.";
						    $("#chating").append("<div class='alo'>"
					  						+"<div class='alo-bubble'>" +str+"</div></div>"
					 						);	
					}
	
					//타입이 메세지일 때
					else if(d.type == "message"){
						//내가 보냈을 때
					    if(userId == d.userId){
						    $("#chating").append("<div class='me'>"
						  	  					+"<div class='me-bubble-flex-first'><div class='me-bubble'>" +d.chat+"</div>");	
					  
					    //남이 보냈을 때
					    }else{
							  $("#chating").append("<div class = 'you'>"
													+"<div class = 'you-flex'>"
													+"<div class='you-profile'>"
													+"<div class='pic'><img src='/file/user/"+userProfile+"' width='35px' height='35px'></div></div>"
													+"<div class='you-namebubble'><div class='you-name'><span><strong>"+d.userName+"</strong></span></div>"
													+"<div class='you-bubble-flex'><div class='you-bubble'>" +d.chat+ "</div></div>"
												);
						}
						}
					
				}else {
					console.log("흑흑");
					console.log("roomNum : ", roomNum);
					console.log("d.roomNum : ", d.roomNum);
				}	
			}	
		}
	}

