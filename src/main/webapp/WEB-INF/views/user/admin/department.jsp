<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<meta charset="UTF-8">
<!-- meta tag 추가 -->
<meta name="viewport"
   content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>department</title>
<!-- 공통 css, js, jquery -->
<c:import url="../../temp/layout_header.jsp"></c:import>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
<link rel="stylesheet" href="/css/admin/admin.css">
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
</head>

<!-- body ID 작성 -->
<body id="page-top">

   <!-- Page Wrapper 전체 Contents Wrapper -->
   <div id="wrapper">

      <!-- Sidebar import -->
      <c:import url="../../temp/layout_sidebar.jsp"></c:import>
      <!-- End of Sidebar -->

      <!-- Content Wrapper -->
      <div id="content-wrapper" class="d-flex flex-column">
         <!-- Main Content -->
         <div id="content">

            <!-- Topbar import-->
            <c:import url="../../temp/layout_topbar.jsp"></c:import>
            <!-- End of Topbar -->

            <!-- Begin Page Content -->
            <div class="container-fluid">


               <ul class="nav nav-tabs">
                  <li class="nav-item"><a class="nav-link"
                     href="./wait" id="user">미승인</a></li>
                  <li class="nav-item"><a class="nav-link"
                     href="./user" id="user">사원</a></li>
                  <li class="nav-item"><a class="nav-link active" href="./department"
                     id="department">부서</a></li>
                  <li class="nav-item"><a class="nav-link" href="./role"
                     id="role">직급</a></li>
                  <!-- <li class="nav-item"><a class="nav-link" href="#" id="addDepartment">+</a></li> -->
               </ul>

               <!-- <table class="table table-bordered w-auto"> -->
               <table class="table table-bordered">
                  <thead>
                     <tr>
                        <th class="table-light" scope="col">부서번호</th>
                        <th class="table-light" scope="col">부서이름</th>
                        <th class="table-light" scope="col">부장번호</th>
                        <th class="table-light" scope="col">부장이름</th>
                        <th class="table-light" scope="col"></th>
                     </tr>
                  </thead>
                  <tbody class="table-group-divider">

                     <c:forEach items="${list}" var="departmentVO">
                     <tr class="department">
                        <th scope="row">${departmentVO.depNum}</th>
                        <td class="showDepartment" data-department="depName">${departmentVO.depName}</td>
                        <td class="showDepartment" data-department="id">
                        <c:choose>
                           <c:when test="${departmentVO.id eq null}">
                              공석
                           </c:when>
                           <c:otherwise>
                              ${departmentVO.id}
                           </c:otherwise>
                        </c:choose>
                        </td>
                        <td>
	                     	<c:forEach items="${listU}" var="userVO">
		                        <c:choose>
		                           <c:when test="${departmentVO.id eq userVO.id}">
		                              ${userVO.name }
		                           </c:when>
		                           <c:otherwise>
		                           </c:otherwise>
		                        </c:choose>
	                        </c:forEach>
                        </td>
                        <td class="departmentDel"><a href="#">삭제</a></td>
                     </tr>
                     </c:forEach>
                  </tbody>
               </table>
                  <a class="nav-link" href="#" id="addDepartment">부서 추가</a>


            </div>
            <!-- End Page Content -->

         </div>
         <!-- End of Main Content -->

         <!-- Footer import -->
         <c:import url="../../temp/layout_footer.jsp"></c:import>
         <!-- End of Footer -->
      </div>
      <!-- End of Content Wrapper -->
   </div>

   <!-- Scroll Top, Logout Modal import -->
   <c:import url="../../temp/layout_top_logoutModal.jsp"></c:import>
   <script src="/js/admin/department.js"></script>
</body>
</html>