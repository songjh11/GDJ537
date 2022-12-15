<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- meta tag 추가 -->
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Join</title>

<!-- 공통 css, js, jquery -->
<c:import url="../temp/layout_header.jsp"></c:import>
<c:import url="../temp/user/boot.jsp"></c:import>
<style type="text/css">
#idBtn:focus {
	border: solid #C8DEFF 4px;
}
</style>
</head>
<!-- body ID 작성 -->
<body id="page-top">

	<!-- Page Wrapper 전체 Contents Wrapper -->
	<div id="wrapper">

		<!-- Sidebar import -->
		<c:import url="../temp/layout_sidebar.jsp"></c:import>
		<!-- End of Sidebar -->

		<!-- Content Wrapper -->
		<div id="content-wrapper" class="d-flex flex-column">
			<!-- Main Content -->
			<div id="content">

				<!-- Topbar import-->
				<c:import url="../temp/layout_topbar.jsp"></c:import>
				<!-- End of Topbar -->

				<!-- Begin Page Content -->
				<div class="container-fluid">
					<div class="container-fluid">
						<div class="row justify-content-center" >
							<div class="py-4 px-5" style="width: 500px;">

								<h1 class="text-center pb-3">
									<b>Sign up</b>
								</h1>

								<!-- Modal -->
								<div class="modal fade" id="idCheckModal" tabindex="-1"
									aria-labelledby="exampleModalLabel" aria-hidden="true">
									<div class="modal-dialog">
										<div class="modal-content">
											<div class="modal-header" style="background-color: #e8f0fe">
												<h1 class="modal-title fs-5" id="exampleModalLabel">사원번호
													조회</h1>
											</div>
											<div class="modal-body">
												<div class="d-flex my-3">
													<label style="margin: auto 0"><b>사원번호</b></label> <input
														type="text" id="idCheck" class="form-control w-25 mx-2">

													<label style="margin: auto 0"><b>이름</b></label> <input
														type="text" id="nameCheck" class="form-control w-25 mx-2">

													<button id="search" class="btn btn-primary ms-2">
														<i class="fa-solid fa-magnifying-glass"></i>
													</button>
												</div>
												<table class="table table-striped text-center"
													style="display: none">
													<tr>
														<th>사원번호</th>
														<th>이름</th>
														<th>부서</th>
														<th>직급</th>
														<th>입사일</th>
													</tr>
													<tr>
														<td id="id"></td>
														<td id="name"></td>
														<td id="dep"></td>
														<td id="role"></td>
														<td id="date"></td>
													</tr>
												</table>
												<div id="noDate" class="text-center" style="display: none"></div>
											</div>
											<div class="modal-footer">
												<button type="button" class="btn btn-secondary"
													data-bs-dismiss="modal">Close</button>
												<button type="button" class="btn btn-primary" id="add"
													disabled="disabled">적용</button>
											</div>
										</div>
									</div>
								</div>


								<form:form action="join" modelAttribute="userVO" method="post"
									enctype="multipart/form-data">

									<div class="d-flex my-3">
										<div style="margin: auto 0; width: 45%">
											<b>사원번호</b>
											<!-- Button trigger modal -->
											<button type="button" id="idBtn" class="btn btn-primary ms-1"
												data-bs-toggle="modal" data-bs-target="#idCheckModal">
												<i class="fa-solid fa-magnifying-glass"
													style="outline-color: red"></i>
											</button>
										</div>
										<input type="text" class="form-control" name="id" id="addId"
											readonly="readonly" style="width: 65%; height: 35px;">
									</div>
									<div id="idError" style="font: 13px; color: red"></div>

									<div class="d-flex my-3">
										<b style="margin: auto 0; width: 45%">이름</b> <input
											type="text" class="form-control" name="name" id="addName"
											readonly="readonly" style="width: 65%; height: 35px">
									</div>

									<div class="d-flex my-3">
										<b style="margin: auto 0; width: 45%">부서</b> <input
											type="text" class="form-control" id="addDep"
											readonly="readonly" style="width: 65%; height: 35px">
									</div>

									<hr class="my-4">

									<div class="d-flex">
										<div class="me-4" style="margin: auto 0; width: 60%">
											<div>
												<b><span style="color: red">*</span>비밀번호</b>
												<form:password path="pw" cssClass="form-control" id="pw" />
												<div style="font-size: 13px">
													<form:errors path="pw"></form:errors>
												</div>
											</div>

											<div class="mt-4">
												<b><span style="color: red">*</span>비밀번호 확인</b>
												<form:password path="pw2" cssClass="form-control" id="pw2" />
												<div style="font-size: 13px">
													<form:errors path="pw2"></form:errors>
												</div>
											</div>
										</div>

										<div style="margin: auto 0">
											<input type="file" id="file" accept="image/*"
												onchange="setThumbnail(event);" style="display: none">
											<label id="fileAdd" for="file"
												class="border border-black rounded-3"
												style="color: #8b95a1; width: 140px; height: 160px; text-align: center">
												<span id="default"> <i
													class="fa-solid fa-circle-user"
													style="font-size: 50px; margin: 35px 0;"><p
															class="pt-2 mb-0" style="font-size: 14px">이미지등록</p></i>
											</span> <span id="profile"></span>
											</label>
										</div>
									</div>

									<div class="my-4">
										<b><span style="color: red">*</span>이메일</b>
										<div class="d-flex">
											<form:input path="e" cssClass="form-control" id="email"
												cssStyle="height:38px" />
											<span class="px-1" style="margin: auto 0;">@</span>
											<form:select path="address" class="form-select" id="address">
												<option selected hidden>선택</option>
												<option value="naver.com">naver.com</option>
												<option value="gmail.com">gmail.com</option>
												<option value="hanmail.net">hanmail.net</option>
												<option value="nate.com">nate.com</option>
											</form:select>
										</div>
										<div style="font-size: 13px">
											<form:errors path="e"></form:errors>
											<form:errors path="address"></form:errors>
										</div>
									</div>

									<div class="my-4">
										<b><span style="color: red">*</span>휴대전화</b>
										<form:input path="phone" cssClass="form-control" id="phone"
											placeholder="숫자만 입력" />
										<div style="font-size: 13px">
											<form:errors path="phone"></form:errors>
										</div>
									</div>

									<div class="text-center py-3">
										<button id="submit" class="btn btn-primary w-50">회원가입</button>
									</div>
								</form:form>
							</div>
						</div>
					</div>

				</div>
				<!-- End Page Content -->

			</div>
			<!-- End of Main Content -->

			<!-- Footer import -->
			<c:import url="../temp/layout_footer.jsp"></c:import>
			<!-- End of Footer -->
		</div>
		<!-- End of Content Wrapper -->
	</div>

	<!-- Scroll Top, Logout Modal import -->
	<c:import url="../temp/layout_top_logoutModal.jsp"></c:import>
	<script src="/js/user/join.js"></script>
</body>
</html>