<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- meta tag 추가 -->
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>공지게시판</title>
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
	            	<form class="row g-3" action="./list" method="get">
					  <div class="d-flex justify-content-center">
					  	<div class="col-auto">
						    <select class="form-control" name="kind" aria-label="Default select example">
						    	<option value="title">제목</option>
						    	<option value="contents">내용</option>
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
	                      <div class="col-auto">
	                      	<button type="button" class="btn btn-info" id="fiveBtn"><span class="badge text-bg-info">5</span></button>
              				<button type="button" class="btn btn-info" id="tenBtn"><span class="badge text-bg-info">10</span></button>
              				<button type="button" class="btn btn-info" id="twentyBtn"><span class="badge text-bg-info">20</span></button>
              			  </div>
					  </div>
					</form>
					<div>
					<a href="/notice/add" class="btn btn-danger" style="margin:10px 0;">글 작성</a> 
					</div>
	            	<!-- 공지사항 작성 -->
	            	<div class="card mb-3">
		            	<c:forEach items="${noticeList}" var="notice">
			            		<div class="card-header bg-white">
			            			<div class="row justify-content-between">
			            				<div class="col-auto align-self-center">
			            				  <a href="/notice/hit?num=${notice.num }">
						                  	<h5 class="mb-0 text-gray-800" data-anchor="data-anchor" id="file-input" style="font-size: 17px">[공지] ${notice.title }</h5>
						                  </a>
						                 </div>
						                 <div class="col-fill ml-auto align-self-end mr-5">
						                 	<p >조회수  ${notice.hit }  </p>
											<p class="regdate" data-date="${notice.regDate }"> 등록일자  </p>
						                </div>
						             </div>
						         </div>
					     </c:forEach>
	            	</div>
	            	
	            	<nav aria-label="Page navigation example">
					  <ul class="pagination">
					  	<c:if test="${pager.pre }">
					  		<li class="page-item"><a class="page-link" href="./list?page=${pager.startNum - 1 }&kind=${pager.kind}&search=${pager.search}">Previous</a></li>
					  	</c:if>
					    
					    <c:forEach begin="${pager.startNum }" end="${pager.lastNum }" step="1" var="i">
					    	<li class="page-item"><a class="page-link" href="./list?page=${i }&kind=${pager.kind}&search=${pager.search}">${i }</a></li>
					    </c:forEach>
					    
					    <c:if test="${pager.next }">
					    	<li class="page-item"><a class="page-link" href="./list?page=${pager.lastNum + 1 }&kind=${pager.kind}&search=${pager.search}">Next</a></li>
					    </c:if>
					    
					  </ul>
					</nav>
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
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
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
        if(currentParam.search("perPage") >= 0){
        	// 제거
        	currentParam = currentParam.substring(0, currentParam.search("perPage") - 1);
        	currentParam = currentParam + "&"
        }
        
        // url 파라미터가 아예 없으면
        if(currentParam == ""){
        	currentParam = currentParam + "?";
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