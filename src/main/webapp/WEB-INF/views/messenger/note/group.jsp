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

        #title {
            color: black;
            height: 60px;
            width: 430px;
            margin: 10px auto;
            background-color: #fff;
            /* display: flex; */
            justify-content: space-between;
            align-items: center;
            border-radius: 10px 10px;
            font-weight: bold;
            font-size: 14px;


        }

        #contents {
            height: 374px;
            background-color: #fff;
            width: 430px;
            margin: 0 auto 7px;
            border-radius: 10px 10px;
            box-shadow: 2px 2px #8080801f;
        }

        #realContents {
            padding: 12px;
        }

        #inputContents {
            /* background: #c1d1ec26; */
            border: none;
            width: 99%;
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

        #count {
            display: flex;
            right: 0;
            justify-content: flex-end;
            font-size: 11px;
            position: absolute;
            transform: translate3d(-23px, -32px, 10px);
        }

    </style>
    <title>메시지 발송</title>
</head>
<body>
    <div id="noteBox">
        <form action="./group" method="post" id="fofo">
            <input type="hidden" name="sendId" value="${member.id}">
            <input type="hidden">
            <div id="title">
                <div style="margin: 0 15px; padding-top: 12px;">발신자 : ${member.name} (${member.id})</div>
                <div style="margin: 7px 15px;">수신자 : ${daepyo.name} 외 ${count}명</div>
            </div>
            <div id="contents">
                <div id="realContents">
                    <textarea id="inputContents" name="contents"></textarea>
                </div>
            </div>
            <div id="count">
                0 / 5000
            </div>
            
            <div id="btnDiv">
                <button type="button" id="sendBtn">보내기</button>
            </div>
        </form>
    </div>


    <script>

        opener.document.getElementById
        console.log(opener.$(".dkdksk").val());
        

        let val = "";
        $("#inputContents").on("keyup",function(){
            val = $("#inputContents").val();
            console.log(val.length);
            $("#count").text(val.length+" / 5000");
        })

        $("#sendBtn").on("click", function(){
            if(val.length<5001) {
                $("#fofo").submit();
            } else {
                alert("쪽지는 5000자까지 작성할 수 있습니다.")
            }
            
        })


        opener.document.getElementById("pInput").value;
        
    </script>
</body>
</html>