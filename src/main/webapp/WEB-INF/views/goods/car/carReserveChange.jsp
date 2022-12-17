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
						
						<form action="carReserveChange" method="POST">
							<h1 class="h3 mb-4 text-gray-800" style="text-align: center;">차량 예약 변경</h1>
								<table class="table table-hover justify-content-right mb-5" style="text-align: center;">
									<tr>
 										<th>차량번호</th>

										<td>${goods.carNum}</td>

										<th>모델명</th>
										<td>${goods.name}</td>									
										<th>정원</th>
										<td>${goods.max}명</td>											
									</tr>
								</table>
								
 								<input type="hidden" name="id" value="${test.id}">
								
								<div class="mb-3">
									<label>예약날짜</label>
									<input type="datetime-local" name="startTime" class="form-control" id="exampleFormControlInput1" value="${reserve.startTime}">
									<br>
								</div>
								
								<div class="mb-3">
									<label>반납날짜</label>
									<input type="datetime-local" name="endTime" class="form-control" id="exampleFormControlInput1" value="${reserve.endTime}">
									<br>
								</div> 
								
								<div class="mb-5">
									<label>예약자</label>

									<input type="text" name="memberNum" class="form-control" id="exampleFormControlInput1" value="${reserve.id}">

								</div>
								
								<div class="mb-5">
									<label>부서명</label>
									<input type="text" class="form-control" id="exampleFormControlInput1" value="애플">
								</div>	
																																	
								<div class="mb-5">
								  <label>변경 사유</label>
								  <input type="text" name="usePurpose" class="form-control" id="exampleFormControlInput1" placeholder="${reserve.usePurpose }">
								</div>
								
								<button type="submit" class="btn btn-success">예약하기</button>
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
</html>