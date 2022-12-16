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
/* .de {
	width: 	1000px;
	height: 500px;
	padding-bottom: 50px;
	padding-left: 20px;
	padding-right: 25px;
} */

/* ul {
	display: flex;
} */

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
				<div class="container-fluid">
					<section class="container d-flex flex-wrap justify-content-center">
						<!-- Page Heading -->
						<h1 class="h3 mb-4 text-gray-800">차량 상세정보</h1>
						<table class="table table-hover" style="text-align: center;">
							<tr>
								<th>차량 번호</th>
								<th>모델명</th>
								<th>최대 탑승 수</th>
								<th>인수/반납 위치</th>
							</tr>
							<tr>
								<td>${goods.carNum }</td>
								<td>${goods.name }</td>
								<td>${goods.max }</td>
								<td>${goods.location }</td>
							</tr>
						</table>
						<div>
						<div class="text-center">
							${goods.contents }
							<ul>
								<c:forEach items="${goods.goodsFileVO}" var="goods">
									<li>
										<img class="de" src="/file/goods/${goods.fileName}" alt="" style="width: 500px; height: 500px;">
									</li>
								</c:forEach>
							</ul>
						</div>
						<div class="test mb-5" style="text-align: center;">
							<a href="../car/carList" class="btn" style="background-color: #4e73df; color: white;">뒤로가기</a>
						</div>
						</div>
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