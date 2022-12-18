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
 				 <input type="text" style="display: none;" id="applyNum" value="${reportVacaVO.applyNum }" data-num="${reportVacaVO.applyNum }">
				<div class="container px-4 px-lg-5 my-5">
					<a href="./doreport?cat=1" class="btn btn-primary btn-icon-split btn-sm">
                       <span class="icon text-white-50">
                       <i class="fas fa-arrow-right"></i>
                       </span>
                       <span class="text">휴가신청 목록</span>
                       </a>
				</div>
				
	            <div class="container-fluid">
						<div class="container px-4 px-lg-5 my-5">
        <div  style=" margin-left: 85px; margin-top: 45px; width: 1000px; height: 1150px; border: solid 1px black; text-align: center;">
            <div style="letter-spacing: 70px; margin-left: 60px; margin-top: 60px; background-color: rgb(255, 255, 249); text-align: left; color: black; font-size: 35px; font-weight: bolder; vertical-align: top;" >
                    휴가신청서
                    <div style="border: solid 1px black; width: 400px; margin-left: 500px; height: 120px; margin-top: -75px;">
                        <div style="border-right: solid 1px black; width: 30px; height: 119px; font-size: 19px; padding-top: 30px; padding-left: 5px;">
                            결<br>
                            재
                        </div>
                        <div class="row" style="border-bottom: solid 1px black; margin-top: -120px; width: 368px; margin-left: 30px; height: 30px; font-size: 15px;">
                            <div style="padding-top:3px; letter-spacing: 0; margin-left: 30px;">팀장&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;최종
                                                                                                &ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;비고</div>
                            
                            <c:choose>
                            <c:when test="${reportVacaVO.status eq 1}">
                            <div style=" align-items:center; display: flex; justify-content:center;" id="ajaaja">
                                </div>
                            <div style=" align-items:center; display: flex; justify-content:center;" id="ajaaja">
                                </div>
                            <div style=" height: 90px; width: 122px; margin-top: 6px;"></div>
                            </c:when>
                            <c:when test="${reportVacaVO.status eq 2}">
                            <div style=" align-items:center; display: flex; justify-content:center;" id="ajaaja">
                                <img src="/img/report/sign.png" width="85px" height="85px"></div>
                            <div style=" align-items:center; display: flex; justify-content:center;" id="ajaaja">
                                <img src="/img/report/sign.png" width="85px" height="85px"></div>
                            <div style=" height: 90px; width: 122px; margin-top: 6px;"></div>
                            </c:when>
                            <c:when test="${reportVacaVO.status eq 3}">
                            <div style=" align-items:center; display: flex; justify-content:center;" id="ajaaja">
                                <img src="/img/report/sign.png" width="85px" height="85px"></div>
                            <div style=" align-items:center; display: flex; justify-content:center;" id="ajaaja">
                                <img src="/img/report/sign.png" width="85px" height="85px"></div>
                            <div style=" height: 90px; width: 122px; margin-top: 6px;">
                            	<img src="/img/report/sign.png" width="85px" height="85px"></div>
                            </c:when>
                            </c:choose>
                            
                        </div>
                    </div>
            </div>
            <hr >
            <div style="margin-top: 50px; margin-left: 45px; width: 900px; height: 900px; border: solid 1px black;" >
                    <div style="width: 250px; height: 700px; border-right: solid 1px black;">
                        <div style="width: 900px; height: 100px; border-bottom: solid 1px black;">
                            <div id="bc" style="text-align: left; font-weight: bold; font-size: 20px; padding-left: 70px; padding-top: 34px; letter-spacing: 70px;">
                                소속
                                <div style=" margin-left: 180px; width: 650px; height: 100px; margin-top: -64px;">
                                    <input readonly style="border: 0; text-align: center; width: 645px; height: 97px;" value="${reportVacaVO.depName}">
                                    <!-- DEOARTMENT.DEPNAME = 부서번호 -->
                                </div>
                            </div>
                        </div>
                        <div style="width: 900px; height: 100px; border-bottom: solid 1px black;">
                            <div id="bc" style="text-align: left; font-weight: bold; font-size: 20px; padding-left: 70px; padding-top: 34px; letter-spacing: 70px;">
                                성명
                                <div style=" margin-left: 180px; width: 650px; height: 100px; margin-top: -64px;">
                                    <input type="text" readonly style="border: 0; text-align: center; width: 645px; height: 97px;" value="${reportVacaVO.name}">
                                    <!-- USER.NAME = 이름 -->
                                </div>
                            </div>
                            
                        </div>
                        <div style="width: 900px; height: 100px; border-bottom: solid 1px black;">
                            <div id="bc" style="text-align: left; font-weight: bold; font-size: 20px; padding-left: 70px; padding-top: 34px; letter-spacing: 70px;">
                                직위
                                <div style=" margin-left: 180px; width: 650px; height: 100px; margin-top: -64px;">
                                    <input type="text" readonly style="border: 0; text-align: center; width: 645px; height: 97px;" value="${reportVacaVO.roleName}">
                                    <!-- ROLE.ROELNAME = 직급이름  -->
                                </div>
                            </div>
                            
                        </div>
                        <div style="width: 900px; height: 100px; border-bottom: solid 1px black;">
                            <div  id="bc" style="text-align: left; font-weight: bold; font-size: 17px; padding-left: 70px; padding-top: 34px; letter-spacing: 70px;">
                                종류
                                    <div style=" margin-left: 180px; width: 650px; height: 100px; margin-top: -55px;">
                                        <div style="margin-left: 29px;" id="cate">
                                            <!--<input type="hidden" name="categoryNum" id="checkRadio"/> --> 
                                            <c:choose>
                                            <c:when test="${reportVacaVO.categoryNum eq 1}">
                                            <input type="radio" class="mail" id="s1" name="categoryNum" checked disabled value="1" name="categoryNum" data-radio="1"/>
                                            <label for="mail">연차</label>
                                            <input type="radio" class="mail" id="s2" name="categoryNum" value="2" name="categoryNum" data-radio="2"/>
                                            <label for="mail">월차</label>
                                            <input type="radio" class="mail" id="s3" name="categoryNum" value="3" name="categoryNum" data-radio="3"/>
                                            <label for="mail">병가</label>
                                            <input type="radio" class="mail" id="s4" name="categoryNum" value="4" name="categoryNum" data-radio="4"/>
                                            <label for="mail">반차</label>
                                            <input type="radio" class="mail" id="s5" name="categoryNum" value="5" name="categoryNum" data-radio="5"/>
                                            <label for="mail">기타</label>
                                            </c:when>
                                            <c:when test="${reportVacaVO.categoryNum eq 2}">
                                            <input type="radio" class="mail" id="s1" name="categoryNum" value="1" name="categoryNum" data-radio="1"/>
                                            <label for="mail">연차</label>
                                            <input type="radio" class="mail" id="s2" name="categoryNum" checked disabled value="2" name="categoryNum" data-radio="2"/>
                                            <label for="mail">월차</label>
                                            <input type="radio" class="mail" id="s3" name="categoryNum" value="3" name="categoryNum" data-radio="3"/>
                                            <label for="mail">병가</label>
                                            <input type="radio" class="mail" id="s4" name="categoryNum" value="4" name="categoryNum" data-radio="4"/>
                                            <label for="mail">반차</label>
                                            <input type="radio" class="mail" id="s5" name="categoryNum" value="5" name="categoryNum" data-radio="5"/>
                                            <label for="mail">기타</label>
                                            </c:when>
                                            <c:when test="${reportVacaVO.categoryNum eq 3}">
                                            <input type="radio" class="mail" id="s1" name="categoryNum" value="1" name="categoryNum" data-radio="1"/>
                                            <label for="mail">연차</label>
                                            <input type="radio" class="mail" id="s2" name="categoryNum" value="2" name="categoryNum" data-radio="2"/>
                                            <label for="mail">월차</label>
                                            <input type="radio" class="mail" id="s3" name="categoryNum" checked disabled value="3" name="categoryNum" data-radio="3"/>
                                            <label for="mail">병가</label>
                                            <input type="radio" class="mail" id="s4" name="categoryNum" value="4" name="categoryNum" data-radio="4"/>
                                            <label for="mail">반차</label>
                                            <input type="radio" class="mail" id="s5" name="categoryNum" value="5" name="categoryNum" data-radio="5"/>
                                            <label for="mail">기타</label>
                                            </c:when>
                                            <c:when test="${reportVacaVO.categoryNum eq 4}">
                                            <input type="radio" class="mail" id="s1" name="categoryNum" value="1" name="categoryNum" data-radio="1"/>
                                            <label for="mail">연차</label>
                                            <input type="radio" class="mail" id="s2" name="categoryNum" value="2" name="categoryNum" data-radio="2"/>
                                            <label for="mail">월차</label>
                                            <input type="radio" class="mail" id="s3" name="categoryNum" value="3" name="categoryNum" data-radio="3"/>
                                            <label for="mail">병가</label>
                                            <input type="radio" class="mail" id="s4" name="categoryNum" checked disabled value="4" name="categoryNum" data-radio="4"/>
                                            <label for="mail">반차</label>
                                            <input type="radio" class="mail" id="s5" name="categoryNum" value="5" name="categoryNum" data-radio="5"/>
                                            <label for="mail">기타</label>
                                            </c:when>
                                            <c:when test="${reportVacaVO.categoryNum eq 5}">
                                            <input type="radio" class="mail" id="s1" name="categoryNum" value="1" name="categoryNum" data-radio="1"/>
                                            <label for="mail">연차</label>
                                            <input type="radio" class="mail" id="s2" name="categoryNum" value="2" name="categoryNum" data-radio="2"/>
                                            <label for="mail">월차</label>
                                            <input type="radio" class="mail" id="s3" name="categoryNum" value="3" name="categoryNum" data-radio="3"/>
                                            <label for="mail">병가</label>
                                            <input type="radio" class="mail" id="s4" name="categoryNum" value="4" name="categoryNum" data-radio="4"/>
                                            <label for="mail">반차</label>
                                            <input type="radio" class="mail" id="s5" name="categoryNum" checked disabled value="5" name="categoryNum" data-radio="5"/>
                                            <label for="mail">기타</label>
                                            </c:when>
                                            </c:choose>
                                        </div>
                                    </div>   
                            </div>
                        </div>
                        <div style="width: 900px; height: 100px; border-bottom: solid 1px black;">
                            <div id="bc" style="text-align: left; font-weight: bold; font-size: 20px; padding-left: 70px; padding-top: 34px; letter-spacing: 70px;">
                                사유
                                <div style=" margin-left: 180px; width: 650px; height: 100px; margin-top: -64px;">
                                    <input type="text" readonly style="border: 0; text-align: center; width: 645px; height: 97px;" value="${reportVacaVO.text}">
                                    <span id="textAreaHelp"></span>
                                </div>
                            </div>    
                        </div>

                        <div style="width: 900px; height: 100px; border-bottom: solid 1px black;">
                            <div id="bc" style="text-align: left; font-weight: bold; font-size: 20px; padding-left: 70px; padding-top: 34px; letter-spacing: 70px;">
                                기간
                                <div style="margin-left: 150px; width: 650px; height: 100px; margin-top: -64px; letter-spacing: 25px;">
                                    <div class="d-flex" style="font-weight: bold; margin-left: 90px; margin-top: 35px; font-size: 15px;">
                                        <!-- 아래 시작 날 ~ 끝 날이 뺄셈을 해서 몇일이 나오는지 값을 담아줌 -->
                                        <!-- <input type="hidden" id="dayGap" name="period"/>
                                        <input type="datetime-local" id="y1" style="width: 60px; border:0 solid black; text-align:right" value="2022"/>
                                        <div>년</div>
                                        <input type="number" id="m1" style="width: 40px; border:0 solid black; text-align:right" value="12"/>
                                        <div>월</div>
                                        <input type="number" id="d1" style="width: 40px; border:0 solid black; text-align:right" value="14"/>
                                        <div>일</div>
                                        ~
                                        <input type="number" id="y2" style="width: 60px; border:0 solid black; text-align:right" value="2022"/>
                                        <div>년</div>
                                        <input type="number" id="m2" style="width: 40px; border:0 solid black; text-align:right" value="12"/>
                                        <div>월</div>
                                        <input type="number" id="d2" style="width: 40px; border:0 solid black; text-align:right" value="30"/>
                                        <div>일</div> -->

                                        <input  id="start" type="datetime-local" name="startDate" readonly value="${reportVacaVO.startDate}">
                                            <div>~</div>
                                        <input id="stop" type="datetime-local" name="endDate" readonly value="${reportVacaVO.endDate}">


                                    </div>
                                </div>
                            </div>
                        </div>

                        <div style="width: 900px; height: 100px; border-bottom: solid 1px black;">
                            <div id="bc" style="text-align: left; font-weight: bold; font-size: 20px; padding-left: 45px; padding-top: 34px; letter-spacing: 15px;">
                                비상연락망
                                <div style="margin-left: 205px; width: 650px; height: 100px; margin-top: -64px;">
                                    <input id="callInput" class="callHelp" type="text" name="call" readonly value="${reportVacaVO.call}" style="border: 0; width: 645px; height: 97px;  text-align:center"/>
                                </div>
                            </div>
                        </div>
                        <div style=" width: 900px; height: 200px;">
                            <div style="font-weight: bold; margin-top: 35px;">
                                위와 같이 휴가를 신청하오니 허락하여 주시기 바랍니다.
                            </div>
                            <div class="d-flex" style="font-weight: bold; margin-left: 240px; margin-top: 35px;">
                                <input type="hidden"  id="dateParse" value="${year}/${month}/${day}">
                                <div><input type="number" id="y3" style="width: 100px; border:0 solid black; text-align:right" readonly value="${year}"/>년</div>
                                <div><input type="number" id="m3" style="width: 100px; border:0 solid black; text-align:right" readonly value="${month}"/>월</div>
                                <div><input type="number" id="d3" style="width: 100px; border:0 solid black; text-align:right" value="${day}"/>일</div>
                            </div>
                            <div style="font-weight: bold; margin-top: 20px; margin-left: 150px;">
                                신청자 : <input type="text" value="${reportVacaVO.name}" readonly style="border:0 solid black"/>
                            </div>
                        </div>
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

	<!-- Scroll Top, Logout Modal import -->
	<c:import url="../temp/layout_top_logoutModal.jsp"></c:import>
</body>
</html>