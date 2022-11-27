<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- meta tag 추가 -->
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<style>
	.container-fluid{
		padding: 0 0 !important;
		margin: 0 0 !important;
	}

	.miniBar{
		width: 30px;
		height: 100%;
		background: #4e73df24;
	}

	.chatDiv{
		width:600px;
		height: 100%;
		border-right: 1px #4e73df24 solid;
	}

	.yourImg{
		border-radius: 50%;
		width: 50px;
	}

	.chatUl{
		padding: 0 0 !important;
	}

	.chatLi{
		display: flex;
		list-style: none;
		border-bottom: 1px #4e73df24 solid;
		margin-bottom: 10px;
		padding-bottom: 10px;
		padding-left: 10px;
		align-items: flex-end;
	}
</style>
<title>Insert title here</title>
<!-- 공통 css, js -->
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
			
				<!-- Topbar import-->
				<c:import url="../temp/layout_topbar.jsp"></c:import>
				<!-- End of Topbar -->
				
				<!-- Begin Page Content -->
	            <div class="container-fluid" style="display: flex; height: 100%;">
	
	            	<!-- Page Heading -->
					<div class="miniBar">
						<h1 class="h3 mb-4 text-gray-800">미니 사이드바</h1>
					</div>
					<div class="chatDiv">
						<h1 class="h3 mb-4 text-gray-800">사원목록</h1>
						<ul class="chatUl">
							<li class="chatLi">
								<div>
									<img class="yourImg" src="/img/undraw_profile_3.svg">
								</div>
								<div>
									<div>
										<span>김사원</span>
										<span>(마케팅부/사원)</span>
									</div>
									<div>
										<span>오늘도 화이팅!</span>
										<span style="margin-left: 50px;">즐찾</span>
									</div>
								</div>
							</li>
							<li class="chatLi"><img class="yourImg" src="/img/undraw_profile_3.svg"></li>
						</ul>
					</div>
					<div class="chatDiv">
						<h1 class="h3 mb-4 text-gray-800">채팅방목록</h1>
					</div>
					<div class="chatDiv">
						<h1 class="h3 mb-4 text-gray-800">프로필</h1>
					</div>
	
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

	<!-- Scroll Top, Login Modal import -->
	<c:import url="../temp/layout_top_logoutModal.jsp"></c:import>
</body>
</html>