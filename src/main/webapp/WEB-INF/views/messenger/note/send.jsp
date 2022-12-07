<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
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

        }

        #contents {
            height: 390px;
            background-color: #fff;
            width: 430px;
            margin: 0 auto 10px;
            border-radius: 10px 10px;
            box-shadow: 2px 2px #8080801f;
        }

        #realContents {
            padding: 12px;
        }

        #inputContents {
            /* background: #c1d1ec26; */
            border: none;
            width: 100%;
            height: 330px;
            border-top-left-radius: 10px;
            border-top-right-radius: 10px;
            padding: 5px;
        }

        textarea:focus { 
            outline: none; 
        }

        textarea {
            resize: none;
        }

        #btnDiv {
            height: 40px; 
            display: flex; 
            justify-content: center;
        }

        #sendBtn {
            background: linear-gradient(45deg, #758eff, #8a63da8a);
            height: 30px;
            width: 60px;
            border: none;
            color: #fff;
            border-radius: 7px;
            box-shadow: 1px 2px 2px 1px #80808085;


        }

    </style>
    <title>메시지 발송</title>
</head>
<body>
    <div id="noteBox">
        <form action="./send" method="post">
            <input type="hidden" name="sendId" value="${member.id}">
            <input type="hidden" name="receiveId" value="${param.receiveId}">
            <div id="title">
                <div style="margin: 15px;">발신자 : ${member.id}</div>
                <div style="margin: 15px;">수신자 : ${param.receiveId}</div>
            </div>
            <div id="contents">
                <div id="realContents">
                    <textarea id="inputContents" name="contents"></textarea>
                </div>
            </div>

            <div id="btnDiv">
                <button type="submit" id="sendBtn">보내기</button>
            </div>
        </form>
    </div>
</body>
</html>