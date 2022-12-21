<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
  <%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- meta tag 추가 -->
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Insert title here</title>
<!-- 공통 css, js, jquery -->
<c:import url="../../temp/layout_header.jsp"></c:import>
<c:import url="../../temp/summernote.jsp"></c:import>
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
	
	            	<!-- Page Heading -->
	            	<!-- 요청사항 작성 -->
	            	<div class="card mb-3">
		            	<form action="./update" method="post" enctype="multipart/form-data" id="boardForm">
		            		<div class="card-header bg-white">
		            			<div class="row">
		            				<div class="col-auto align-self-center">
					                  <h5 class="mb-0 text-gray-800" data-anchor="data-anchor" id="file-input">요청게시판 수정</h5>
					                  <div class="alt-option"></div>
					                  <p class="mb-0 pt-1 mt-2 mb-0">요청게시판 수정 페이지입니다.</p>
					                </div>
					             </div>
					         </div>
				         	<div class="card-body">
				                <div class="mb-0 row">
				                	<input class="form-control-plaintext d-none" id="id" name="id" type="text" value="${boardVO.id}"/>
								  	<label class="col-sm-2 col-form-label" for="creator">수정자 사번</label>
								  	<div class="col-sm-10">
								  		<sec:authentication property="Principal" var="member"/>
								  		<input class="form-control-plaintext outline-none" id="creator" name="creator" type="text" value="${member.id}"/>
								  	</div>
								</div>
								<div class="mb-3 row">
				                	<label class="col-sm-2 col-form-label" for="title">제목</label>
								  	<div class="col-sm-10">
								  		<input class="form-control" id="title" name="title" type="text" value="${boardVO.title }"/>
								  	</div>
								</div>
								<div class="mb-3 row">
								  	<label class="col-sm-2 col-form-label" for="contents">내용</label>
								  	<div class="col-sm-10">
								  		<textarea id="contents" name="contents"></textarea>
								  	</div>
								</div>
								<div class="mb-1 row">
								  	<label class="col-sm-2 col-form-label" for=""><button type="button" id="fileAdd" class="mb-1 btn btn-sm btn-secondary">파일추가</button></label>
								  	
								</div>
								<c:forEach var="files" items="${boardVO.fileVOs}" varStatus="st">
									<c:set var="fileCnt" value="${st.count }"></c:set>
								</c:forEach>
								<div id="fileDiv" data-fileCnt="${fileCnt }">
									<c:forEach var="files" items="${boardVO.fileVOs}" varStatus="st">
													<div class="mb-1 row" data-filenum="${files.id }">
														<label class="col-sm-2 col-form-label justify-contents-end" for=""><button type="button" class="btn btn-sm btn-danger" id="DelFileInput">파일삭제</button></label>
			  											<div class="col-sm-10">
			  												<input type="file" class="custom-file-input" name="multipartFiles" id="multipartFiles">
			  												<label class="custom-file-label m-1" for="multipartFiles">${files.oriName}</label>
		  												</div>
	  												</div>
									</c:forEach>
								</div>

		            		</div>
		            		<div class="card-footer bg-white">
		            			<div class="row justify-content-end">
								<button type="button" id="btnSubmit" class="btn btn-primary">작성완료</button>
		            			</div>
							</div>
	            			
	            		</form>	
	            		
	            	</div>
	
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
	<script type="text/javascript">
    $('#contents').html('${boardVO.contents}')
    $('#contents').summernote(
			 {
		          placeholder: '내용을 입력해주세요',
		          tabsize: 2,
		          height: 200,
		          callbacks: {
				    onBlur: function() {
				      console.log('blur:' );
				    }
				  }
		      });
	</script>
    <script src="/js/boardUpdate.js"></script>
	<!-- Scroll Top, Logout Modal import -->
	<c:import url="../../temp/layout_top_logoutModal.jsp"></c:import>
</body>
</html>