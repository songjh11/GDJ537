<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
						<!-- 채팅 목록 -->
						<table class="table" style="margin-bottom: 0.5rem;">
							<thead>
								<tr>
								  <th scope="col" class="text-center" style="padding: 0.8rem; border-top: 0px;">
									<div class="mb-2" style="margin-right: 10%;">방장</div>
								  </th>
								  <th scope="col" class="text-center" style="padding: 0.8rem; border-top: 0px;">
									<div class="mb-2">채팅방이름</div>
								  </th>
								  <th scope="col" style="padding: 0.8rem; border-top: 0px; ">
									<div class="mb-2" style="margin-left: 16%;">인원</div>
								  </th>
								</tr>
							</thead>
						</table>
										
						<div class="roomArea" style="overflow-y: scroll; overflow-x: hidden; height: 550px;">							
							<c:forEach items="${roomList}" var="roomVO">
								<div class="roomList">
									<div class="col-3" style="margin-left: 6.4%;">
										<img class="yourImg" src="/img/undraw_profile_3.svg">
									</div>
									<div class="col text-center" style="margin-left: 3%;">
										<a class="roomLink" href="" onclick="javascript:chatPop('${roomVO.roomNum}');"><b>${roomVO.roomName}</b></a>
										<%-- <a class="roomLink" href="./chatroom?roomNum=${roomVO.roomNum}" onclick=""><b>${roomVO.roomName}</b></a> --%>
									</div>
									<div class="col text-center">
										${roomVO.roomName}
									</div>
								</div>
							</c:forEach>
						</div>
						<!-- 채팅목록 -->
						
						<script type="text/javascript">
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
								window.open('/messenger/chatroom/'+roomNum, '단체 채팅방', strOption);
							}
						</script>
							