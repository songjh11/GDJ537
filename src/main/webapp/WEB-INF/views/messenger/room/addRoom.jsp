<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
						<!-- 채팅 목록 -->
						<table class="table">
						  <thead>
						    <tr>
						      <th scope="col">인원</th>
						      <th scope="col">채팅방이름</th>
						      <th scope="col">참여</th>
						    </tr>
						  </thead>
						  <tbody>
						  	<c:forEach items="${roomList}" var="roomVO">
						    <tr>
						      <th scope="row">${roomVO.roomNum}</th>
						      <td>${roomVO.roomName}</td>
						      <td scope="row"><a>참여하기</a></td>
						    </tr>
						  	</c:forEach>
						  </tbody>
						</table>
						<p class="mt-4 text-center">
							<a id="roomBtn" href="" class="btn" style="background: #4e73df; color: #FFFFFF;">그룹쪽지</a>
						</p>										
						<!-- 채팅목록 -->
							