<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <!DOCTYPE html>
    <html>

    <head>
      <meta charset="UTF-8">
      <!-- meta tag 추가 -->
      <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
      <title>익명게시글 작성</title>
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
              <!-- <h1 class="h3 mb-4 text-gray-800">여기에 상세페이지 작성</h1> -->
              <!-- 공지사항 작성 -->
              <div class="card mb-3">
                <form action="./add" method="post" enctype="multipart/form-data" id="boardForm">
                  <div class="card-header bg-white">
                    <div class="row">
                      <div class="col-auto align-self-center">
                        <h5 class="mb-0 text-gray-800" data-anchor="data-anchor" id="file-input">익명게시판 작성</h5>
                        <div class="alt-option"></div>
                        <p class="mb-0 pt-1 mt-2 mb-0">익명게시판 작성 페이지입니다.</p>
                      </div>
                    </div>
                  </div>
                  <div class="card-body">
                    <!-- <div class="mb-0 row">
								  	<label class="col-sm-2 col-form-label" for="id">작성자 사번</label>
								  	<div class="col-sm-10">
								  		<input class="form-control-plaintext outline-none" id="id" name="id" type="text" value="1234"/>
								  	</div>
								</div> -->
                    <!-- 나중에 로그인한 사용자의 값이 오도록 수정 -->
                    <input type="hidden" name="creator" id="id" value="1234">
                    <div class="mb-3 row">
                      <label class="col-sm-2 col-form-label" for="title">제목</label>
                      <div class="col-sm-10">
                        <input class="form-control" id="title" name="title" type="text" value=""
                          placeholder="제목을 입력해주세요" />
                      </div>
                    </div>
                    <div class="mb-3 row">
                      <label class="col-sm-2 col-form-label" for="contents">내용</label>
                      <div class="col-sm-10">
                        <textarea id="contents" name="contents"></textarea>
                      </div>
                    </div>
                    <div class="mb-1 row">
                      <label class="col-sm-2 col-form-label" for=""><button type="button" id="fileAdd"
                          class="mb-1 btn btn-sm btn-secondary">파일추가</button></label>

                    </div>
                    <div id="fileDiv">
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
      <!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script> -->
      <script src="/js/boardAdd.js"></script>
      <!-- Scroll Top, Logout Modal import -->
      <c:import url="../../temp/layout_top_logoutModal.jsp"></c:import>
    </body>

    </html>