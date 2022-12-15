<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
						<!-- 채팅 목록 -->
						<table class="table">
						  <thead>
						    <tr>
						      <th scope="col">방장</th>
						      <th scope="col">채팅방이름</th>
						      <th scope="col">인원</th>
						    </tr>
						  </thead>
						  <tbody>
						  	<c:forEach items="${roomList}" var="roomVO">
						    <tr>
						      <th scope="row"><img class="yourImg" src="/img/undraw_profile_3.svg"></th>
						      <td>${roomVO.roomName}</td>
						      <td></td>
						    </tr>
						  	</c:forEach>
						  </tbody>
						</table>
						<!-- 채팅목록 -->
							