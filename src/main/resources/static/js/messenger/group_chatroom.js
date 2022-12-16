
	let popupWidth = "500";
	let popupHeight = "750";
	let popUp = "";
	  
	// 듀얼 모니터 고려한 윈도우 띄우기
	let curX = window.screenLeft;
	let curWidth = document.body.clientWidth;
	let curHeight = document.body.clientHeight;
	  
	let nLeft = (screen.availWidth/ 2) - (popupWidth / 2);
	let nTop = ((screen.availHeight-popupHeight)/2)-10;
	
	let strOption = "";
	strOption += "left=" + nLeft + "px,";
	strOption += "top=" + nTop + "px,";
	strOption += "width=" + popupWidth + "px,";
	strOption += "height=" + popupHeight + "px,";
	strOption += "toolbar=no,menubar=no,location=no,";
	strOption += "resizable=yes,status=yes";

	function chatPop(roomNum){
		window.open('/messenger/chatroom?roomNum='+roomNum, '단체 채팅방', strOption);
	}

//------------------------------------

	let ws = new WebSocket("ws://" + location.host + "/chatroom");

	let sessionId = $("#sessionId").val();
	let userName = $("#userName").val();
	let userId = $("#userId").val();
	let chat = "";

//------------------------------------
	//enter 치면 메세지 보내기
	document.addEventListener("keypress", function(e){
			if(e.keyCode == 13){ //enter press
				send();
			}
		});
		
//------------------------------------		

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
	}
	
//---------------------------------------------

	function wsOpen(){
		ws.onmessage = function(data) {
			let msg = data.data;
			console.log("msg : ", msg);
			
			if(msg != null && msg.trim() != ''){
				let d = JSON.parse(msg);
				console.log("d : ", d);
			
				//타입 연결일때 (접속)
				if(d.type == "connect"){
					let str = d.username + " 님이 입장하셨습니다.";
					    $("#chating").append("<div class='al'>"
				  						+"<div class='al-bubble'>" +str+"</div></div>"
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
												+"<div class='pic'><img src='/img/chatroom-profile.jpg' width='35px' height='35px'></div></div>"
												+"<div class='you-namebubble'><div class='you-name'><span><strong>"+d.userName+"</strong></span></div>"
												+"<div class='you-bubble-flex'><div class='you-bubble'>" +d.chat+ "</div></div>"
											);
					}
				}
			}
		}
	}
//---------------------------------------------

	//채팅창에서 나갔을 때
	function onClose() {
		console.log("퇴장");
		//let da = data.data;
		let str = userName + " 님이 방을 나가셨습니다.";
		
		$("#chating").append("<div class='al0'>"
	  						+"<div class='alo-bubble'>" +str+"</div></div>"
	 						);	
	}
	












	
	