<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
						<!-- 채팅 목록 -->
						<table class="table" style="margin-bottom: 0.5rem;">
							<thead>
								<tr>
								  <th scope="col" class="text-end" style="padding: 0.8rem; border-top: 0px;">
									<div class="mb-2" style="margin-left: 80px;">방장</div>
								  </th>
								  <th scope="col" class="text-start" style="padding: 0.8rem; border-top: 0px;">
									<div class="mb-2" style="margin-right: 8px;">채팅방이름</div>
								  </th>
								  <th scope="col" style="padding: 0.8rem; border-top: 0px;">
									<div class="mb-2" style="margin-right: 25px;">인원</div>
								  </th>
								</tr>
							</thead>
						</table>
    					<div class="roomArea" style="overflow-y: scroll; overflow-x: hidden; height: 550px;">					
						<!-- 그룹채팅 목록 -->
							<h3>Group</h3>
							<c:forEach items="${roomList}" var="roomVO">
								<c:if test="${roomVO.kind eq '0'}">
									<div class="chatRoomList">
										<div class="col-3" style="margin-left: 6.4%;">
											<img class="yourImg" src="/img/undraw_profile_3.svg">
											<span>${roomVO.userVO.name}</span>
										</div>
										<!-- <c:choose>
											<c:when test="${user.name eq roomVO.roomName}">
												<div class="col text-center" style="margin-left: 3%;">
													<a href="./chatroom?roomNum=${roomVO.roomNum}" class="roomPw" data-room-num="${roomVO.roomNum}"><b>${roomVO.roomName}</b></a>
												</div>
											</c:when>
											<c:otherwise>
												<div class="col text-center" style="margin-left: 3%;">
													<a href="./chatroom?roomNum=${roomVO.roomNum}" class="roomPw" data-room-num="${roomVO.roomNum}"><b>${roomVO.roomName}</b></a>
												</div>
											</c:otherwise>
										</c:choose> -->
										<!-- 소영이 a태그 -->
										<div class="col text-center" style="margin-left: 3%;">
											<a class="roomLink" href="" onclick="javascript:chatPop('${roomVO.roomNum}');"><b>${roomVO.roomName}</b></a>
											<!-- <a class="roomLink" href="./chatroom?roomNum=${roomVO.roomNum}" onclick=""><b>${roomVO.roomName}</b></a> -->
										</div>
 	 									<div class="col text-center" style="margin-left: 3%;">
	 										<button type="button" class="roomLink" data-room-num="${roomVO.roomNum}">${roomVO.roomName}</button>			
										</div>
										<div class="col text-center style="margin-left: 8%;">
											${roomVO.total}
										</div>
									</div>
								</c:if>
							</c:forEach>
							<!-- 그룹채팅 목록 -->
							<br>
							<!-- 1:1 채팅 목록 -->
							<h3>1:1</h3>
							<c:forEach items="${roomList}" var="roomVO">
							<c:if test="${roomVO.kind eq '1'}">
								<div class="chatRoomList">
									<div class="col-3" style="margin-left: 6.4%;">
										<img class="yourImg" src="/img/undraw_profile_3.svg">
										<span>${roomVO.userVO.name}</span>
									</div>
									<c:choose>
										<c:when test="${user.name eq roomVO.roomName}">
											<div class="col text-center" style="margin-left: 3%;">
												<a href="./chatroom?roomNum=${roomVO.roomNum}" class="roomPw" data-room-num="${roomVO.roomNum}"><b>${roomVO.roomName}</b></a>
											</div>
										</c:when>
										<c:otherwise>
											<div class="col text-center" style="margin-left: 3%;">
												<a href="./chatroom?roomNum=${roomVO.roomNum}" class="roomPw" data-room-num="${roomVO.roomNum}"><b>${roomVO.roomName}</b></a>
											</div>
										</c:otherwise>
									</c:choose>
									<!-- 1:1채팅 입장 a태그 -->
									<div class="col text-center" style="margin-left: 3%;">
										<%-- <a class="roomLink" href="" onclick="javascript:chatPop('${roomVO.roomNum}');"><b>${roomVO.roomName}</b></a> --%>
										<a class="roomLink" href="./oneChat?roomNum=${roomVO.roomNum}"><b>${roomVO.roomName}</b></a>
									</div>
									<div class="col text-center style="margin-left: 8%;">
										${roomVO.total}
									</div>
								</div>
							</c:if>
							</c:forEach>
							<!-- 1:1 채팅 목록 -->
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
							window.open('/messenger/chatroom?roomNum='+roomNum, '단체 채팅방', strOption);
						}

						
						</script>