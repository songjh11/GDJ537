<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- meta tag 추가 -->
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>요청게시판</title>
<!-- 공통 css, js, jquery -->
<c:import url="../../temp/layout_header.jsp"></c:import>
<!-- 파일 다운로드 아이콘 -->
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<style type="text/css">
	.card-header {
		font-size: 16px;
		height: 100px;
		margin-bottom: 10px;
		border: 1px solid #e3e6f0;
	}

	.card {
		background-color: #f8f9fc;
		border: 0;
	}
</style>
</head>

<!-- body ID 작성 -->
<body id="page-top">
<sec:authentication property="Principal" var="member"/>

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
	            <div class="row">
	            <div class="col-lg-10">
	            <div class="container-fluid">
	            	<form class="row g-3 justify-content-between m-3" action="./list" method="get">
					  <div class="d-flex justify-content-center">
					  	<div class="col-auto">
						    <select class="form-control" name="kind" aria-label="Default select example">
						    	<option value="title">제목</option>
						    	<option value="creator">작성자</option>
						    </select>
						  </div>
						  <div class="input-group">
	                         <input type="text" id="searchInput" name="search" class="form-control bg-light border-0 small"
	                             placeholder="Search for..." aria-label="Search"
	                             aria-describedby="basic-addon2" style="background-color:white !important">
	                         <div class="input-group-append">
	                             <button class="btn btn-primary" type="submit">
	                                 <i class="fas fa-search fa-sm"></i>
	                             </button>
	                         </div>
	                      </div>
					  </div>
					  <div class="d-flex justify-content-center">	
					  <div class="col-auto">
						<select class="form-control" id="listOrder" title="${param.order}" name="order">
							<option class="order" value="ID">최신순</option>
							<option class="order" value="hit">조회수순</option>
							<option class="order" value="comment">댓글수순</option>
						</select>
					</div>
	                      <div class="col-auto">
	                      	<button type="button" class="btn btn-info" id="fiveBtn"><span class="badge text-bg-info">5</span></button>
              				<button type="button" class="btn btn-info" id="tenBtn"><span class="badge text-bg-info">10</span></button>
              				<button type="button" class="btn btn-info" id="twentyBtn"><span class="badge text-bg-info">20</span></button>
              			  </div>
							<div class="col-auto">
	                      	<a href="/request/add" class="btn btn-danger">글 작성</a>
	                      </div>
					</div>
					</form>

	            	<!-- 요청게시판 작성 -->
					<!-- ajax용 div 추가-->
					<div id="ajaxResult">
						<div class="card mb-3 requestList">
							<c:forEach items="${requestList}" var="request">
								<div class="card-header bg-white">
									<div class="row justify-content-between">
										<p style="
																		margin-bottom: 0;
																		line-height: 400%;
																		font-size: 20px;
																		font-weight: bold;
																		margin-left: 10px;
																	">[요청] ${member.departmentVO.depName }</p>
									<div class="col-auto align-self-center">
										<p style="
																		display: inline-block;
																		margin-bottom: 0;
																		color: #4E73DF;
																		font-weight: 600;
																		">${request.userVO.name} (${request.creator }) ·</p>
										<p class="regdate" data-date="${request.regDate }" style="display: inline-block;
																			margin-bottom: 0;"></p>
										<a href="/request/hit?id=${request.id}">
											<h5 class="mb-0 text-gray-800" data-anchor="data-anchor" id="file-input" style="font-size: 25px">
												${request.title }</h5>
										</a>
									</div>
									<div class="ml-auto mb-3" style="
											display: flex;
										">
										<div class="col-fill ml-auto align-self-end mr-3">
											<div class="d-flex justify-content-center"><svg xmlns="http://www.w3.org/2000/svg" fill="none"
													style="min-width: 25px;" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" aria-hidden="true"
													class="h-5 w-5">
													<path stroke-linecap="round" stroke-linejoin="round"
														d="M2.036 12.322a1.012 1.012 0 010-.639C3.423 7.51 7.36 4.5 12 4.5c4.638 0 8.573 3.007 9.963 7.178.07.207.07.431 0 .639C20.577 16.49 16.64 19.5 12 19.5c-4.638 0-8.573-3.007-9.963-7.178z">
													</path>
													<path stroke-linecap="round" stroke-linejoin="round" d="M15 12a3 3 0 11-6 0 3 3 0 016 0z"></path>
												</svg><span>${request.hit}</span></div>
										</div>
										<div class="col-fill ml-auto align-self-end mr-5">
											<div class="d-flex justify-content-center"><svg xmlns="http://www.w3.org/2000/svg" fill="none"
													style="min-width: 25px;" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" aria-hidden="true"
													class="h-5 w-5">
													<path stroke-linecap="round" stroke-linejoin="round"
														d="M8.625 9.75a.375.375 0 11-.75 0 .375.375 0 01.75 0zm0 0H8.25m4.125 0a.375.375 0 11-.75 0 .375.375 0 01.75 0zm0 0H12m4.125 0a.375.375 0 11-.75 0 .375.375 0 01.75 0zm0 0h-.375m-13.5 3.01c0 1.6 1.123 2.994 2.707 3.227 1.087.16 2.185.283 3.293.369V21l4.184-4.183a1.14 1.14 0 01.778-.332 48.294 48.294 0 005.83-.498c1.585-.233 2.708-1.626 2.708-3.228V6.741c0-1.602-1.123-2.995-2.707-3.228A48.394 48.394 0 0012 3c-2.392 0-4.744.175-7.043.513C3.373 3.746 2.25 5.14 2.25 6.741v6.018z">
													</path>
												</svg><span>${request.cntComment}</span></div>
											</div>
										</div>
									</div>
								</div>
							</c:forEach>
						</div>

						<nav aria-label="Page navigation example">
						<ul class="pagination">
							<c:if test="${pager.pre }">
								<li class="page-item"><a class="page-link" href="./list?page=${pager.startNum - 1 }&kind=${pager.kind}&search=${pager.search}&perPage=${pager.perPage}&order=${pager.order}">Previous</a></li>
							</c:if>

							<c:forEach begin="${pager.startNum }" end="${pager.lastNum }" step="1" var="i">
								<li class="page-item"><a class="page-link" href="./list?page=${i }&kind=${pager.kind}&search=${pager.search}&perPage=${pager.perPage}&order=${pager.order}">${i }</a></li>
							</c:forEach>

							<c:if test="${pager.next }">
								<li class="page-item"><a class="page-link" href="./list?page=${pager.lastNum + 1 }&kind=${pager.kind}&search=${pager.search}&perPage=${pager.perPage}&order=${pager.order}">Next</a></li>
							</c:if>

						</ul>
						</nav>
					</div>
				<!--ajaxResult 끝-->
	            </div>
	            <!-- End Page Content -->

			</div>
			<!-- End of Main Content -->
			</div>
			</div>
			<!-- Footer import -->
			<c:import url="../../temp/layout_footer.jsp"></c:import>
			<!-- End of Footer -->
		</div>
		<!-- End of Content Wrapper -->
	</div>

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script src="/js/board/request.js"></script>

	<script type="text/javascript">
		let regDates = $(".regdate");
		$.each(regDates, function(index, item){
			let regDate = item.getAttribute("data-date");
			item.append(regDate.slice(0,16));
		});

		const fiveBtn = $("#fiveBtn");		// 5개 버튼
        const tenBtn = $("#tenBtn");		// 10개 버튼
        const twentyBtn = $("#twentyBtn");	// 20개 버튼

        let currentPath = location.pathname;	// 현재 url 경로
        let currentParam = location.search;		// 현재 url 파라미터

     	// 기존에 perPage 파라미터가 있으면
        if(currentParam.search("perPage") > 0){
        	// 제거
        	currentParam = currentParam.substring(0, currentParam.search("perPage") - 1);

        	// 제거 후 url 파라미터가 없으면 ? 있으면 & 추가
        	if(currentParam == ""){
        		currentParam = currentParam + "?";
        	} else {
        		currentParam = currentParam + "&";
        	}

        } else {
        	// 기존에 perPage 파라미터가 없으면
        	// url 파라미터가 아예 없으면 ?, 다른 파라미터가 있으면 & 추가
            if(currentParam == ""){
            	currentParam = currentParam + "?";
            } else {
            	currentParam = currentParam + "&";
            }
        }

        fiveBtn.on("click", function(){
        	location.href = currentPath + currentParam + "perPage=5";
        });

        tenBtn.on("click", function(){
        	location.href = currentPath + currentParam + "perPage=10";
        });

        twentyBtn.on("click", () => {
        	location.href = currentPath + currentParam + "perPage=20";
        });

	</script>
	<!-- Scroll Top, Logout Modal import -->
	<c:import url="../../temp/layout_top_logoutModal.jsp"></c:import>
</body>
</html>