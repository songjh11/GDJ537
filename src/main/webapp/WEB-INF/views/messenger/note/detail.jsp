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
        * {
            margin: 0;
            padding: 0;
        }

        html, body {
            height: 100%;
        }

        #noteBox {
            background: #e6f2ff;
            width: 100%;
            height: 100%;
        }

    </style>
    <title>Document</title>
</head>
<body>
    <div id="noteBox">
        <div>
            ${detail.contents}
        </div>
    </div>
</body>
</html>