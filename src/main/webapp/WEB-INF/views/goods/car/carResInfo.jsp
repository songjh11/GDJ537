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

<!-- 차량 예약 JS -->
<script defer src="/js/room/reserveInfo.js"></script>
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
				<input type="hidden" value="${carInfo[0].goodsVOs[0].name}">
				<div class="container-fluid">
					<section class="container d-flex flex-wrap justify-content-center" style="text-align: center;">
						<h1 class="h3 mb-4 text-gray-800">${carInfo[0].goodsVOs[0].name}의 예약현황</h1>
						<table class="table table-hover" id="info">
							<tr>
								<th>차량 예약번호</th>
								<th>차량 번호</th>
								<th>사원번호</th>
								<th>예약 신청일</th>
								<th>사용 기간</th>
								<th>사용 목적</th>
							</tr>
							<c:forEach items="${carInfo}" var="ro">
								<input type="hidden" value="${ro.startTime}" class="startTime">
                        		<input type="hidden" value="${ro.endTime}" class="endTime">	
								<tr>
									<td>${ro.reserveNum }</td>
									<td>${goods.carNum}</td>
									<td>${ro.id }</td>
									<td>${ro.date }</td>
									<td>${ro.startTime} <br>~<br> ${ro.endTime}</td>
									<td>${ro.usePurpose }</td>
								</tr>
							</c:forEach>
						</table>
						<a href="../car/carList" class="btn" style="background-color: #4e73df; color: white;">뒤로가기</a>
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
</html>