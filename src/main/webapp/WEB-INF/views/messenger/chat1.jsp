<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %> 

<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<meta charset="UTF-8">
	<title> 채팅방 💭 </title>
	<style>
		*{
			margin:0;
			padding:0;
		}
		.container{
			width: 500px;
			margin: 0 auto;
			padding: 25px
		}
		.container h1{
			text-align: left;
			padding: 5px 5px 5px 15px;
			color: #FFBB00;
			border-left: 3px solid #FFBB00;
			margin-bottom: 20px;
		}
		.chating{
			background-color: #000;
			width: 500px;
			height: 500px;
			overflow: auto;
		}
		.chating p{
			color: #fff;
			text-align: left;
		}
		input{
			width: 330px;
			height: 25px;
		}
		#yourMsg{
			display: none;
		}
	</style>
	
	 <link rel="stylesheet" href="/css/chatroom.css">
	 <script type="text/javascript" defer src="/js/messenger/chatroom.js"></script>
	
</head>


<body>
	<div id="container" class="container">
		<input type="hidden" id="sessionId" value="">
	
		<div class="header">
                <div class="header-flex">
                    <div class="tinum">
                        <div class="title">
                            <span><strong>채팅방 이름</strong></span>
                        </div>
                        <div class="number">
                            <img src="/img/chatroom-number.png" width="15px" height="15px">
                            <span>2</span>
                        </div>
                    </div>
                    <div class="search">
                        <img src="/img/chatroom-search.png" width="15px" height="15px">
                    </div>
                </div>
            </div>
		
		<div id="chating" class="chating">
			<div class="you-flex">
			
			</div>
			
			<div class="me">
				
			</div>
		</div>
		
		<div id="yourName">
			<table class="inputTable">
				<tr>
					<th>사용자명</th>
					<th><input type="text" name="userName" id="userName"></th>
					<th><button onclick="chatName()" id="startBtn">이름 등록</button></th>
				</tr>
			</table>
		</div>
		<div id="yourMsg">
			<table class="inputTable">
				<tr>
					<th>메시지</th>
					<th><input id="chatting" placeholder="보내실 메시지를 입력하세요."></th>
					<th><button onclick="send()" id="sendBtn">보내기</button></th>
				</tr>
			</table>
		</div>
	</div>
</body>
</html>