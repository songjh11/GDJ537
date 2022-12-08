<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="../temp/user/boot.jsp"></c:import>
</head>
<body>
   <div class="container-fluid">
      <div class="row justify-content-center" style="height: 100vh;">
         <div class="col-3 py-4 px-5" style="border: solid 1px black; border-radius: 20px; position: relative; margin: auto 0">
         
         <h1 class="text-center pb-3"><b>Sign up</b></h1>
         
         <!-- Modal -->
         <div class="modal fade" id="idCheckModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
           <div class="modal-dialog">
             <div class="modal-content">
               <div class="modal-header" style="background-color: #e8f0fe">
               <h1 class="modal-title fs-5" id="exampleModalLabel">사원번호 조회</h1>
               </div>
                  <div class="modal-body">
                  <div class="d-flex my-3">
                      <label style="margin: auto 0"><b>ID</b></label>
                    <input type="text" id="idCheck" class="form-control w-25 mx-2">
                   
                    <label style="margin: auto 0"><b>NAME</b></label>
                    <input type="text" id="nameCheck" class="form-control w-25 mx-2">
                   
                   <button id="search" class="btn btn-primary ms-2"><i class="fa-solid fa-magnifying-glass"></i></button>
                  </div>
                  <table class="table table-striped text-center" style="display: none">
                     <tr>
                        <th>사원번호</th>
                        <th>이름</th>
                        <th>부서</th>
                        <th>직급</th>
                        <th>입사일</th>
                     </tr>
                     <tr>
                        <td id="id"></td>
                        <td id="name"></td>
                        <td id="dep"></td>
                        <td id="role"></td>
                        <td id="date"></td>
                     </tr>
                  </table>
                  </div>
               <div class="modal-footer">
                 <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                 <button type="button" class="btn btn-primary" id="add">등록</button>
               </div>
             </div>
           </div>
         </div>
         
         
         <form:form action="join" modelAttribute="userVO" method="post" enctype="multipart/form-data">
            
            <div class="d-flex my-3">
               <div style="margin: auto 0; width: 35%">
                  <b>ID</b>
                  <!-- Button trigger modal -->
                  <button type="button" class="btn btn-primary ms-1" data-bs-toggle="modal" data-bs-target="#idCheckModal">
                  <i class="fa-solid fa-magnifying-glass"></i>
                  </button>
               </div>
               <input type="text" class="form-control" name="id" id="addId" readonly="readonly" style="width: 65%; height: 35px;">
            </div>
            
            <div class="d-flex my-3">
               <b style="margin: auto 0; width: 35%">Name</b>
               <input type="text" class="form-control" name="name" id="addName" readonly="readonly" style="width: 65%; height: 35px">
            </div>
            
            <div class="d-flex my-3">
               <b style="margin: auto 0; width: 35%">Department</b> 
               <input type="text" class="form-control" id="addDep" readonly="readonly" style="width: 65%; height: 35px">
            </div>
            
            <hr class="my-4">
            
            <div class="d-flex">
               <div class="w-60 me-3" style="margin: auto 0">
                  <div>
                     <b><span style="color: red">*</span>Password</b>
                     <form:password path="pw" cssClass="form-control" id="pw" />
                     <form:errors path="pw"></form:errors>
                  </div>
                  
                  <div class="mt-3">
                     <b><span style="color: red">*</span>Password Check</b>
                     <form:password path="pw2" cssClass="form-control" id="pw2" />
                     <form:errors path="pw2"></form:errors>
                  </div>
               </div>
               
               <div class="w-50" style="margin: auto 0">
                  <input type="file" id="file" name="file" accept="image/*" onchange="setThumbnail(event);" style="display: none">
                  <label id="fileAdd" for="file" ><img id="default" src="/img/user/user.webp" width="140" height="160" class="border border-black rounded-3" >
                  <div id="profile"></div>
                  </label>
                  <div id="fileBox"></div> 
               </div>
            </div>
            
            <div class="my-3">
               <b><span style="color: red">*</span>Email address</b>
               <div class="d-flex">
               <form:input path="email" cssClass="form-control" id="email" cssStyle="height:38px"/>
               <span class="px-1" style="margin: auto 0;">@</span>
               <form:select path="address" class="form-select" id="address">
                  <option selected hidden>선택</option>
                  <option value="naver.com">naver.com</option>
                  <option value="gmail.com">gmail.com</option>
                  <option value="hanmail.net">hanmail.net</option>
                  <option value="nate.com">nate.com</option>
               </form:select>
               </div>
               <form:errors path="email"></form:errors>
               <form:errors path="address"></form:errors>
            </div>
            
            <div class="my-3">
               <b><span style="color: red">*</span>Phone number</b>
               <form:input path="phone" cssClass="form-control" id="phone" placeholder="숫자만 입력해주세요"/>
               <form:errors path="phone"></form:errors>
            </div>
            
            <div class="text-center py-3">
               <button type="submit" id="joinBtn" class="btn btn-primary w-50">회원가입</button>
            </div>
         </form:form>
      </div>
   </div>
   </div>
<script src="/js/user/join.js"></script>
</body>
</html>