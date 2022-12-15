<%@ page language="java" contentType="text/html;
 charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>   

<!DOCTYPE html>
<html>
<head>
   <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
   <script defer src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    
    <link rel="stylesheet" href="/css/chat/chatroom.css">
    
    
   <link rel="icon" href="/images/favicon.png">
	<title> 1:1채팅 💭 </title>
</head>


<body>
    <div id="container" class="container">
      <input type="hidden" id="sessionId" value="${userVO.id}">
   
      <div class="header">
                <div class="header-flex">
                    <div class="tinum">
                        <div class="title">
                            <span><strong>${roomVO.roomName}</strong></span>
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
      
      </div>
      
      <div id="yourName">
         <table class="inputTable">
            <tr>
               <th><input type="hidden" name="userName" value="${userVO.name}" id="userName"></th>
            </tr>
         </table>
      </div>
      <div id="put">
         <table class="msg">
            <tr>
               <th>메시지</th>
               <th><input type="text" id="inputChat"  placeholder="보내실 메시지를 입력하세요."></th>
               <th><button onclick="send()" id="sendBtn" class="sendBtn">보내기</button></th>
            </tr>
         </table>
      </div>
   </div>

   <script type="text/javascript" src="/js/messenger/chatroom.js"></script>

</body>

</html>
