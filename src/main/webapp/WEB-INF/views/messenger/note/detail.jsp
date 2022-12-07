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
            background: #fff;
            width: 100%;
            height: 100%;
            display: flex;
            flex-direction: column;
        }

        #title {
            color: black;
            height: 50px;
            width: 440px;
            margin: 10px auto;
            background-color: #c1d1eca3;
            display: flex;
            /* justify-content: center; */
            align-items: center;
            border-radius: 10px 10px;
            font-weight: bold;
            box-shadow: 1px 1px 8px 1px #80808026;

        }

        #receiveId {
            padding: 25px;
        }

        #contents {
            height: 430px;
            background-color: #c1d1eca3;
            width: 440px;
            margin: 0 auto 10px;
            border-radius: 10px 10px;
            box-shadow: 1px 1px 8px 1px #80808026;
        }

        #realContents {
            padding: 25px;
        }

    </style>
    <title>Document</title>
</head>
<body>
    <div id="noteBox">
        <div id="title">
            <div id="receiveId">발신자 : ${detail.sendId}</div>
        </div>
        <div id="contents">
            <div id="realContents">${detail.contents}</div>
            
        </div>
    </div>
</body>
</html>