<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link
  href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css"
  rel="stylesheet"
  integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT"
  crossorigin="anonymous">

</head>
<body>
<section class="container-fluid col-lg-4 mt-5 min-vh-100">
    <div class="row">
     <div class="container-fluid">
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
            <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#findPwModal" data-bs-whatever="@mdo">비밀번호 찾기</button>
            <button type="button" class="btn btn-primary">회원 가입</button>
        </form>
     </div>
    </div>
<div class="modal fade" id="findPwModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="exampleModalLabel">비밀번호 찾기</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <form action="/mail/findpw" method="post">
         <div class="mb-3">
             <label for="member-email" class="col-form-label"><strong>가입한 ID를 입력하세요</strong>:</label>
             <input type="text" class="form-control" id="member-email" name="id"></input>
          </div>
          <div class="mb-3">
             <label for="member-email" class="col-form-label"><strong>가입한 Email을 입력하세요</strong>:</label>
             <input type="email" class="form-control" id="member-email" name="email"></input>
          </div>
  
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
        <button type="submit" class="btn btn-primary">비밀번호 찾기</button>
      </div>
        </form>
      </div>
    </div>
  </div>
</div>
</section>


<script
  defer
  src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"
  integrity="sha384-u1OknCvxWvY5kfmNBILK2hRnQC3Pr17a+RTT6rIHI7NnikvbZlHgTPOOmMi466C8"
  crossorigin="anonymous"
></script>
</body>
</html>