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
					<h3 style="text-align: center;">---- 모든 정보를 필수로 입력해야 합니다. ----</h3>
					<br>
					<br>
					<section class="container col-lg-6 justify-content-center">
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
							<c:forEach items="${timeNotEqual }" var="t">
								<div class="timeCheck">
									<input type="hidden" value="${t.startTime }" class="startTimeCheck">
									<input type="hidden" value="${t.endTime }" class="endTimeCheck">
								</div>
							</c:forEach>

							<div class="mb-3">
								<div style="text-align: center;">
									<font> *분 단위는 모두 0으로 입력됩니다.* </font>
								</div>
								<br>
								<label>사용 시작 시간</label>
								<input type="datetime-local" name="startTime" class="form-control" id="start" placeholder="시작시간">
								<p id="startText" style="color: red; display: none;">필수 작성 조건입니다.</p>
								<br>
							</div>

							<div class="mb-3">
								<label>사용 종료 시간</label>
								<input type="datetime-local" name="endTime" class="form-control" id="end" placeholder="시작시간"
									disabled='disabled'>
								<p id="endText" style="color: red; display: none;">필수 작성 조건입니다..</p>
								<br>
							</div>

							<div class="mb-5">
								<label>예약자</label>
								<input type="hidden" name="id" class="form-control" id="member" value="${userInfo.id }" readonly>
								<input type="text" class="form-control" value="${userInfo.name }" disabled>
							</div>


							<div class="mb-5">
								<label>부서명</label>
								<c:choose>
									<c:when test="${userInfo.departmentVO.depNum == 1}">
										<input type="text" class="form-control" id="exampleFormControlInput1" readonly="readonly"
											value="영업팀">
									</c:when>
									<c:when test="${userInfo.departmentVO.depNum == 2}">
										<input type="text" class="form-control" id="exampleFormControlInput1" readonly="readonly"
											value="총무팀">
									</c:when>
									<c:when test="${userInfo.departmentVO.depNum == 3}">
										<input type="text" class="form-control" id="exampleFormControlInput1" readonly="readonly"
											value="인사팀">
									</c:when>
									<c:when test="${userInfo.departmentVO.depNum == 4}">
										<input type="text" class="form-control" id="exampleFormControlInput1" readonly="readonly"
											value="IT개발팀">
									</c:when>
									<c:when test="${userInfo.departmentVO.depNum == 5}">
										<input type="text" class="form-control" id="exampleFormControlInput1" readonly="readonly"
											value="생산팀">
									</c:when>
								</c:choose>
							</div>

							<div class="mb-5">
								<label>사용 목적</label>
								<input type="text" name="usePurpose" class="form-control" id="purpose">
								<p id="purposeText" style="color: red; display: none;">필수 작성 조건입니다.</p>
								<br>
							</div>

							<div style="text-align: center;" class="mb-5">
								<button id="resBtn" type="button" class="btn btn-outline-none"
									style="background-color: #4e73df; color: white;">예약하기</button>
								<a href="./roomList">
									<button type="button" class="btn btn-outline-none" style="background-color: #4e73df; color: white;">뒤로가기</button>
								</a>
							</div>
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
