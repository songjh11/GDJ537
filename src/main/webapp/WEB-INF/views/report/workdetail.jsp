<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
    <title>결재 신청 상세</title>
    <c:import url="../temp/layout_header.jsp"></c:import>
</head>
<body>
    <!-- Page Wrapper -->
    <div id="wrapper">
		
        <!-- Sidebar -->
        <c:import url="../temp/layout_sidebar.jsp"></c:import>
        <!-- End of Sidebar -->

        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
            <div id="content">

                <!-- Topbar -->
                <c:import url="../temp/layout_topbar.jsp"></c:import>
                <!-- End of Topbar -->
				
				<div class="container px-4 px-lg-5 my-5">
					<a href="./doreport?cat=2" class="btn btn-primary btn-icon-split btn-sm">
                       <span class="icon text-white-50">
                       <i class="fas fa-arrow-right"></i>
                       </span>
                       <span class="text">업무보고서 목록</span>
                       </a>
				</div>
			
			
	            <div class="container-fluid">
	 <div class="container px-4 px-lg-5 my-5">
        <div style=" margin-left: 85px; margin-top: 45px; width: 1000px; height: 1300px; border: solid 1px black; text-align: center;">
            <div style="letter-spacing: 70px; margin-left: 60px; margin-top: 25px; background-color: rgb(255, 255, 249); text-align: center; color: black; font-size: 35px; font-weight: bolder; vertical-align: top;" >
                   업무보고서
            </div>
            <hr >

            <div  style="border: solid 1px black; margin-top: 25px; margin-left: 45px; width: 900px; height: 110px; ">
                <div style="height: 55px; border-bottom: solid 1px black;">
                    <div class="d-flex">
                        
                        <div style="width: 225px; height: 55px; border-right: solid 1px black;">
                            <div style=" font-size:  16px; padding-top: 15px; font-weight: bolder; letter-spacing: 70px; padding-left: 50px;">
                                성명
                            </div>
                        </div>
                        <input style="width: 220px; height: 50px; border: 0; text-align: center;" name="name" readonly value="${reportWorkVO.name}"/>
                        <!-- USER.NAME -->

                        <div style="width: 225px; height: 55px; border-right: solid 1px black;  border-left: solid 1px black;">
                            <div style=" font-size:  16px; padding-top: 15px; font-weight: bolder; letter-spacing: 40px; padding-left: 50px;">
                                부서명
                            </div>
                        </div>
                        <input style="width: 220px; height: 50px; text-align: center; border: 0;" name="depName" readonly value="${reportWorkVO.depName}"/>
                         <!-- DEPARTMENT.DEPNAME -->

                    </div>    
                </div> 
                <div style="height: 55px;">
                    <div class="d-flex">
                        <div class="d-flex">
                        
                            <div style="width: 225px; height: 55px; border-right: solid 1px black;">
                                <div style=" font-size:  16px; padding-top: 15px; font-weight: bolder; letter-spacing: 70px; padding-left: 50px;">
                                    직책
                                </div>
                            </div>
                            <input style="width: 220px; height: 50px; border: 0; text-align: center;" name="roleName" readonly value="${reportWorkVO.roleName}"/>
                            <!-- ROLE.ROLENAME -->
    
                            <div style="width: 225px; height: 55px; border-right: solid 1px black;  border-left: solid 1px black;">
                                <div style=" font-size:  16px; padding-top: 15px; font-weight: bolder; letter-spacing: 40px; padding-left: 50px;">
                                    작성일
                                </div>
                            </div>
                            <input style="width: 220px; height: 50px; text-align: center; border: 0;"readonly value="${year}-${month}-${day}" name="date"/>
                            <!-- DATE -->
                        </div> 
                    </div>    
                </div>    
            </div>

            <div style="margin-top: 20px; margin-left: 45px; width: 900px; height: 1010px; border: solid 1px black;" >
                            <div style="border-bottom: solid 1px black; height: 40px; padding-top: 5px;">
                                금일 실시사항 /  금일 업무실적
                            </div>
                            <div style="height: 212px; border-bottom: solid 1px black;">
                                <div style="height: 107px; border-bottom: solid 1px black;">
                                    <div style="border-right: solid 1px black; width: 100px; height: 107px;">
                                        <div style="padding-top: 28px; font-weight: bold;">
                                            오<br>
                                            전
                                        </div>
                                        <div style=" margin-left: 100px; width: 800px; height: 107px; margin-top: -77px;">
                                            ${reportWorkVO.am}
                                        </div>
                                    </div>
                                    <div style="border-right: solid 1px black; width: 100px; height: 107px;">
                                        <div style="padding-top: 28px; font-weight: bold;">
                                            오<br>
                                            후
                                        </div>
                                        <div style=" margin-left: 100px; width: 800px; height: 107px; margin-top: -77px;">
                                            ${reportWorkVO.pm}
                                            <!-- <textarea id="pm" style=" width: 780px; height: 100px; text-align: left; border: 0; margin-top: 5px;" name="pm"></textarea> -->
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div style="height: 40px; border-bottom: solid 1px black; padding-top: 5px;">
                                    미처리내역 및 개선사항
                            </div>
                        <div style="height: 212px; border-bottom: solid 1px black;">
                            ${reportWorkVO.undo}
                            <!-- <textarea  style="width:895px; height: 209px; text-align: left; border: 0;" name="undo"></textarea> -->
                        </div>
                            <div style="height: 40px; border-bottom: solid 1px black; padding-top: 5px;">
                                내일 예정업무
                            </div>
                        <div style="height: 212px; border-bottom: solid 1px black;">
                            ${reportWorkVO.todo}
                            <!-- <textarea  style="width:895px; height: 209px; text-align: left; border: 0;" name="todo"></textarea> -->
                        </div>
                            <div style="height: 40px; border-bottom: solid 1px black; padding-top: 5px;">
                                문제점 및 특이사항 보고
                            </div>
                        <div class="d-flex" style="height: 212px; border-bottom: solid 1px black; ">
                            <div style="border-right: solid 1px black; height: 212px; width: 450px;">
                                ${reportWorkVO.wrong}
                                <!-- <textarea  style="border: 0; width: 445px; height: 212px; text-align: left;" name="wrong"></textarea> -->
                            </div>
                            <div style=" height: 212px; width: 450px;">
                                ${reportWorkVO.etc}
                                <!-- <textarea  style="border: 0; width: 445px; height: 212px; text-align: left;" name="etc"></textarea> -->
                            </div>
                        </div>
                        
                   
                   <div>

                   </div>
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
</body>
</html>