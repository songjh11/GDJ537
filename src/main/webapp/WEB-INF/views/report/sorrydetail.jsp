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
    <script defer="defer" type="text/javascript" src="/js/report/report.js"></script>
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
				<input type="text" style="display: none;" id="result" value="${result }" data-status="${result }">
 				<input type="text" style="display: none;" id="applyNum" value="${reportSorryVO.applyNum }" data-num="${reportSorryVO.applyNum }">
                <div class="container px-4 px-lg-5 my-5">
					<a href="./doreport?cat=4" class="btn btn-primary btn-icon-split btn-sm">
                       <span class="icon text-white-50">
                       <i class="fas fa-arrow-right"></i>
                       </span>
                       <span class="text">시말서 목록</span>
                       </a>
				</div>
		    
				<!-- Begin Page Content -->
	            <div class="container-fluid">
						<div class="container px-4 px-lg-5 my-5">
        <div style=" margin-left: 85px; margin-top: 45px; width: 1000px; height: 1300px; border: solid 1px black; text-align: center;">
            <div style="letter-spacing: 70px; margin-left: 60px; margin-top: 45px; background-color: rgb(255, 255, 249); text-align: left; color: black; font-size: 35px; font-weight: bolder; vertical-align: top;" >
                   시말서
                   <div style="border: solid 1px black; width: 400px; margin-left: 500px; height: 120px; margin-top: -75px;">
                    <div style="border-right: solid 1px black; width: 30px; height: 119px; font-size: 19px; padding-top: 30px; padding-left: 5px;">
                        결<br>
                        재
                    </div>
                    <div class="row" style="border-bottom: solid 1px black; margin-top: -120px; width: 368px; margin-left: 30px; height: 30px; font-size: 15px;">
                        <div style="padding-top:3px; letter-spacing: 0; margin-left: 30px;">팀장&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;최종
                                                                                            &ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;비고</div>
                        <div id="ajaaja"></div>
                        <div id="ajaaja"></div>
                        <div style=" height: 90px; width: 122px; margin-top: 6px;"></div>
                        
                    </div>
                </div>
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
                        <input style="width: 220px; height: 50px; border: 0; text-align: center;" readonly value="${reportSorryVO.name}"/>

                        <div style="width: 225px; height: 55px; border-right: solid 1px black;  border-left: solid 1px black;">
                            <div style=" font-size:  16px; padding-top: 15px; font-weight: bolder; letter-spacing: 40px; padding-left: 50px;">
                                부서명
                            </div>
                        </div>
                        <input style="width: 220px; height: 50px; text-align: center; border: 0;"  readonly value="${reportSorryVO.depName}"/>
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
                            <input style="width: 220px; height: 50px; border: 0; text-align: center;" value="${reportSorryVO.roleName}"/>
    
                            <div style="width: 225px; height: 55px; border-right: solid 1px black;  border-left: solid 1px black;">
                                <div style=" font-size:  16px; padding-top: 15px; font-weight: bolder; letter-spacing: 40px; padding-left: 50px;">
                                    작성일
                                </div>
                            </div>
                            <input style="width: 220px; height: 50px; text-align: center; border: 0;" readonly value="${year}-${month}-${day}" />
                        </div> 
                    </div>    
                </div>    
            </div>

            <div style="margin-top: 20px; margin-left: 45px; width: 900px; height: 950px; border: solid 1px black;" >
                <div style="font-weight: bold; margin-top: 15px;">
                    위 본인은 직원으로서 제 사규를 맡은바 책임과 의무를 다하여 성실히 복무하여야함에도<br>
                    불구하고 아래와 같이 회사의 관련 규정을 위반하였는바 이에 시말서를 제출하고<br>
                    그에 따른 처벌을 감수하며 차후 본건을 계기로 과오의 재발이 없을 것임을 서약합니다.
                </div>
                <div style="border: solid 1px red; margin-top: 15px; height: 50px; text-align: center; font-weight: bold;">
                    <div style="padding-top: 10px; font-size: 20px;">
                        위 반 내 용(상세히 기술요함)
                    </div>   
                </div>
                <div style="border-bottom: solid 1px black; height: 600px;">
                    ${reportSorryVO.text}
                </div>
                <div style="font-weight: bold; text-align: center; margin-top: 25px;">
                    상기 기록사실에 허위가 없습니다.
                </div>
                <div style=" width: 900px; height: 250px;"> 
                    <div class="d-flex" style="font-weight: bold; margin-left: 240px; margin-top: 45px;">
                        <div><input type="text" style="width: 100px; border:0 solid black; text-align:right" id="ApologyY" value="${year}"/>년</div>
                        <div><input type="text" style="width: 100px; border:0 solid black; text-align:right" id="ApologyM" value="${month}"/>월</div>
                        <div><input type="text" style="width: 100px; border:0 solid black; text-align:right" id="ApologyD" value="${day}"/>일</div>
                    </div>
                    <div style="font-weight: bold; margin-top: 50px; margin-left: 150px;">
                        신청자 : <input type="text" value="${reportSorryVO.name}"  style="border:0 solid black" />
                    </div>
                </div>
            </div>
        </div>    
        
		<button type="button" id="license" class="btn btn-primary" style="margin-left: 1025px; margin-top: 12px;">승인</button>
		<button type="button" id="returns" class="btn btn-primary" style="margin-left: 1025px; margin-top: 12px;">반려</button>
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