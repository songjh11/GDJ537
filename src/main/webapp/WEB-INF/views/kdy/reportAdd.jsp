<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- meta tag 추가 -->
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Insert title here</title>
<!-- 공통 css, js, jquery -->
<c:import url="../temp/layout_header.jsp"></c:import>
        <title>Shop Homepage - Start Bootstrap Template</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- Bootstrap icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="css/styles.css" rel="stylesheet" />
        <style>
            /* #ch:hover{
                box-shadow: rgba(0, 0, 0, 0.35) 0px 5px 15px;
            }  */
            #ch{
                height:200px;
                width: 200px;
                overflow: hidden; 
            }
            #ch img{
                    height:100%;
                    width: 100%;
                    object-fit:cover;   
                    transform:scale(1.0);        
                    transition: transform .5s; 
            }  
            #ch img:hover{            /* 마우스 호버시 */
            transform:scale(1.5);            /* 이미지 확대 */
            transition: transform .5s; 	/*  시간 설정  */
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
					  <section class="py-5">
			            <div class="container px-4 px-lg-5 mt-5">
			                <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
			                    <!-- 휴가 신청서 -->
			                    <div class="col mb-5">
			                        <div class="card h-100" style="cursor: pointer;" id="ch" onclick="location.href='/kdy/vacationApplication'">
			                            <!-- Product image-->
			                            <img class="card-img-top" style="width: 210px; height: 220px;" src="../img/KakaoTalk_20221208_194843493.jpg" alt="..." />
			                            <!-- Product details--> 
			                            <div class="card-body p-4">
			                                <div class="text-center">
			                                    <!-- Product name-->
			                                    <h5 class="fw-bolder">휴가 신청서</h5>
			                                </div>
			                            </div>
			                        </div>
			                    </div>
			                    <!-- 보고서 -->
			                    <div class="col mb-5">
			                        <div class="card h-100" id="ch" style="cursor: pointer;" onclick="location.href='/kdy/workReport'">
			                            <!-- Product image-->
			                            <img class="card-img-top"  style="width: 223px; height: 240px;" src="../img/KakaoTalk_20221208_194900459.jpg" alt="..." />
			                            <!-- Product details-->
			                            <div class="card-body p-4" >
			                                <div class="text-center">
			                                    <!-- Product name-->
			                                    <h5 class="fw-bolder">업무 보고서</h5>
			                                </div>
			                            </div>
			                        </div>
			                    </div>
			                    <!-- 지출 결의서 -->
			                    <div class="col mb-5">
			                        <div class="card h-100" id="ch" style="cursor: pointer;" onclick="location.href='/kdy/cashDisbursementVoucher'">
			                            <!-- Product image-->
			                            <img class="card-img-top" style="width: 223px; height: 240px;" src="../img/KakaoTalk_20221208_194918654.jpg" alt="..." />
			                            <!-- Product details-->
			                            <div class="card-body p-4">
			                                <div class="text-center">
			                                    <h5 class="fw-bolder">지출결의서</h5>   
			                                </div>
			                            </div>
			                        </div>
			                    </div>
			                    <!-- 추천서 -->
			                    <div class="col mb-5">
			                        <div class="card h-100" id="ch" style="cursor: pointer;"  onclick="location.href='/kdy/writtenApology'">
			                            <!-- Product image-->
			                            <img class="card-img-top" style="width: 223px; height: 240px;" src="../img/KakaoTalk_20221208_2046163ㄴㄴㄴㄴ44.jpg" alt="..." />
			                            <!-- Product details-->
			                            <div class="card-body p-4">
			                                <div class="text-center">
			                                    <!-- Product name-->
			                                    <h5 class="fw-bolder">시말서</h5>
			                                </div>
			                            </div>   
			                        </div>
			                    </div>
			                </div>
			            </div>
			        </section>
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
	        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="js/scripts.js"></script>
</body>
</html>