<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<% pageContext.setAttribute("replaceChar", "\r\n"); %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <style>

        @import url('https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap');

        body{
            font-family: 'Nanum Gothic', sans-serif !important;
        }
        * {
            margin: 0;
            padding: 0;
        }

        html, body {
            height: 100%;
        }

        #noteBox {
            background: #c1d1eca3;
            width: 100%;
            height: 100%;
            display: flex;
            flex-direction: column;
        }

        #title {
            color: black;
            height: 50px;
            width: 430px;
            margin: 10px auto;
            background-color: #fff;
            display: flex;
            justify-content: space-between;
            align-items: center;
            border-radius: 10px 10px;
            font-weight: bold;
            box-shadow: 1px 1px 8px 1px #80808026;
            font-size: 14px;
        }

        #receiveId {
            padding: 25px;
        }

        #contents {
            height: 380px;
            background-color: #fff;
            width: 430px;
            margin: 0 auto 7px;
            border-radius: 10px 10px;
            box-shadow: 1px 1px 8px 1px #80808026;
            overflow-y: scroll;
        }

        #contents::-webkit-scrollbar {
            display: none;
        }

        #line {
            border-bottom: 1px solid #cecec59c;
            width: 388px;
            height: 2px;
            margin: 12px 20px 0px;
        }

        #time {
            padding: 21px 25px 0 25px;
            font-size: 13px;
            color: #4579e1d1;
            display: flex;
            justify-content: space-between;
        }

        #realContents {
            padding: 15px 25px 25px 25px;
            word-wrap: break-word;
            font-size: 14px;
        }

        #btnDiv {
            height: 40px; 
            display: flex; 
            justify-content: center;
            align-items: center;
        }

        .sendBtn {
            /* background: linear-gradient(45deg, #758eff, #8a63da8a); */
            height: 30px;
            width: 60px;
            border: none;
            color: #fff;
            border-radius: 7px;
            box-shadow: 1px 2px 2px 1px #80808085;
            margin: 7px;
        }

        .sendBtn:hover {
            cursor: pointer;
        }

    </style>
    <title>Document</title>
</head>
<body>
    <div id="noteBox">
        <div id="title">
            <div sendId="${detail.sendId}" id="sendId" style="margin: 15px;">발신자 : ${sendUser.name} (${detail.sendId})</div>
            <div style="margin: 15px;">수신자 : ${receiveUser.name} (${receiveUser.id})</div>
        </div>
        <div id="contents">
            <div id="time">
                <div>
                    보낸시간 : 
                    <fmt:formatDate value="${detail.regDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
                </div>
                <c:if test="${session.id != receiveUser.id}">
                <div>
                    <c:choose>
                        <c:when test="${detail.readCheck eq 0}"> 읽음 </c:when>
                        <c:when test="${detail.readCheck eq 1}"> 읽지않음 </c:when>
                        <c:otherwise> 오류 </c:otherwise>
                    </c:choose>
                </div>
                </c:if>
            </div>
            
            <div id="line"></div>
            <div id="realContents">${fn:replace(detail.contents, replaceChar, "<br/>")}</div>
            
        </div>
        <div id="btnDiv">
            <!-- <div style="display: none;" sendid=""></div> -->
            <c:if test="${detail.sendId != session.id}">
            <button type="button" class="sendBtn" id="reply" style="background: linear-gradient(45deg, #4e73df, #2196f3)">답장</button>
            </c:if>
            <button type="button" class="sendBtn" id="close" style="background: linear-gradient(45deg, #a6a6a6, #7473758a);">닫기</button>
        </div>
    </div>

    <script>
        $('#close').on("click", function(){
            console.log("닫자");
            window.close();
        })

        $('#reply').on("click",function(){
			console.log("답장");
            let sId = $("#sendId").attr("sendId");
            console.log(sId);
			window.open('./send?receiveId='+sId, '_blank', "width=450px, height=500px, location=no, top=100, left=500");
		})
    </script>
</body>
</html>