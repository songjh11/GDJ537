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
					<section class="container col-lg-6 justify-content-center">
						<c:forEach items="${stTime }" var="st">
							<input type="hidden" value="${st.startTime }" class="startList">
						</c:forEach>
						<form action="./roomReserve" method="POST" id="frm">
							<h1 class="h3 mb-4 text-gray-800" style="text-align: center;">회의실 예약</h1>
							<table class="table table-hover justify-content-right mb-5" style="text-align: center;">
								<tr>
									<th>회의실</th>
									<td>${goodDetail.name }</td>
									<th>정원</th>
									<td>${goodDetail.max }명</td>
								</tr>
							</table>

							<input type="hidden" name="goodsId" value="${goodDetail.goodsId }">

							<div class="mb-3">
								<label>예약날짜</label>
								<input type="datetime-local" name="startTime" class="form-control" id="start"
									placeholder="시작시간">
								<br>
							</div>

							<div class="mb-3">
								<label>반납날짜</label>
								<input type="datetime-local" name="endTime" class="form-control" id="end"
									placeholder="시작시간" disabled='disabled'>
								<br>
							</div>

							<div class="mb-5">
								<label>예약자</label>
								<input type="text" name="id" class="form-control" id="member">
							</div>

							<div class="mb-5">
								<label>부서명</label>
								<input type="text" class="form-control" id="exampleFormControlInput1" value="인사과">
							</div>

							<div class="mb-5">
								<label>사용 목적</label>
								<input type="text" name="usePurpose" class="form-control" id="exampleFormControlInput1">
							</div>

							<div style="text-align: center;">
								<button id="resBtn" type="submit" class="btn btn-success">예약하기</button>
							</div>
							<br>
						</form>

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
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.slim.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="/js/room/reserve.js"></script>
</html>