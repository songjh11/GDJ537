<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
</head>
<body>
<section class="container-fluid col-lg-4 mt-5 min-vh-100">
    <div class="row">
        <h1>로그인</h1>
        <form action="./login" method="post">
            <div class="form-group">
                <label th:for="username">아이디</label>
                <input type="text" name="id" class="form-control" placeholder="아이디 입력해주세요">
            </div>
            <div class="form-group">
                <label th:for="password">비밀번호</label>
                <input type="password" class="form-control" name="pw" placeholder="비밀번호 입력해주세요">
            </div>
            <input type="checkbox" name="rememberId" class="form-check-input" id="exampleCheck1">
            <label class="form-check-label" for="exampleCheck1">ID기억하기</label>
            <button type="submit" class="btn btn-primary">로그인</button>
            <button type="submit" class="btn btn-primary">비밀번호 찾기</button>
            <button type="button" class="btn btn-primary">회원 가입</button>
        </form>
        
    
    </div>
</section>
</body>
</html>