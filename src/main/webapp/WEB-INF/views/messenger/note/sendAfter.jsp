<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
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

        #afterMsg {
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

        #afterMsg > div {
            padding: 16px;
        }

        #btnDiv {
            height: 40px; 
            display: flex; 
            justify-content: center;
            align-items: center;
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

        #sendBtn:hover {
            cursor: pointer;
        }

    </style>
    <title>메시지 발송</title>
</head>
<body>
    <div id="noteBox">
        <div id="afterMsg">
            <div>${message}</div>
        </div>

        <div id="btnDiv">
            <button type="button" id="sendBtn">닫기</button>
        </div>
    </div>

    <script>
        $('#sendBtn').on("click", function(){
            console.log("닫자");
            window.close();
        })
    </script>
</body>
</html>