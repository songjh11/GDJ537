<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
  <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
  <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- meta tag 추가 -->
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Insert title here</title>
<!-- 공통 css, js, jquery -->
<c:import url="../../temp/layout_header.jsp"></c:import>
<!-- 파일 다운로드 아이콘 -->
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
      <style type="text/css">
      	.dropdown-toggle::after{
      		vertical-align:inherit;
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
					<button type="button" class="btn btn-success mb-3" id="goListBtn">이전으로</button>
	            	<!-- 공지사항 작성 -->
	            	<div class="card mb-3">
		            	
		            		<div class="card-header bg-white">
		            			<div class="row justify-content-between">
		            				<div class="col-auto align-self-center">
					                  <h5 class="mb-2 text-gray-800" data-anchor="data-anchor" id="file-input">[요청사항] ${boardVO.title}</h5>
					                 <div style="display: flex">
					                      <p style="margin-right: 5px" id="regdate" data-date="${boardVO.regDate}"> 등록 </p>
					                      <c:if test="${boardVO.updateDate != null}">
					                    	 <p>| 수정 
					                      	<fmt:formatDate value="${boardVO.updateDate}" pattern="yyyy-MM-dd HH:mm"/></p>
					                      </c:if>
				                      </div>
					                 </div>
					                 <div class="col-fill ml-auto align-self-end mr-5">
					                 	<div>
					                      <p>작성자 ${boardVO.userVO.name }</p>
					                      <p>조회수 ${boardVO.hit} </p>
					                    </div>
					                </div>
					             </div>
					         </div>
				         	<div class="card-body" style="min-height: 500px">
				         		<div class="mb-1 row justify-content-end">
			                    <div class="col-2">
			                    <c:if test="${!empty boardVO.fileVOs}">
			                  	<button class="btn btn-outline-dark btn-block  dropdown-toggle dropdown-toggle-split"  data-toggle="dropdown" aria-expanded="false" type="button">
			                            <span class="material-symbols-outlined my-auto" style="vertical-align: middle;"></span>
			                            
                            			<span style="vertical-align: middle;"> 첨부파일 (${fn:length(boardVO.fileVOs) }) </span>
			                    </button>
					              <div class="dropdown-menu dropdown-menu-right">
		                          <c:forEach items="${boardVO.fileVOs}" var="file" varStatus="status">
			                        <a class="dropdown-item" href="https://gdj537-yeyey.s3.ap-northeast-2.amazonaws.com/${file.fileName}">${file.oriName } <span style="color:blue;"> (${file.fileSize }) </span></a>
			                        <c:if test="${status.last ne true}"><div class="dropdown-divider"></div></c:if>
			                      </c:forEach>
		
								  </div>
								  </c:if>
				         		</div>
				         		</div>
				                <div class="mb-5 row">
								  	<div class="col">
								  		${boardVO.contents}
								  	</div>
								</div>
		            		</div>
	            		
	            	</div>
	            	
              <!-- 댓글 -->
              <input type="hidden" name="creator" id="commentIdInput" value="4321">
              <div class="mb-5">
                <label for="contents" class="form-label">[요청] 댓글 쓰기</label>
                <textarea class="form-control" id="contents" style="height: 100px"
                  placeholder="Leave a comment here"></textarea>
              </div>
              <div class="mb-5">
                <button type="button" id="b1" data-boardnum="${boardVO.id}" class="btn btn-success">댓글등록</button>
              </div>
              <!-- 댓글 목록 -->
              <div>
                <table id="commentList" class="table table-striped"></table>
              </div>

              <div>
                <!-- modal -->
                <button type="button" style="display: none;" class="btn btn-primary" id="up" data-toggle="modal"
                  data-target="#updateModal" data-whatever="@getbootstrap">Open modal for
                  @getbootstrap</button>

                <div class="modal fade" id="updateModal" tabindex="-1" aria-labelledby="exampleModalLabel"
                  aria-hidden="true">
                  <div class="modal-dialog">
                    <div class="modal-content">
                      <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">댓글수정</h5>
                        <button type="button" class="btn-close" data-dismiss="modal" aria-label="Close"></button>
                      </div>

                      <div class="modal-body">
                        <form>
                          <div class="mb-3">
                            <label for="message-text" class="col-form-label">내용:</label>
                            <textarea class="form-control" id="updateContents"></textarea>
                          </div>
                        </form>
                      </div>

                      <div class="modal-footer">
                      
                        <button type="button" class="btn btn-danger" data-dismiss="modal">닫기</button>
                        <button type="button" class="btn btn-success" data-dismiss="modal" id="update">수정하기</button>
                      </div>

                    </div>
                  </div>
                </div>

              </div>

              <!-- 나중에 로그인한 사용자와 작성자가 일치하는지 검증 -->
              <sec:authentication property="Principal" var="member"/>
              <c:if test="${not empty member}">
	              <c:if test="${member.id eq boardVO.creator}">
		              <a href="/request/update?id=${boardVO.id}" class="btn btn-danger">글 수정</a>
		              <button type="button" class="btn btn-danger" id="deleteBtn" data-boardnum="${boardVO.id}">글 삭제</button>
	              </c:if>
              </c:if>
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
	<script src="/js/boardDelete.js"></script>
	<script src="/js/boardComment.js"></script>
	<script type="text/javascript">
		let regDate = $("#regdate").attr("data-date")
		$("#regdate").append(regDate.slice(0,16))
		
		let goListBtn = $("#goListBtn");
		goListBtn.on("click", function () {
			// 이전 페이지의 URI를 불러옴, 단, url을 직접 적어서 들어오면 값이 빈값
			let referrer = document.referrer;
			
			if(referrer == ""){
				history.back(-1);	// 그냥 이전 페이지를 다시 요청함
			} else {
				location.href = referrer;	// 이전의 URI로 요청함
			}
		});
	</script>
	<!-- Scroll Top, Logout Modal import -->
	<c:import url="../../temp/layout_top_logoutModal.jsp"></c:import>
	
</body>
</html>