<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- meta tag 추가 -->
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Insert title here</title>
<!-- 공통 css, js, jquery -->
<c:import url="../temp/layout_header.jsp"></c:import>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
    <title>Document</title>
    <script defer src="/js/hjs/vacation.js"></script>
    <style>
        #bc{
            background-color ;
        }
        #ajaaja{
            border-right: solid 1px black;
             height: 90px;
              width: 122px;
              margin-top: 6px;
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
        <form action="/report/addvaca" method="post" id="vcaFrm">
	
			<sec:authentication property="Principal" var="user"/>


            <input type="hidden" name="id" value="${user.id}">
            <input type="hidden" name="depNum" value="${vo.depNum}">

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
                            <div class="col-sm my-3" style="align-items:center; display: flex; justify-content:center;" id="ajaaja"><img src="/img/report/sign.png" width="50px" height="50px"></div>
                            <div class="col-sm my-3" style="align-items:center; display: flex; justify-content:center;" id="ajaaja"><img src="/img/report/sign.png" width="50px" height="50px"></div>
                            <div style=" height: 90px; width: 122px; margin-top: 6px;"></div>
                            
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
                                    <textarea id="depNameArea" name="depName" readonly style="border: 0; text-align: center; width: 645px; height: 97px;">${vo.departmentVO.depName}</textarea>
                                    <!-- DEOARTMENT.DEPNAME = 부서번호 -->
                                </div>
                            </div>
                        </div>
                        <div style="width: 900px; height: 100px; border-bottom: solid 1px black;">
                            <div id="bc" style="text-align: left; font-weight: bold; font-size: 20px; padding-left: 70px; padding-top: 34px; letter-spacing: 70px;">
                                성명
                                <div style=" margin-left: 180px; width: 650px; height: 100px; margin-top: -64px;">
                                    <textarea id="nameArea" name="name" readonly value="NAME" style="border: 0; text-align: center; width: 645px; height: 97px;">${vo.name}</textarea>
                                    <!-- USER.NAME = 이름 -->
                                </div>
                            </div>
                            
                        </div>
                        <div style="width: 900px; height: 100px; border-bottom: solid 1px black;">
                            <div id="bc" style="text-align: left; font-weight: bold; font-size: 20px; padding-left: 70px; padding-top: 34px; letter-spacing: 70px;">
                                직위
                                <div style=" margin-left: 180px; width: 650px; height: 100px; margin-top: -64px;">
                                    <textarea id="roleNameArea" name="roleName" readonly value="ROLENAME" style="border: 0; text-align: center; width: 645px; height: 97px;">${vo.roleVO.roleName}</textarea>
                                    <!-- ROLE.ROELNAME = 직급이름  -->
                                </div>
                            </div>
                            
                        </div>
                        <div style="width: 900px; height: 100px; border-bottom: solid 1px black;">
                            <div  id="bc" style="text-align: left; font-weight: bold; font-size: 20px; padding-left: 70px; padding-top: 34px; letter-spacing: 70px;">
                                종류
                                    <div style="margin-left: 180px; width: 650px; height: 100px; margin-top: -64px;">
                                        <div style="margin-left: 29px; margin-top: 0px;">
                                            <input type="hidden" name="categoryNum" id="checkRadio"/>
                                            <input type="radio" class="mail" name="category" value="1" data-radio="1"/>
                                            <label for="mail">연차</label>
                                            <input type="radio" class="mail" name="category" value="2" data-radio="2"/>
                                            <label for="mail">월차</label>
                                            <input type="radio" class="mail" name="category" value="3" data-radio="3"/>
                                            <label for="mail">병가</label>
                                            <input type="radio" class="mail" name="category" value="4" data-radio="4"/>
                                            <label for="mail">반차</label>
                                            <input type="radio" class="mail" name="category" value="5" data-radio="5"/>
                                            <label for="mail">기타</label>
                                        </div>
                                    </div>   
                            </div>
                        </div>
                        <div style="width: 900px; height: 100px; border-bottom: solid 1px black;">
                            <div id="bc" style="text-align: left; font-weight: bold; font-size: 20px; padding-left: 70px; padding-top: 34px; letter-spacing: 70px;">
                                사유
                                <div style=" margin-left: 180px; width: 650px; height: 100px; margin-top: -64px;">
                                    <textarea id="textArea" name="text" value="text" style="border: 0; text-align: left; width: 645px; height: 97px;"></textarea>
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
                                        <input type="hidden" id="dayGap" name="period"/>
                                        <input type="number" id="y1" style="width: 60px; border:0 solid black; text-align:right" value="2022"/>
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
                                        <div>일</div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div style="width: 900px; height: 100px; border-bottom: solid 1px black;">
                            <div id="bc" style="text-align: left; font-weight: bold; font-size: 20px; padding-left: 45px; padding-top: 34px; letter-spacing: 15px;">
                                비상연락망
                                <div style="margin-left: 205px; width: 650px; height: 100px; margin-top: -64px;">
                                    <input id="callInput" class="callHelp" type="call" name="call" style="border: 0; width: 645px; height: 97px;  text-align:center"/>
                                </div>
                            </div>
                        </div>
                        <div style=" width: 900px; height: 200px;">
                            <div style="font-weight: bold; margin-top: 35px;">
                                위와 같이 휴가를 신청하오니 허락하여 주시기 바랍니다.
                            </div>
                            <div class="d-flex" style="font-weight: bold; margin-left: 240px; margin-top: 35px;">
                                <input type="hidden" name="date" id="dateParse">
                                <div><input type="number" id="y3" style="width: 100px; border:0 solid black; text-align:right" value="2022"/>년</div>
                                <div><input type="number" id="m3" style="width: 100px; border:0 solid black; text-align:right" value="12"/>월</div>
                                <div><input type="number" id="d3" style="width: 100px; border:0 solid black; text-align:right" value="31"/>일</div>
                            </div>
                            <div style="font-weight: bold; margin-top: 20px; margin-left: 150px;">
                                신청자 : <input type="text" name="id" value=${vo.name} readonly style="border:0 solid black"/>
                            </div>
                        </div>
                    </div>
            </div>
        </div>    
    </div>
</form>
        <button type="button" style="float: right;" onclick="allCheck()" class="btn btn-secondary" id="vcaBtn">제출</button>
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