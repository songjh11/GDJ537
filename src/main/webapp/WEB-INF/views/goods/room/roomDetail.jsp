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
				<%-- ${goodDetail.goodsFileVO } --%>
				<!-- Begin Page Content -->
				<div class="container-fluid">
					<section class="container d-flex flex-wrap justify-content-center" style="text-align: center;">
						<h1 class="h3 mb-4 text-gray-800">회의실 상세정보</h1>
						<!-- Page Heading -->
						<ul>
							<li>
								<img class="de" src="/img/undraw_profile_1.svg" alt="">
							</li>
							<li>
								<img class="de" src="/img/undraw_profile_2.svg" alt="">
							</li>
							<li>
								<img class="de" src="/img/undraw_profile_3.svg" alt="">
							</li>
						</ul>
						<table class="table table-hover">
							<tr>
								<th>회의실 번호</th>
								<th>이름</th>
								<th>상세정보</th>
								<th>최대 인원(명)</th>
								<th>위치</th>
							</tr>
							<tr>
								<td>${goodDetail.goodsId }</td>
								<td>${goodDetail.name }</td>
								<td>${goodDetail.contents }</td>
								<td>${goodDetail.max }</td>
								<td>${goodDetail.location }</td>
							</tr>
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
</html>