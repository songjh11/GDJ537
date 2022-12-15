  let ws;

   function wsOpen(){
      ws = new WebSocket("ws://" + location.host + "/chating");
      wsEvt();
   }

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
				}else if (d.type =="message")
					{if(d.sessionId==$("#sessionId").val()){
						
						$("me").append("<div class='me-bubble-flex-first'><div class='me-bubble'>" +d.msg+"</div>"),
																//읽음 확인
						$("me").append("<div class='me-count'><span>1</span></div></div></div>")		
					
					}else{
						$("#you-flex").append("<div class='you-profile'>"),
																		//프사
						$("#you-flex").append("<div class='pic'><img src='/img/chatroom-profile.jpg' width='35px' height='35px'></div></div>"),
						$("#you-flex").append("<div class='namebubble'><div class='name'><span><strong>"+d.userName+"</strong></span></div>"),
						$("#you-flex").append("<div class='you-bubble-flex'><div class='you-bubble'>" +d.msg+ "</div>"),
																		//읽음 표시
						$("#you-flex").append("<div class='you-count'><span>1<span></div></div></div></div>");
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
}
