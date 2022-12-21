<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
						<!-- 채팅 목록 -->
						<table class="table" style="margin-bottom: 0.5rem;">
							<thead>
								<tr>
								  <th scope="col" class="text-end" style="padding: 0.8rem; border-top: 0px;">
									<div class="mb-2" style="margin-left: 90px;">방장</div>
								  </th>
								  <th scope="col" class="text-start" style="padding: 0.8rem; border-top: 0px;">
									<div class="mb-2" style="margin-right: 8px;">채팅방이름</div>
								  </th>
								  <th scope="col" style="padding: 0.8rem; border-top: 0px;">
									<div class="mb-2" style="margin-right: 20px;">인원</div>
								  </th>
								</tr>
							</thead>
						</table>
						<!-- 그룹채팅 목록 -->
    					<div class="chatRoomArea" style="overflow-y: scroll; overflow-x: hidden; height: 550px;">
							<select class="form-control" id="kindCheck" style="width: 110px; margin-left: 7px;">
								<option value="1">1:1채팅</option>
								<option value="0">그룹채팅</option>
							</select>
							<c:forEach items="${roomList}" var="roomVO" varStatus="status">
								<c:if test="${roomVO.kind eq '0'}">
									<div class="chatRoomList groupRoomList" id="groupRoomList" style="display: none;">
										<div class="col-3" style="margin-left: 6.4%;">
											<img class="yourImg" src="/file/user/${roomVO.userVO.profile}">
											<span>${roomVO.userVO.name}</span>
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
							<!-- 1:1 채팅 목록 -->
							<c:forEach items="${roomList}" var="roomVO">
							<c:if test="${roomVO.kind eq '1'}">
								<div class="chatRoomList oneRoomList" style="display: flex;">
									<div class="col-3" style="margin-left: 6.4%;">
										<img class="yourImg" src="/file/user/${roomVO.userVO.profile}">
										<span>${roomVO.userVO.name}</span>
									</div>
									<!-- 1:1채팅 입장 a태그 -->
									<div class="col text-center" style="margin-left: 3%;">
										 <a class="roomLink1" href="" onclick="javascript:Popup('${roomVO.roomNum}');"><b>${roomVO.roomName}</b></a>
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
						
						function Popup(roomNum){
							window.open('/messenger/oneChat/'+roomNum, '개인 채팅방', strOption);
						}
						
					
						</script>
