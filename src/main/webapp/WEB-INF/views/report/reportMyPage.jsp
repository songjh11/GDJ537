<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- meta tag 추가 -->
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Insert title here</title>
<script defer src="/js/hjs/test.js"></script>
<c:import url="../common/jquery.jsp"></c:import>
<!-- 공통 css, js, jquery -->
<c:import url="../temp/layout_header.jsp"></c:import>

</head>

<!-- body ID 작성 -->
<body id="page-top">

	<!-- Page Wrapper 전체 Contents Wrapper -->
    <div id="wrapper">

		<!-- Sidebar import -->
		<c:import url="../temp/layout_sidebar.jsp"></c:import>
		<!-- End of Sidebar -->
		
		 <!-- Content Wrapper -->
		<div id="content-wrapper" class="d-flex flex-column">
			<!-- Main Content -->
			<div id="content">
				
	            	<%-- <a class="collapse-item">${member.id}</a> --%>
				<!-- Topbar import-->
				<c:import url="../temp/layout_topbar.jsp"></c:import>
				<!-- End of Topbar -->
				
				<!-- Begin Page Content -->
	            <div class="container-fluid">					
					<h1 class="h3 mb-4 text-gray-800">내가 결재 받아야할 승인자 목록</h1>
					
					
						<sec:authentication property="Principal" var="member"/>
						<%-- <h3>아이디 : ${member.id}</h3>		
						<h3>이름 : ${member.name}</h3>	
						<h3>부서명 : ${member.depNum}</h3>
						<h3>나의 직급 : ${member.roleVO.roleName}</h3>	 --%>
						
<%-- 						아이디:<input type="text" readonly name="id" value="${member.id}"><br>
						이름 :<input type="text" readonly name="name" value="${member.name}"><br>
						부서명:<input type="text" readonly name="depNum" value="${member.depNum}"><br>
						직급 :<input type="text" readonly name="roleName" value="${member.roleVO.roleName}"><br> --%>
					
			<%-- 		뎁네임 <input type="text" value="${member.departmentVO.depName}">
					뎁네임 <input type="text" value="${depName}">
					뎁네임 <input type="text" value="${departmentVO.depName}">
					뎁네임 <input type="text" value="${reportVO2.depName}">
					뎁네임 <input type="text" value="${reportVO2.departmentVO.depName}"> --%>
					
	            	
	            	
<%-- 	            	${userVO}
	            	내가 결제를 받아야 할 승인자 목록: 
	            	<input type="text" name="id" id="lsId" value="${userVO.id}">
	            	<input type="text" name="name" id="lsName" value="${userVO.name}">
	            	<input type="text" name="depName" id="lsDepName" value="${userVO.departmentVO.depName}">
	            	<input type="text" name="roleName" id="lsRoleName" value="${userVO.roleVO.roleName}"> --%>
	            	
	            	
	            	
