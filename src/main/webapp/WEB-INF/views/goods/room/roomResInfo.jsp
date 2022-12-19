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
						<h1 class="h3 mb-4 text-gray-800">${roomInfo[0].goodsVOs[0].name}예약정보</h1>
						<input type="hidden" value="${loginCheck }" id="userID">
						<table class="table table-hover">
							<tr>
								<!-- <th>회의실 예약 번호</th> -->
								<th>사원 번호</th>
								<th>예약 신청일</th>
								<th>사용 기간</th>
								<th>사용 목적</th>
								<th>예약 정보 변경</th>
								<th>예약 취소</th>
							</tr>
							<c:forEach items="${roomInfo }" var="ro">
								<tr>
									<%-- <td>${ro.reserveNum }</td> --%>
									<td>${ro.id }</td>
									<td>${ro.date }</td>
									<td>${ro.startTime }
										<br>
										~
										<br>
										${ro.endTime }
									</td>
									<td>${ro.usePurpose }</td>
									<c:if test="${ro.date != '2018-01-01 09:00:00' }">
										<td>
											<a href="/goods/room/roomReserveUpdate?reserveNum=${ro.reserveNum}&goodsId=${ro.goodsId}"
												class="btn btn-outline-none">변경</a>
										</td>
										<td>
											<button name='delete' class="btn btn-outline-none delete_btn" value="${ro.reserveNum}">취소</button>
										</td>
									</c:if>
								</tr>
							</c:forEach>
						</table>
						<div>
							<a href="./roomList">
								<button type="button" class="btn btn-outline-none res"
									style="background-color: #4e73df; color: white;">뒤로가기</button>
							</a>
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
<script src="/js/room/reserveIDcheck.js"></script>
<script>
	// 예약 취소 버튼을 눌렀을 때
	$('.delete_btn').click(function() {
		console.log($(this).val()); // 클릭 한 요소의 value값(reserveNum)을 출력한다.

		let reserve = $(this).val(); // value값(reserveNum)을 reserve에 저장한다.
		let result = confirm("예약을 취소하시겠습니까? \n취소 후에는 되돌릴 수 없습니다.");

		if (result) { // 확인 클릭 시
			$.get("roomReserveDelete?reserveNum=" + reserve, function(result) { // controller로 get방식의 보낸다
				console.log(reserve);
				location.reload();
			});
		}
	});
</script>
</html>