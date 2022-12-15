<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- meta tag 추가 -->
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<script defer src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
<link rel="stylesheet" href="/css/goods/add.css">
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<title>Insert title here</title>
<!-- 공통 css, js -->
<c:import url="../temp/layout_header.jsp"></c:import>
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
	
	            	<!-- Page Heading -->
	            	<h1 class="h3 mb-4 text-gray-800" id="title">공용 시설 수정</h1>
	            	
	            	<form action="update" method="post" enctype="multipart/form-data" id="addform">
	            	 <div class="mb-3">
	            	 	<div>
					    	<label for="exampleInputName" class="form-label" data-str-num="${str}" style="font-weight : bold">*종류</label>
					    </div>
					    <label class="test_obj">
						    <input type="radio" <c:if test="${str == 'RO'}">checked</c:if> value=${goods.goodsId} disabled>
						    <span>회의실</span>
						</label>
						 
						<label class="test_obj">
						    <input type="radio" <c:if test="${str == 'CA'}">checked</c:if> value=${goods.goodsId} disabled>
						    <span>차량</span>
						</label>
						<div id="kinddiv"></div>
					  </div>
					  <div>
						<input type="hidden" id="goodId" name="goodsId" value="${goods.goodsId}">
					  </div>
					  <div class="mb-3">
					    <label for="exampleInputName" class="form-label" style="font-weight : bold">*시설 이름</label>
					    <input type="text" class="form-control" id="name" name="name" value="${goods.name}">
						<div id="namediv" class="check"></div>
					  </div>
					  <div class="mb-3">
					    <label for="exampleInputContents" class="form-label">시설 설명</label>
			            <textarea  class="form-control add_ele" id="contents" name="contents">${goods.contents}</textarea>
					  </div>
					  <div class="mb-3">goodId
					    <label for="exampleInputMax" class="form-label">최대 인원</label>
					    <input type="text" class="form-control" id="max" name="max" value="${goods.max}" >
						<div id="maxdiv" class="check"></div>

					  </div>
					  <div class="mb-3">
					    <label for="exampleInputLocation" class="form-label" style="font-weight : bold">*시설 위치</label>
					    <input type="text" class="form-control" id="location" name="location" value="${goods.location}">
						<div id="locationdiv" class="check"></div>

					  </div>
					  <div class="mb-3" <c:if test="${str == 'RO'}">style ="display:none;"</c:if>>
					    <label for="exampleInputLocation" class="form-label" style="font-weight : bold">*차량 번호</label>
					    <input type="text" class="form-control" id="carNum" name="carNum" value="${goods.carNum}">
						<div id="carNumdiv" class="check"></div>

					  </div>
					  <div>
						<div class="mb-3" id="fileAddResult">      
							<c:forEach items="${list}" var="li">
								<div class="file_form mt-2">
									<!-- <img src="/file/goods/${li.fileName}"  width="300" height="300"> -->
									<input type="file" name="files" class="files form-control">
									<span class="text ff" >${li.oriName}</span> 
									<button type="button" class="del btn btn-danger" style="margin:auto;display: block;">X</button>
								</div>
							</c:forEach>
						</div>
						<div class="mb-3">
							<button type="button" id="fileAdd" class="btn btn-success">파일 추가</button>
							<div id="imgdiv" class="check"></div>
				 		</div>
					  </div>
					  <input type="button" class="btn btn-primary" value="수정" id="sub">
					  <input type="button" id="delete" class="btn btn-danger" value="삭제" data-id-num="${goods.goodsId}">
					</form>
	
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

	<!-- Scroll Top, Login Modal import -->
	<script src="/js/goods/update.js"></script>
	<c:import url="../temp/layout_top_logoutModal.jsp"></c:import>
	<!-- <script type="text/javascript">
      $(document).ready(function(){
        $("#contents").summernote({
          height:500,
          minHeight: null,             // 최소 높이
				  maxHeight: null,             // 최대 높이
			  	focus: true,                  // 에디터 로딩후 포커스를 맞출지 여부
			  	lang: "ko-KR",					// 한글 설정
			  	placeholder: '최대 2048자까지 쓸 수 있습니다',	//placeholder 설정
			  	callbacks: {	//여기 부분이 이미지를 첨부하는 부분
            onImageUpload : function(files) {
              uploadSummernoteImageFile(files[0],this);
            },
            onPaste: function (e) {
              var clipboardData = e.originalEvent.clipboardData;
              if (clipboardData && clipboardData.items && clipboardData.items.length) {
                var item = clipboardData.items[0];
                if (item.kind === 'file' && item.type.indexOf('image/') !== -1) {
                  e.preventDefault();
                }
              }
            }
				  }
        });
      })
	</script> -->
</body>
</html>