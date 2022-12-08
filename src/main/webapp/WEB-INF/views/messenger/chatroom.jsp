<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
    
    <link rel="stylesheet" href="chatroom.css">
    
    <link rel="icon" href="/images/favicon.png">
	<title>채팅방 💭 </title>
</head>


<body>
    <!-- 팝업 사이즈 680*1024 -->

    <div class="wrapAll">
        <div class="contain">
            
            <div class="header">
                <div class="header-flex">
                    <div class="tinum">
                        <div class="title">
                            <span><strong>채팅방 이름</strong></span>
                        </div>
                        <div class="number">
                            <img src="/image/chatroom-number.png" width="15px" height="15px">
                            <span>2</span>
                        </div>
                    </div>
                    <div class="search">
                        <img src="/image/chatroom-search.png" width="15px" height="15px">
                    </div>
                </div>
            </div>
            
            <div class="chat">
                <div class="you">
                    <div class="you-flex">
                        <div class="you-profile">
                            <div class="pic">
                                <img src="/image/chatroom-profile.jpg" width="35px" height="35px">
                            </div>
                        </div>
                        <div class="namebubble">
                            <div class="name">
                                <span><strong>name</strong></span>
                            </div>
                            <div class="you-bubble-flex">
                                <div class="you-bubble">
                                    상대방이 처음 보낸 채팅
                                </div>
                                <div class="you-count">
                                    <span>1</span>
                                </div>
                            </div>

                            <div class="you-bubble-flex">
                                <div class="you-bubble">
                                    상대방이 보낸 채팅
                                </div>
                                <div class="you-count">
                                    <span>1</span>
                                </div>
                            </div>

                            <div class="you-bubble-flex">
                                <div class="you-bubble">
                                    상대방이 보낸 채팅
                                </div>
                                <div class="you-count">
                                    <span>1</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="me">
                    <div class="me-bubble-flex-first">
                        <div class="me-bubble">
                            내가 처음 보낸 채팅
                        </div>
                        <div class="me-count">
                            <span>1</span>
                        </div>
                    </div>

                    <div class="me-bubble-flex">
                        <div class="me-bubble">
                            내가 보낸 채팅
                        </div>
                        <div class="me-count">
                            <span>1</span>
                        </div>
                    </div>
                </div>
            </div>
            
            <div class="put">
                <div class="typing">
                    <input class="text" type="text">
                </div>

                <div class="button">
                    <span><strong>전송</strong></span>
                </div>
            </div>
        </div>
    </div>



</body>

</html>
