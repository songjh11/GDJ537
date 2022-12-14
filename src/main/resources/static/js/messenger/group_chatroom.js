
	//console.log("js");
	
	let ws = new WebSocket("ws://" + location.host + "/chatroom");

	let sessionId = $("#sessionId").val();
	let userName = $("#userName").val();
	//let msg =  $("#msg").val();


//------------------------------------
		
	function wsEvt() {
		
		ws.onopen = function(data){
			//소켓이 열리면 초기화 세팅하기
		}
		
		ws.onmessage = function(data) {
			//메세지를 받으면 동작
			let msg = data.data;
			if(msg != null && msg.trim() != ''){
				
			  let d = JSON.parse(msg);
			  // id를 받을 떄
			  if(d.type =="getId"){
				  let si =d.sessionId != null ; d.sessionId ="";
				  
				  if(si !=""){
					  $("#sessionId").val(si); 
				  }
			  //메세지를 받을 때
			  }else if (d.type =="message"){
				
				console.log("2. d.sessionId : ", d.sessionId);
				console.log("3. sessionId : ", sessionId);
				
				  //내가 보냈을 때
				  if(d.sessionId==$("#sessionId").val()){
					  $("#chating").append("<div class='me'>"
					  						+"<div class='me-bubble-flex-first'><div class='me-bubble'>" +d.msg+"</div>");	
				  
				  //남이 보냈을 때
				  }else{
						$("#chating").append("<div class = 'you'>"
												+"<div class = 'you-flex'>"
												+"<div class='you-profile'>"
												+"<div class='pic'><img src='/img/chatroom-profile.jpg' width='35px' height='35px'></div></div>"
												+"<div class='you-namebubble'><div class='you-name'><span><strong>"+d.userName+"</strong></span></div>"
												+"<div class='you-bubble-flex'><div class='you-bubble'>" +d.msg+ "</div>"
											);
					}
						
				}else{
					console.warn("unknown type!")
				}
			  }

		}

		document.addEventListener("keypress", function(e){
			if(e.keyCode == 13){ //enter press
				send();
			}
		});
	}

//--------------------------------------------

	function chatName(){
		let userName = $("#userName").val();
		if(userName == null || userName.trim() == ""){
			alert("사용자 이름을 입력해주세요.");
			$("#userName").focus();
		}else{
			wsOpen();
			$("#yourName").hide();
			$("#msg").show();
		}
	}

//---------------------------------------------

	function send() {
		
		let option={
				type:"message",
				sessionId : sessionId,
				userName : userName,
				msg : $("#msg").val()
			}
		ws.send(JSON.stringify(option))
		$('#msg').val("");
		
		console.log("s : ", sessionId);
		console.log("u : ", userName);
		console.log("m : ", msg);
	}
	
//---------------------------------------------

	//채팅창에서 들어왔을 때
	function wsOpen () {
		//입장
		//console.log("입장");
		//console.log("open/ sessionId : ", sessionId);

		let str = userName + " 님이 입장하셨습니다.";
		
		$("#chating").append("<div class='me'>"
	  						+"<div class='me-bubble-flex-first'><div class='me-bubble'>" +str+"</div>"
	 						);	
	}

	//채팅창에서 나갔을 때
	function onClose() {
		console.log("퇴장");
		let str = userName + ": 님이 방을 나가셨습니다.";
		console.log("str : ",str);
	}
	












	
	