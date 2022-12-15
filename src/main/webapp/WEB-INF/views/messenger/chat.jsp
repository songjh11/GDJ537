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
	@import url('https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap');
</style>
<link rel="stylesheet" href="/css/chat/groupModal.css">
<link rel="stylesheet" href="/css/chat/employeeList.css">
<style>
	.iconMsg {
		font-size: 13px;
		color: #4c6ac4;
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
						<a href="../messenger/chat"><button type="button" id="chatBtn"><img src="/img/messenger/m_chat.png"><p class="iconMsg">채팅</p></button></a>
						<a href="../messenger/note"><button type="button" id="msgBtn"><img src="/img/messenger/m_noteX.png"><p class="iconMsg" style="color: white; margin-top: -4px;">쪽지</p></button></a>
					</div>
					<div class="chatDiv" id="chatArea">
						<div class="blank"></div>
							<c:import url="./groupModal.jsp"></c:import>
							<c:import url="./employeeList.jsp"></c:import>
							<div class="btnArea d-flex flex-row-reverse" style="background: #4e73df; color: #FFFFFF; height: 38px; display: flex; text-align: center; justify-content: center;">
								<button type="button" id="userBtn" style="color: #FFFFFF;">그룹채팅/쪽지<img class="roomImg" style="width: 20px; margin-left: 5px; margin-bottom: 7px; filter: invert(1);" src="/img/messenger/chatAdd.png"></button>
							</div>
					</div>
					<div class="chatDiv">
						<div class="blank"></div>
						<c:import url="./addRoom.jsp"></c:import>
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
	<script src="/js/messenger/groupModal.js"></script>
</body>
</html>