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

	.blank{
		height: 34px;
	}

	.miniBar{
		width: 50px;
		height: 100%;
		background:#4e73df24;
	}

	.miniBar img{
		width: 35px;
		margin-top: 20px;
	}

	.miniBar button{
		background: transparent;
		border: none;
	}

	.searchOption{
		font-size: 0.9rem !important;
		font-weight: 400;
		line-height: 1.5;
		color: #858796;
		background-color: #f8f9fc!important;
		border: none !important;
		width: 40px !important;
	}

	li{
		list-style: none;
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

	.titleLi{
		font-size: 18px; 
		font-weight: bold; 
		margin-right: 10px; 
		color: #696969; 
		display: flex;	
		justify-content: space-between; 
		border-bottom: 1px solid rgba(0,0,0,.1);
		padding: 5px 0;
		width: 100%;
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

	.pickImg{
		width: 30px;
		margin-top: -10px;
		margin-right: 5px;
	}

	img{
		vertical-align: middle;
	}

	button{
		border: none;
		background: transparent;
	}

	.acoArea{
		display: none;
		padding-inline-start: 0px !important;
	}

	.acoArea::before {
		display: inline-block;
	}

	.profile{
		display: flex;
		flex-direction: column;
		align-items: center;
		width: 100%;
	}	

	.profile p{
		font-size: 18px;
	}

	.h2title{
		font-weight: bold; 
		background: linear-gradient(#4e73df 10%,#224abe 100%);
		color: transparent; 
		-webkit-background-clip: text;
	}

	.proArea{
		width: 80%;
		padding: 20px;
		background-color: #FFFFFF;
		border-radius: 20px;
		box-shadow: 0 .15rem 1.75rem 0 rgba(58,59,69,.15)!important;
		text-align: center;
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
						<a href="../messenger/chat"><button type="button" id="chatBtn"><img src="/img/conversation.png"></button></a>
						<a href="../messenger/msg"><button type="button" id="msgBtn"><img src="/img/email.png"></button></a>
					</div>
					<div class="chatDiv">
						<div class="blank"></div>
						<div>
							<!-- Topbar Search -->
						<form class="form-inline navbar-search" style="display: flex; justify-content: flex-end; margin-right: 10px; margin-bottom: 30px;">
							<div class="input-group" style="width: 100%;"> 
								<select class="searchOption form-control" value="">
									<option vlaue="" selected>정렬</option>
									<option value="">이름 순</option>
									<option value="">부서 순</option>
									<option value="">직급 순</option>
								</select>
								<input type="text" class="form-control bg-light border-0 small" style="width: 180px !important;" placeholder="Search for..."
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
							<li class="titleLi">
								<span style="margin-left: 20px;">즐겨찾기</span>
								<button type="button" class="showBtn" style="margin-right: 8px;">🔼</button>
							</li>
							<ul class="acoArea" id="acoArea1">
								<li class="chatLi">
									<div class="userArea" style="display: flex;	justify-content: space-between; align-items: center;">
										<div>
											<img class="yourImg" src="/img/undraw_profile_3.svg">
										</div>
										<div class="userInfo" style="width: 450px;">
											<span>김사원</span>
											<span>(마케팅부/사원)</span>
										</div>
										<div class="btnArea">
											<button type="button" class="pickBtn" userNum="2"><img class="pickImg" src="/img/star (3).png"></button>
										</div>
									</div>
								</li>
								<li class="chatLi">
									<div class="userArea" style="display: flex;	justify-content: space-between; align-items: center;">
										<div>
											<img class="yourImg" src="/img/undraw_profile_3.svg">
										</div>
										<div class="userInfo" style="width: 450px;">
											<span>김사원</span>
											<span>(마케팅부/사원)</span>
										</div>
											<div class="btnArea">
												<button type="button" class="pickBtn" userNum="2"><img class="pickImg" src="/img/star (3).png"></button>
											</div>
									</div>
								</li>
							</ul>
							<li class="titleLi">
								<span style="margin-left: 20px;">개발팀</span>
								<button type="button" class="showBtn" style="margin-right: 8px;">🔼</button>
							</li>
							<ul class="acoArea">
								<li class="chatLi">
									<div class="userArea" style="display: flex;	justify-content: space-between; align-items: center;">
										<div>
											<img class="yourImg" src="/img/undraw_profile_3.svg">
										</div>
										<div class="userInfo" style="width: 450px;">
											<span>김사원</span>
											<span>(마케팅부/사원)</span>
										</div>
											<div class="btnArea">
												<button type="button" class="pickBtn" userNum="2"><img class="pickImg" src="/img/star (3).png"></button>
											</div>
									</div>
								</li>
							</ul>
							<li class="titleLi">
								<span style="margin-left: 20px;">인사팀</span>
								<button type="button" class="showBtn" style="margin-right: 8px;">🔼</button>
							</li>
							<ul class="acoArea">
								<li class="chatLi">
									<div class="userArea" style="display: flex;	justify-content: space-between; align-items: center;">
										<div>
											<img class="yourImg" src="/img/undraw_profile_3.svg">
										</div>
										<div class="userInfo" style="width: 450px;">
											<span>김사원</span>
											<span>(마케팅부/사원)</span>
										</div>
											<div class="btnArea">
												<button type="button" class="pickBtn" userNum="2"><img class="pickImg" src="/img/star (3).png"></button>
											</div>
									</div>
								</li>
							</ul>
						</ul>
					</div>
					<div class="chatDiv">
						<div class="blank"></div>
						<h1>메세지함 자리</h1>
					</div>
					<div class="chatDiv">
						<div class="blank"></div>
						<div class="profile">
							<img src="/img/profiletest.png" width="200" height="200" style="border-radius: 50%;">
							<h2 class="h2title">Goodee Company</h2>
							<div class="proArea">
								<p>이름</p>
								<p>부서</p>
								<p>직급</p>
								<p>이메일</p>
								<p>전화번호</p>
								<p><a class="btn" style="background: #4e73df; color: #FFFFFF;" href="#">개인 정보 수정 »</a></p>
							</div>
						  </div>
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