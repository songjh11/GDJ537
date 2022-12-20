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
					<section class="container d-flex flex-wrap justify-content-center">
						<!-- Page Heading -->

						<form action="roomReserveUpdate" method="POST" id="frm">
							<input type="hidden" value="${reserve.reserveNum}" name="reserveNum">
							<h1 class="h3 mb-4 text-gray-800" style="text-align: center;">회의실 예약 변경</h1>
							<table class="table table-hover justify-content-right mb-5" style="text-align: center;">
								<tr>
									<th>회의실 번호</th>
									<td>${good.goodsId}</td>
									<th>회의실 이름</th>
									<td>${good.name}</td>
									<th>정원</th>
									<td>${good.max}명</td>
								</tr>
							</table>

							<input type="hidden" name="goodsId" value="${good.goodsId }">
							<c:forEach items="${timeNotEqual }" var="t">
								<c:if test="${t.startTime != reserve.startTime }">
									<div class="timeCheck">
										<input type="hidden" value="${t.startTime }" class="startTimeCheck">
										<input type="hidden" value="${t.endTime }" class="endTimeCheck">
									</div>
								</c:if>
							</c:forEach>

							<div class="mb-3">
								<div style="text-align: center;">
									<font> *1시간 단위로 입력됩니다.* </font>
								</div>
								<br>
								<label>사용 시작 시간</label>
								<input type="datetime-local" name="startTime" class="form-control" id="start"
									value="${reserve.startTime}">
								<p id="startText" style="color: red; display: none;">필수 작성 조건입니다.</p>
								<br>
							</div>

							<div class="mb-3">
								<label>사용 종료 시간</label>
								<input type="datetime-local" name="endTime" class="form-control" id="end" value="${reserve.endTime}">
								<p id="endText" style="color: red; display: none;">필수 작성 조건입니다.</p>
								<br>
							</div>

							<div class="mb-5">
								<label>사원 이름</label>
								<input type="hidden" name="id" class="form-control" id="member" value="${reserve.id}" readonly>
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
								<label>변경 사유</label>
								<input type="text" name="usePurpose" class="form-control" id="purpose" value="${reserve.usePurpose }">
								<p id="purposeText" style="color: red; display: none;">필수 작성 조건입니다.</p>
								<br>
							</div>

							<div class="mb-5" style="text-align: center;">
								<button id="resBtn" type="button" class="btn btn-outline-none"
									style="background-color: #4e73df; color: white;">예약 변경</button>
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
<script src="/js/room/reserve.js"></script>
</html>