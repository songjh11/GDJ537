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
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
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
	            	<h1 class="h3 mb-4 text-gray-800">공용 시설 추가</h1>
	            	
	            	<form action="add" method="post" enctype="multipart/form-data">
	            	 <div class="mb-3">
	            	 	<div>
					    	<label for="exampleInputName" class="form-label">kind</label>
					    </div>
					    <label class="test_obj">
						    <input type="radio" name="id" value="RO">
						    <span>회의실</span>
						</label>
						 
						<label class="test_obj">
						    <input type="radio" name="id" value="CA">
						    <span>차량</span>
						    <span>차량1</span>
						</label>
					  </div>
					  <div class="mb-3">
					    <label for="exampleInputName" class="form-label">name</label>
					    <input type="text" class="form-control" id="name" name="name">
					  </div>
					  <div class="mb-3">
					    <label for="exampleInputContents" class="form-label">contents</label>
			            <textarea  class="form-control add_ele" id="contents" name="contents"></textarea>
					  </div>
					  <div class="mb-3">
					    <label for="exampleInputMax" class="form-label">max</label>
					    <input type="text" class="form-control" id="max" name="max">
					  </div>
					  <div class="mb-3">
						<label for="exampleInputLocation" class="form-label">location</label>
						<input type="text" class="form-control" id="location" name="location">
					  </div>
					  <div class="mb-3" style="display: none;" id="carChecked">
						<label for="exampleInputLocation" class="form-label">CarNumber</label>
						<input type="text" class="form-control" id="carNum" name="carNum">
					  </div>
					  <div class="board-filetitle">이미지 첨부  
			          	<div class="mb-3" id="fileAddResult">      
			            </div>
			          </div>
			          <div class="mb-3">
			          	<button type="button" id="fileAdd" class="btn btn-success">파일 추가</button>
			          </div>
					  <button type="submit" class="btn btn-primary">Submit</button>
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
	<c:import url="../temp/layout_top_logoutModal.jsp"></c:import>
	<script src="/js/goods/addFiles.js"></script>
	<script src="/js/goods/add.js"></script>
</body>
</html>