<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
						<!-- 채팅 목록 -->
						<table class="table">
							<thead>
								<tr>
								  <th scope="col" class="text-center" style="padding: 0.8rem; border-top: 0px;">
									<div class="mb-2">방장</div>
								  </th>
								  <th scope="col" class="text-center" style="padding: 0.8rem; border-top: 0px;">
									<div class="mb-2" style="margin-left: 3%;">채팅방이름</div>
								  </th>
								  <th scope="col" style="padding: 0.8rem; border-top: 0px; ">
									<div class="mb-2" style="margin-left: 21%;">인원</div>
								  </th>
								</tr>
							</thead>
						</table>
						<c:forEach items="${roomList}" var="roomVO">
						
						<div class="roomList">
						    <div class="col-3" style="margin-left: 6.4%;">
								<img class="yourImg" src="/img/undraw_profile_3.svg">
							</div>
							<div class="col text-center" style="margin-left: 3%;">
								<a href="#"><b>${roomVO.roomName}</b></a>
							</div>
							<div class="col text-center">
								${roomVO.roomName}
							</div>
					  	</div>
						</c:forEach>
						<!-- 채팅목록 -->
							