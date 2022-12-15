<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
						<!-- 채팅 목록 -->
						<table class="table">
							<thead>
								<tr>
								  <th scope="col" style="padding: 0.5rem; border-top: 0px;">방장</th>
								  <th scope="col" style="padding: 0.5rem; border-top: 0px;">채팅방이름</th>
								  <th scope="col" style="padding: 0.5rem; border-top: 0px;">인원</th>
								</tr>
							</thead>
						</table>
						<c:forEach items="${roomList}" var="roomVO">
						
						<div class="roomList">
						    <div class="col-2">
								<img class="yourImg" src="/img/undraw_profile_3.svg">
							</div>
							<div class="col text-center">
								<a href="#"><b>${roomVO.roomName}</b></a>
							</div>
							<div class="col text-center">
								${roomVO.roomName}
							</div>
					  	</div>
						</c:forEach>
						<!-- 채팅목록 -->
							