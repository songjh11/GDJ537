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
						<div style="overflow-y: scroll; overflow-x: hidden; height: 550px;">							
							<c:forEach items="${roomList}" var="roomVO">
								<div class="roomList">
									<div class="col-3" style="margin-left: 6.4%;">
										<img class="yourImg" src="/img/undraw_profile_3.svg">
									</div>
									<div class="col text-center" style="margin-left: 3%;">
										<input type="hidden" id="roomNum" value="${roomVO.roomNum}">
										<a href="" onclick="javascript:chatPop('${roomVO.roomNum}'); return false;"><b>${roomVO.roomName}</b></a>
									</div>
									<div class="col text-center">
										${roomVO.roomName}
									</div>
								</div>
							</c:forEach>
						</div>
						<!-- 채팅목록 -->
							