<%-- 	            	최종 승인자
	            	${userVO2}
	            	<input type="text" name="id" value="${userVO2.id}">
	            	<input type="text" name="name" value="${userVO2.name}">
	            	<input type="text" name="depName" value="${userVO2.departmentVO.depName}">
	            	<input type="text" name="roleName" value="${userVO2.roleVO.roleName}"> --%>
	            	
	            	<div style="display: flex">
		            	<!-- 나의 정보 -->
		            	 <div class="col-xl-3 col-md-4 mb-4">
	                        <div class="card border-left-info shadow h-100 py-2">
	                            <div class="card-body">
	                                <div class="row no-gutters align-items-center">
	                                    <div class="col mr-2">
	                                        <div class="text-xs font-weight-bold text-info text-uppercase mb-1">
	                                        	<h4 style="border: 2">나의 정보</h4>
	                                        	<h6>아이디 : ${member.id}</h6>
	                                        	<h6>이름 : ${member.name}</h6>
	                                        	<h6 id="dpName" data-hh="${member.depNum}">부서명 : ${member.depNum}</h6>
	                                        	<h6>직급 : ${member.roleVO.roleName}</h6>
	       
	                                       		<%-- <input type="text" name="id" id="lsId" value="${userVO.id}">
								            	<input type="text" name="name" id="lsName" value="${userVO.name}">
								            	<input type="text" name="depName" id="lsDepName" value="${userVO.departmentVO.depName}">
								            	<input type="text" name="roleName" id="lsRoleName" value="${userVO.roleVO.roleName}"> --%>
	                                        </div>
	                                        <div class="row no-gutters align-items-center">
	                                   
	                                        </div>
	                                    </div>
	                                    <div class="col-auto">
	                                        <i class="fas fa-clipboard-list fa-2x text-gray-300"></i>
	                                    </div>
	                                </div>
	                            </div>
	                        </div>
	                    </div>
	                    <div style="padding-top: 90px">
	                    	<svg xmlns="http://www.w3.org/2000/svg" width="50" height="32" fill="currentColor" class="bi bi-fast-forward-fill" viewBox="0 0 16 16">
							  <path d="M7.596 7.304a.802.802 0 0 1 0 1.392l-6.363 3.692C.713 12.69 0 12.345 0 11.692V4.308c0-.653.713-.998 1.233-.696l6.363 3.692Z"/>
							  <path d="M15.596 7.304a.802.802 0 0 1 0 1.392l-6.363 3.692C8.713 12.69 8 12.345 8 11.692V4.308c0-.653.713-.998 1.233-.696l6.363 3.692Z"/>
							</svg>
	                    </div>
	                    <!-- 1차 승인자 정보 -->
		            	 <div class="col-xl-3 col-md-4 mb-4">
	                        <div class="card border-left-info shadow h-100 py-2">
	                            <div class="card-body">
	                                <div class="row no-gutters align-items-center">
	                                    <div class="col mr-2">
	                                        <div class="text-xs font-weight-bold text-info text-uppercase mb-1">
	                                        
	                                        	<h4 style="border: 2">첫번째 승인자 정보</h4>
	                                        	<h6>아이디 : ${userVO.id}</h6>
	                                        	<h6>이름 : ${userVO.name}</h6>
	                                        	<h6 id="dpName" data-hh="${userVO.departmentVO.depName}">부서명 : ${userVO.departmentVO.depName}</h6>
	                                        	<h6>직급 : ${userVO.roleVO.roleName}</h6>
	       
	                                       		
	                                        </div>
	                                        <div class="row no-gutters align-items-center">
	                                   
	                                        </div>
	                                    </div>
	                                    <div class="col-auto">
	                                        <i class="fas fa-clipboard-list fa-2x text-gray-300"></i>
	                                    </div>
	                                </div>
	                            </div>
	                        </div>
	                    </div>
	                    
	                    <div style="padding-top: 90px">
	                    	<svg xmlns="http://www.w3.org/2000/svg" width="50" height="32" fill="currentColor" class="bi bi-fast-forward-fill" viewBox="0 0 16 16">
							  <path d="M7.596 7.304a.802.802 0 0 1 0 1.392l-6.363 3.692C.713 12.69 0 12.345 0 11.692V4.308c0-.653.713-.998 1.233-.696l6.363 3.692Z"/>
							  <path d="M15.596 7.304a.802.802 0 0 1 0 1.392l-6.363 3.692C8.713 12.69 8 12.345 8 11.692V4.308c0-.653.713-.998 1.233-.696l6.363 3.692Z"/>
							</svg>
	                    </div>
	                    
	                    <!-- 2차 승인자 정보 -->
		            	 <div class="col-xl-3 col-md-4 mb-4">
	                        <div class="card border-left-info shadow h-100 py-2">
	                            <div class="card-body">
	                                <div class="row no-gutters align-items-center">
	                                    <div class="col mr-2">
	                                        <div class="text-xs font-weight-bold text-info text-uppercase mb-1">
	                                        
	                                        	<h4 style="border: 2">최종 승인자 정보</h4>
	                                        	<h6>아이디 : ${userVO2.id}</h6>
	                                        	<h6>이름 : ${userVO2.name}</h6>
	                                        	<h6 id="dpName" data-hh="${userVO2.departmentVO.depName}">부서명 : ${userVO2.departmentVO.depName}</h6>
	                                        	<h6>직급 : ${userVO2.roleVO.roleName}</h6>
	       
	                                        </div>
	                                        <div class="row no-gutters align-items-center">
	                                   
	                                        </div>
	                                    </div>
	                                    <div class="col-auto">
	                                        <i class="fas fa-clipboard-list fa-2x text-gray-300"></i>
	                                    </div>
	                                </div>
	                            </div>
	                        </div>
	                    </div>
	            	</div>
	            	
	            <%-- <table border="1" class="table table-striped table-hover col-lg-16">
	            
	            	
						<thead class="table table-dark">
							<tr>
								<th>아이디</th>
								<th>이름</th>
								<th>부서명</th>
								<th>직급</th>
							</tr>
						</thead>
		
							<tbody>
								<c:forEach items="${ar}" var="list">
								
									<tr>
										<td>${list.userVO.id}</td>
										<td>${list.userVO.name}</td>
				 						<td>${list.depNum}</td>
										<td>${list.roleVO.roleName}</td>
									</tr>
								</c:forEach>
							</tbody>
						</table> --%>
								
					
		
	            </div>
	            <!-- End Page Content -->
					
			</div>
			<!-- End of Main Content -->
			
			<!-- Footer import -->
			<c:import url="../temp/layout_footer.jsp"></c:import>
			<!-- End of Footer -->
		</div>
		<!-- End of Content Wrapper -->
	</div>

	<!-- Scroll Top, Logout Modal import -->
	<c:import url="../temp/layout_top_logoutModal.jsp"></c:import>
</body>
</html>