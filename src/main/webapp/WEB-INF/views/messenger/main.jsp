<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- meta tag 추가 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<style>
	.container-fluid{
		padding: 0 0 !important;
		margin: 0 0 !important;
	}

	.mb-4{
		margin-bottom: 0px !important;
	}

	.miniBar{
		width: 70px;
		height: 100%;
		background:#4e73df24;
	}

	.miniBar img{
		width: 35px;
		filter: invert(100%);
		margin-top: 20px;
	}

	.miniBar button{
		background: transparent;
		border: none;
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
		margin-top: 5px;
		margin-bottom: 10px;
		padding-bottom: 10px;
		padding-left: 10px;
		align-items: flex-end;
	}

	.userInfo{
		color: #696969;
		font-size: 18px;
	}

	.statMsg{
		width: 100%;
		display: flex;
		justify-content: space-between;
	}

	.userArea{
		width: 100%;
	}

	.pickBtn{
		background: transparent;
		border: none;
	}

	/* .on{
		background: src="/img/star (3).png";
	} */

	.pickImg{
		width: 30px;
		margin-top: -10px;
		margin-right: 15px;
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
						<button type="button"><img src="/img/conversation.png"></button>
						<button type="button"><img src="/img/email.png"></button>
					</div>
					<div class="chatDiv">
						<h1 class="h3 mb-4 text-gray-800">사원목록</h1>
						<div>
							<!-- Topbar Search -->
							<form
							class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">
							<div class="input-group">
								<input type="text" class="form-control bg-light border-0 small" placeholder="Search for..."
									aria-label="Search" aria-describedby="basic-addon2">
								<div class="input-group-append">
									<button class="btn btn-primary" type="button">
										<i class="fas fa-search fa-sm"></i>
									</button>
								</div>
							</div>
						</form>
						</div>
						<ul class="chatUl">
							<li class="chatLi">
								<div>
									<img class="yourImg" src="/img/undraw_profile_3.svg">
								</div>
								<div class="userArea">
									<div class="userInfo">
										<span>김사원</span>
										<span>(마케팅부/사원)</span>
									</div>
									<div class="statMsg">
										<div style="margin-top: 3px; margin-left: 3px;">
											<span>오늘도 화이팅!</span>
										</div>
										<div class="btnArea">
											<button type="button" class="pickBtn" userNum="1"><img class="pickImg" src="/img/star (3).png"></button>
										</div>
									</div>
								</div>
							</li>
							<li class="chatLi">
								<div>
									<img class="yourImg" src="/img/undraw_profile_3.svg">
								</div>
								<div class="userArea">
									<div class="userInfo">
										<span>김사원</span>
										<span>(마케팅부/사원)</span>
									</div>
									<div class="statMsg">
										<div style="margin-top: 3px; margin-left: 3px;">
											<span>오늘도 화이팅!</span>
										</div>
										<div class="btnArea">
											<button type="button" class="pickBtn" userNum="2"><img class="pickImg" src="/img/star (3).png"></button>
										</div>
									</div>
								</div>
							</li>
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
	<script src="/js/messenger/main.js"></script>
</body>
</html>