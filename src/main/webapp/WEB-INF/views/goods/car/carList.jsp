<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- meta tag 추가 -->
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Insert title here</title>

<!-- JQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

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
						<input type="hidden" value="${loginCheck }" id="userID">
						
						<h1 class="h3 mb-4 text-gray-800">차량 정보</h1>
						<table class="table table-hover justify-content-right" style="text-align: center;">
							<tr>
								<th>차량번호</th>
								<th>모델명</th>
								<th>상세정보</th>
								<th>예약</th>
								<th>예약현황</th>
							</tr>
							
							<c:forEach items="${goods}" var="goods">
							<c:set var="TextValue" value="${goods.goodsId}" />
							<c:if test="${fn:substring(TextValue,0,2) == 'CA' }">
								<tr>

									<td>${goods.carNum}</td>
									<td>${goods.name}</td>
									<td><a href="./carDetail?goodsId=${goods.goodsId}"><button type="button" class="btn btn-outline-none">정보 보기</button></a></td>
									<td><a href="./carReserve?goodsId=${goods.goodsId}"><button type="button" class="btn btn-outline-none res">예약하기</button></a></td>
									<td><a href="./carResInfo?goodsId=${goods.goodsId}"><button type="button" class="btn btn-outline-none">현황보기</button></a></td>

								</tr>
								</c:if>
							</c:forEach>
						</table>
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

	<script>
		$('.delete_btn').click(function() {
			console.log($(this).val()); // 클릭 한 요소의 value값(reservenum)을 출력한다.
			
			let reserve = $(this).val(); // value값(reservenum)을 reserve에 저장한다.
			let result = confirm("예약을 취소하시겠습니까? \n취소 후에는 되돌릴 수 없습니다.");

			if (result) { // 확인 클릭 시
				$.get("carReserveDelete?reservenum=" + reserve, function(result) { // controller로 get방식의 보낸다
					console.log(reserve);
					location.reload();
				});
			}
		});
	</script>
	<!-- 로그인체크 JS -->
<script src="/js/room/reserveIDcheck.js"></script>
</body>
</html>