
	let ws;

	function wsOpen(){
		ws = new WebSocket("ws://" + location.host + "/chating");
		wsEvt();
	}
		
	function wsEvt() {
		ws.onopen = function(data){
			//소켓이 열리면 초기화 세팅하기
		}
		
		ws.onmessage = function(data) {
			let msg = data.data;
			if(msg != null && msg.trim() != ''){
				
			  let d = JSON.parse(msg);
			  if(d.type =="getId"){
				
				  
				  let si =d.sessionId != null ; d.sessionId ="";
				  if(si !=""){
					  $("#sessionId").val(si);
					  
				  }
			  }else if (d.type =="message"){
				  if(d.sessionId==$("#sessionId").val()){
					  $("#chating").append("<p class='me'>나 :" + d.msg + "</p>");	
				  }else{
						$("#chating").append("<p class='others'>" + d.userName + " :" + d.msg + "</p>");
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

	function chatName(){
		let userName = $("#userName").val();
		if(userName == null || userName.trim() == ""){
			alert("사용자 이름을 입력해주세요.");
			$("#userName").focus();
		}else{
			wsOpen();
			$("#yourName").hide();
			$("#yourMsg").show();
		}
	}

	function send() {
		
		let option={
				type:"message",
				sssionId:$("#sessionId").val(),
				userName:$("#userName").val(),
				msg: $("#chatting").val()
			}
		ws.send(JSON.stringify(option))
		$('#chatting').val("");
	}