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
					<h1 class="h3 mb-4 text-gray-800">모든 승인자 리스트</h1>
					
					
						<sec:authentication property="Principal" var="member"/>
						<%-- <h3>아이디 : ${member.id}</h3>		
						<h3>이름 : ${member.name}</h3>	
						<h3>부서명 : ${member.depNum}</h3>
						<h3>나의 직급 : ${member.roleVO.roleName}</h3>	 --%>
						
						아이디:<input type="text" readonly name="id" value="${member.id}"><br>
						이름 :<input type="text" readonly name="name" value="${member.name}"><br>
						부서명:<input type="text" readonly name="depNum" value="${member.depNum}"><br>
						직급 :<input type="text" readonly name="roleName" value="${member.roleVO.roleName}"><br>
					
					뎁네임 <input type="text" value="${member.departmentVO.depName}">
					뎁네임 <input type="text" value="${reportVO.depName}">
					뎁네임 <input type="text" value="${reportVO.departmentVO.depName}">
					뎁네임 <input type="text" value="${reportVO2.depName}">
					뎁네임 <input type="text" value="${reportVO2.departmentVO.depName}">
					
	            	
	            	
	            	<input type="text" name="id" id="lsId">
	            	<input type="text" name="name" id="lsName">
	            	<input type="text" name="depName" id="lsDepName">
	            	<input type="text" name="roleName" id="lsRoleName">
	            	
	            	
	            	
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