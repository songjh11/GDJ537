<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- meta tag 추가 -->
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Insert title here</title>
<!-- 공통 css, js, jquery -->
<c:import url="../../temp/layout_header.jsp"></c:import>
</head>
<style>
.de {
	width: 350px;
	height: 350px;
	padding-left: 20px;
	padding-right: 25px;
}

ul {
	display: flex;
}

ul li {
	list-style: none;
}
</style>
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
				<input type="hidden" value="${roomInfo[0].goodsVOs[0].name}">
				<div class="container-fluid">
					<section class="container d-flex flex-wrap justify-content-center" style="text-align: center;">
						<h1 class="h3 mb-4 text-gray-800">${roomInfo[0].goodsVOs[0].name}회의실예약정보</h1>
						<table class="table table-hover" id="info">
							<tr>
								<th>예약자 ID</th>
								<th>날짜</th>
								<th>사용 목적</th>
								<th>시작 시간</th>
								<th>종료 시간</th>
							</tr>
							<c:forEach items="${roomInfo }" var="ro">
								<!-- <input type="hidden" value="${ro.startTime}" class="startTime"> -->
								<tr>
									<td>${ro.id }</td>
									<td>${ro.date }</td>
									<td>${ro.usePurpose }</td>
									<td class="startTime">${ro.startTime }</td>
									<td>${ro.endTime }</td>
								</tr>
							</c:forEach>
						</table>
						<a href="./roomList">
							<button type="button" class="btn btn-outline-none">뒤로가기</button>
						</a>
					</section>

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
</body>
<script src="/js/room/reserveInfo.js"></script>
</html>