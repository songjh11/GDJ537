<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
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
      <link rel="stylesheet"
        href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
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

              <!-- 공지사항 작성 -->
              <div class="card mb-3">

                <div class="card-header bg-white">
                  <div class="row justify-content-between">
                    <div class="col-auto align-self-center">
                    
                      <h5 class="mb-2 text-gray-800" data-anchor="data-anchor" id="file-input">[공지사항] <c:out value="${boardVO.title }"></c:out>
                      </h5>
                      <div style="display: flex">
                      	  <p id="regdate" style="margin-right: 5px;" data-date="<c:out value="${boardVO.regDate}"></c:out>"> 입력 </p>
	                      <c:if test="${boardVO.updateDate != null}">
	                      	<p>| 수정 <fmt:formatDate value="${boardVO.updateDate}" pattern="yyyy-MM-dd HH:mm"/></p>
	                      </c:if>
                      </div>
                    </div>
                    <div class="col-fill ml-auto align-self-end mr-5">
                      <div>
                      	<p>작성자 <c:out value="${boardVO.userVO.name }"></c:out></p>
                      	<c:if test="${not empty boardVO.updater}">
                      		<p>수정자 <c:out value="${boardVO.updaterName }"></c:out></p>
                      	</c:if>
                      	<p>조회수 <c:out value="${boardVO.hit}"></c:out> </p>
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
			                        <a class="dropdown-item" href="https://gdj537-yeyey.s3.ap-northeast-2.amazonaws.com/${file.fileName}">${file.oriName }(${file.fileSize }) </a>
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
              <sec:authorize access="hasAuthority('관리자')">
	              <a href="/notice/update?id=<c:out value="${boardVO.id}"></c:out>" class="btn btn-danger">글 수정</a>
	              <button type="button" class="btn btn-danger" id="deleteBtn" data-boardnum="${boardVO.id}">글 삭제</button>
			  </sec:authorize>
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
        let regDate = $("#regdate").attr("data-date")
        $("#regdate").append(regDate.slice(0, 16))

      </script>
      <!-- Scroll Top, Logout Modal import -->
      <c:import url="../../temp/layout_top_logoutModal.jsp"></c:import>
      <script src="/js/boardDelete.js"></script>
    </body>

    </html>
