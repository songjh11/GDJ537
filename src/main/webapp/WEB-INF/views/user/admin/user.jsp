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
<title>user</title>
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
                     href="./wait" id="wait">미승인</a></li>
                  <li class="nav-item"><a class="nav-link active"
                     href="./user" id="user">사원</a></li>
                  <li class="nav-item"><a class="nav-link" href="./department"
                     id="department">부서</a></li>
                  <li class="nav-item"><a class="nav-link" href="./role"
                     id="role">직급</a></li>
               </ul>

               <!-- <table class="table table-bordered w-auto"> -->
               <table class="table table-bordered">
                  <thead>
                     <tr>
                        <th class="table-light id" scope="col">사원번호</th>
                        <th class="table-light roleName" scope="col">직급</th>
                        <th class="table-light depName" scope="col">부서</th>
                        <th class="table-light name" scope="col">이름</th>
                        <th class="table-light" scope="col">이메일</th>
                        <th class="table-light" scope="col">전화번호</th>
                        <th class="table-light entDate" scope="col">입사일</th>
                        <th class="table-light" scope="col"></th>
                     </tr>
                  </thead>
                  <tbody class="table-group-divider">
                     <c:forEach items="${list}" var="userVO">
                     <tr>
                        <th scope="row">${userVO.id}</th>
                        
                        <td class="" data-user="roleNum">
                             <select class="roleNumSelect" value=${userVO.id }>
	                             <c:forEach items="${listR}" var="roleVO">
	                        		<option value=${roleVO.roleNum }
		                        		<c:if test="${userVO.roleVO.roleName eq roleVO.roleName}">
		                        			selected="selected"                    		
		                        		</c:if>>
		                        		${roleVO.roleName}
	                        		</option>
                        		</c:forEach>
                        	</select>
                        </td>
                        <td class="" data-user="depNum">

                             <select class="depNumSelect" value=${userVO.id }>
	                             <c:forEach items="${listD}" var="departmentVO">
	                        		<option value=${departmentVO.depNum }
		                        		<c:if test="${userVO.departmentVO.depName eq departmentVO.depName}">
		                        			selected="selected"                    		
		                        		</c:if>>
		                        		${departmentVO.depName}
	                        		</option>
                        		</c:forEach>
                        	</select>                        
                        
                        </td>
                        <td class="" data-user="name">${userVO.name}</td>
                        <td class="" data-user="email">${userVO.email}</td>
                        <td class="" data-user="phone">${userVO.phone}</td>
                        <td class="showUser" data-user="entDate">${userVO.entDate}</td>
                        <td class="dismiss"><a href="#">퇴사</a></td>
                        
	                        	 
                        </td>
                        
                     </tr>
                     </c:forEach>

                  </tbody>
               </table>

				<!-- Modal R -->
				<div class="modal fade" id="exampleModalR" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
				  <div class="modal-dialog modal-dialog-centered">
				    <div class="modal-content">
				      <div class="modal-header">
				        <h1 class="modal-title fs-5" id="exampleModalLabel">변경할 직급을 선택해주세요</h1>
				        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				      </div>
				      <div class="modal-body">
				      	<c:forEach items="${listR}" var="roleVO">
				        <center><button type="button" class="btn btn-primary roleNumUpdate" data-bs-dismiss="modal" data-rolenum=${roleVO.roleNum }>${roleVO.roleName}</button><br><br></center>
				        </c:forEach>
				      </div>
				      <div class="modal-footer">
				      </div>
				    </div>
				  </div>
				</div>
				<!-- Modal End -->
				
				<!-- Modal D -->
				<div class="modal fade" id="exampleModalD" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
				  <div class="modal-dialog modal-dialog-centered">
				    <div class="modal-content">
				      <div class="modal-header">
				        <h1 class="modal-title fs-5" id="exampleModalLabel">변경할 부서를 선택해주세요</h1>
				        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				      </div>
				      <div class="modal-body">
				      	<c:forEach items="${listD}" var="departmentVO">
				        <center><button type="button" class="btn btn-primary depNumUpdate" data-bs-dismiss="modal" data-depnum=${departmentVO.depNum }>${departmentVO.depName}</button><br><br></center>
				        </c:forEach>
				      </div>
				      <div class="modal-footer">
				      </div>
				    </div>
				  </div>
				</div>
				<!-- Modal End -->

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
   <script src="/js/admin/user.js"></script>
   <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>