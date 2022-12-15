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
		<c:choose>
			<c:when test="${vo.reportNum eq 1}">
            
	             <input type="text" style="display: none;" value="${result }" data-status="${result }">
    			 <input type="text" style="display: none;" value="${reportPayVO.applyNum }" data-num="${reportPayVO.applyNum }">
	            <div class="container-fluid">
						 <div class="container px-4 px-lg-5 my-5">
        <div style=" margin-left: 85px; margin-top: 45px; width: 1000px; height: 1300px; border: solid 1px black; text-align: center;">
            <div style="letter-spacing: 70px;margin-top: 45px; background-color: rgb(255, 255, 249); color: black; font-size: 35px; font-weight: bolder; vertical-align: top; margin-right: 380px;" >
                   지출결의서
                    <div style="border: solid 1px black; width: 400px; margin-left: 570px; height: 120px; margin-top: -65px;">
                        <div style="border-right: solid 1px black; width: 30px; height: 119px; font-size: 19px; padding-top: 30px; padding-left: 5px;">
                            결<br>
                            재
                        </div>
                        <div class="row" style="border-bottom: solid 1px black; margin-top: -120px; width: 368px; margin-left: 30px; height: 30px; font-size: 15px;">
                            <div style="padding-top:3px; letter-spacing: 0; margin-left: 5px;">팀장&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;최종
                                                                                              &ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;비고</div>
                            <c:choose>
                            	<c:when test="${reportPayVO.status == 2}">
                            		<div id="ajaaja"></div>
                            
                            	</c:when>
                            	<c:when test="${reportPayVO.status == 3}">
                            		<div id="ajaaja"></div>
                            		<div id="ajaaja"></div>
                           
                            	</c:when>
                            	<c:otherwise>
                            	
                            	</c:otherwise>
                            </c:choose>
                            <div style=" height: 90px; width: 122px; margin-top: 6px;"></div>
                            
                        </div>
                    </div>
            </div>
            <hr >

            <div  style="border: solid 1px black; margin-top: 25px; margin-left: 45px; width: 900px; height: 110px; ">
                <div style="height: 55px; border-bottom: solid 1px black;">
                    <div class="d-flex">
                        
                        <div style="width: 235px; height: 55px; border-right: solid 1px black;">
                            <div style=" font-size:  16px; padding-top: 15px; font-weight: bolder;  ">
                                지출 제목
                            </div>
                        </div>

                        <input style="margin-left: 2px; width: 210px; height: 50px; border: 0; text-align: center;" readonly="readonly" value="${reportPayVO.title }" id="title" name="title"/>

                        <div style="width: 235px; height: 55px; border-right: solid 1px black; border-left: solid 1px black;">
                            <div style=" font-size:  16px; padding-top: 15px; font-weight: bolder;  ">
                                작성 일자
                            </div>
                        </div>

                        <input style="margin-left: 2px; width: 210px; height: 50px; border: 0; text-align: center;" readonly value="${year}-${month}-${day}" name="date"/>

                    </div>    
                </div> 
                <div style="height: 55px;">
                    <div class="d-flex">
                        <div class="d-flex">
                        
                            <div style="width: 235px; height: 55px; border-right: solid 1px black;">
                                <div style=" font-size:  16px; padding-top: 15px; font-weight: bolder;  ">
                                    결제 일자
                                </div>
                            </div>
    
                            <input style="margin-left: 2px; width: 210px; height: 50px; border: 0; text-align: center;" readonly="readonly" value="${reportPayVO.cdate }" id="cdate" name="cdate"/>
    
                            <div style="width: 235px; height: 55px; border-right: solid 1px black; border-left: solid 1px black;">
                                <div style=" font-size:  16px; padding-top: 15px; font-weight: bolder;  ">
                                    부서 / 담당
                                </div>
                            </div>
    
                            <input style="margin-left: 2px; width: 210px; height: 50px; border: 0; text-align: center;" readonly value="${reportPayVO.depName}" name="depName"/>
    
                        </div> 
                    </div>    
                </div>    
            </div>

            <div style="margin-top: 20px; margin-left: 45px; width: 900px; height: 800px; border: solid 1px black;" >
                <div style="border-right: solid 1px black; height: 800px; width: 160px;">
                    <div style="padding-top: 450px; font-weight: bold;">
                        지 출<br>내 역
                    </div>    
                    <div class="d-flex" style="border-bottom: solid 1px black; width: 740px; margin-left: 158px; margin-top: -500px; height: 45px;">
                        <div style="border-right: solid 1px black; width: 368px; height: 45px; font-weight: bold; padding-top: 12px;">
                            항 목
                        </div>
                        
                        <div style="border-right: solid 1px black; width: 179px; font-weight: bold; padding-top: 12px;">
                            금액(원)
                        </div>
                        <div style="width: 179px; font-weight: bold; padding-top: 12px;">
                            비 고
                        </div>
                    </div>
                    <c:forEach items="${rePriceVOs }" var="rePriceVOs">
                    
                    <div style="border-bottom: solid 1px black; height: 42px; margin-left: 160px; width: 738px;">
                        <div style="border-right: solid 1px black; width: 366px; height: 42px; font-weight: bold; padding-top: 12px;">
                            <input type="text" style="border: 0; width: 360px; height: 35px; margin-top: -40px;" readonly="readonly" value="${rePriceVOs.item }" name="repriceVOs[0].item">
                        </div>
                        <div style="border-right: solid 1px black; width: 179px; margin-left: 366px; height: 42px; margin-top: -42px;">
                            <input class="plus" type="number" style="border: 0; width: 173px; height: 35px; margin-top: 5px;" readonly="readonly" value="${rePriceVOs.price }" name="repriceVOs[0].price">
                        </div>
                    </div>
                    </c:forEach>
                    <div style="border-bottom: solid 1px black; height: 42px; margin-left: 160px; width: 738px;">
                        <div style="border-right: solid 1px black; width: 366px; height: 42px; font-weight: bold; padding-top: 8px;">
                            합 계
                        </div>
                        <div style="border-right: solid 1px black; width: 179px; margin-left: 366px; height: 42px; margin-top: -42px;">
                            <input type="number" id="total" readonly style="font-weight: bold; border: 0; width: 173px; height: 35px; margin-top: 5px; text-align: right;" value="${reportPayVO.sum }" name="sum">
                        </div>
                        <div style="width: 179px; margin-left: 550px; height: 42px; margin-top: -42px; text-align: left; font-weight: bold; padding-top: 7px;">
                            만(원)
                        </div>
                    </div>
                </div>

                <div style="border: solid 1px black; ">
                    <div style="font-weight: bold; border-right: solid 1px black; width: 160px; height: 48px;">
                        <div style="padding-top: 10px;">
                            입금 정보 
                        </div>
                        <div style=" width: 735px; height: 45px; margin-left: 160px; margin-top: -35px;">
                            <input type="text" style="border: 0; width: 735px; height: 47px; text-align: center;" readonly="readonly" value="${reportPayVO.payment }" id="account" name="payment"/>
                        </div>
                    </div>
                </div>
                <div style="text-align: center; font-weight: bold; margin-top: 25px;">
                    위 금액을 청구하오니 결재해 주시기 바랍니다.
                </div>
                <div class="d-flex" style="font-weight: bold; margin-left: 240px; margin-top: 25px;">
                    <div><input type="text" style="width: 100px; border:0 solid black; text-align:right" readonly value="${year}" />년</div>
                    <div><input type="text" style="width: 100px; border:0 solid black; text-align:right" readonly value="${month}"/>월</div>
                    <div><input type="text" style="width: 100px; border:0 solid black; text-align:right" readonly value="${day}"/>일</div>
                </div>
            </div>

        </div>    
		<button type="button" id="license" style="margin-left: 1025px; margin-top: 12px;" class="btn btn-primary">승인</button>
		<button type="button" id="returns" style="margin-left: 1025px; margin-top: 12px;" class="btn btn-danger">반려</button>
    </div>
	            </div>
	            
	            <!-- End Page Content -->    

           
		    </c:when>
		    <c:when test="${vo.reportNum eq 2}">
		    <input type="text" style="display: none;" value="${result }" data-status="${result }">
    			<input type="text" style="display: none;" value="${reportVacaVO.applyNum }" data-num="${reportVacaVO.applyNum }">
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
                            	<c:when test="${reportVacaVO.status == 2}">
                            		<div id="ajaaja"></div>
                            
                            	</c:when>
                            	<c:when test="${reportVacaVO.status == 3}">
                            		<div id="ajaaja"></div>
                            		<div id="ajaaja"></div>
                           
                            	</c:when>
                            	<c:otherwise>
                            	
                            	</c:otherwise>
                        </c:choose>
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
                                    <input id="depNameArea" name="depName" readonly style="border: 0; text-align: center; width: 645px; height: 97px;" value="${reportVacaVO.depName}">
                                    <!-- DEOARTMENT.DEPNAME = 부서번호 -->
                                </div>
                            </div>
                        </div>
                        <div style="width: 900px; height: 100px; border-bottom: solid 1px black;">
                            <div id="bc" style="text-align: left; font-weight: bold; font-size: 20px; padding-left: 70px; padding-top: 34px; letter-spacing: 70px;">
                                성명
                                <div style=" margin-left: 180px; width: 650px; height: 100px; margin-top: -64px;">
                                    <input id="nameArea" name="name" readonly value="${reportVacaVO.name }" style="border: 0; text-align: center; width: 645px; height: 97px;">
                                    <!-- USER.NAME = 이름 -->
                                </div>
                            </div>
                            
                        </div>
                        <div style="width: 900px; height: 100px; border-bottom: solid 1px black;">
                            <div id="bc" style="text-align: left; font-weight: bold; font-size: 20px; padding-left: 70px; padding-top: 34px; letter-spacing: 70px;">
                                직위
                                <div style=" margin-left: 180px; width: 650px; height: 100px; margin-top: -64px;">
                                    <input id="roleNameArea" name="roleName" readonly value="${reportVacaVO.roleName }" style="border: 0; text-align: center; width: 645px; height: 97px;">
                                    <!-- ROLE.ROELNAME = 직급이름  -->
                                </div>
                            </div>
                            
                        </div>
                        <div style="width: 900px; height: 100px; border-bottom: solid 1px black;">
                            <div  id="bc" style="text-align: left; font-weight: bold; font-size: 20px; padding-left: 70px; padding-top: 34px; letter-spacing: 70px;">
                                종류
                                    <div style="margin-left: 180px; width: 650px; height: 100px; margin-top: -64px;">
                                        <div style="margin-left: 29px; margin-top: 0px;">
                                            <!--<input type="hidden" name="categoryNum" id="checkRadio"/> --> 
                                            <c:choose>
                                            	<c:when test="${reportVacaVO.categoryNum == 1 }">
                                            		<input type="radio" class="mail" name="categoryNum" value="1" name="categoryNum" data-radio="1"/>
                                            		<label for="mail">연차</label>	
                                            	</c:when>
                                            	<c:when test="${reportVacaVO.categoryNum == 2 }">
                                           		    <input type="radio" class="mail" name="categoryNum" value="2" name="categoryNum" data-radio="2"/>
                                                    <label for="mail">월차</label>
                                            	</c:when>
                                            	<c:when test="${reportVacaVO.categoryNum == 3 }">
                                           		    <input type="radio" class="mail" name="categoryNum" value="3" name="categoryNum" data-radio="3"/>
                                                    <label for="mail">병가</label>
                                            	</c:when>
                                            	<c:when test="${reportVacaVO.categoryNum == 4 }">
                                           		    <input type="radio" class="mail" name="categoryNum" value="4" name="categoryNum" data-radio="4"/>
                                                    <label for="mail">반차</label>
                                            	</c:when>
                                            	<c:otherwise>
		                                            <input type="radio" class="mail" name="categoryNum" value="5" name="categoryNum" data-radio="5"/>
        		                                    <label for="mail">기타</label>
                                            	</c:otherwise>
                                            </c:choose>
                                        </div>
                                    </div>   
                            </div>
                        </div>
                        <div style="width: 900px; height: 100px; border-bottom: solid 1px black;">
                            <div id="bc" style="text-align: left; font-weight: bold; font-size: 20px; padding-left: 70px; padding-top: 34px; letter-spacing: 70px;">
                                사유
                                <div style=" margin-left: 180px; width: 650px; height: 100px; margin-top: -64px;">
                                    <input id="textArea" name="text" readonly="readonly" value="${reportVacaVO.text }" style="border: 0; text-align: left; width: 645px; height: 97px;">
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

                                        <input type="datetime-local" readonly="readonly" value="${reportVacaVO.startDate }" name="startDate" id="startInput">
                                            <div>~</div>
                                        <input type="datetime-local" readonly="readonly" value="${reportVacaVO.endDate }" name="endDate" id="endInput">


                                    </div>
                                </div>
                            </div>
                        </div>

                        <div style="width: 900px; height: 100px; border-bottom: solid 1px black;">
                            <div id="bc" style="text-align: left; font-weight: bold; font-size: 20px; padding-left: 45px; padding-top: 34px; letter-spacing: 15px;">
                                비상연락망
                                <div style="margin-left: 205px; width: 650px; height: 100px; margin-top: -64px;">
                                    <input id="callInput" class="callHelp" readonly="readonly" type="call" name="call" value="${reportVacaVO.phone}" style="border: 0; width: 645px; height: 97px;  text-align:center"/>
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



        <button type="button" id="license" class="btn btn-info btn-icon-split">승인</button>
		<button type="button" id="returns" class="btn btn-info btn-icon-split">반려</button>

	            </div>
	            <!-- End Page Content -->
		    
		    
		    </c:when>
		    <c:when test="${vo.reportNum eq 3}">
		    
		    <input type="text" style="display: none;" value="${result }" data-status="${result }">
    	<input type="text" style="display: none;" value="${reportWorkVO.applyNum }" data-num="${reportWorkVO.applyNum }">
		<div id="content-wrapper" class="d-flex flex-column">
			<!-- Main Content -->
			<div id="content">
			
				<!-- Topbar import-->
				<c:import url="../temp/layout_topbar.jsp"></c:import>
				<!-- End of Topbar -->
				
				<!-- Begin Page Content -->
                
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
                                            <input id="am" style=" width: 780px; height: 100px; text-align: left; border: 0; margin-top: 5px;" name="am" readonly="readonly" value="${reportWorkVO.am }">
                                        </div>
                                    </div>
                                    <div style="border-right: solid 1px black; width: 100px; height: 107px;">
                                        <div style="padding-top: 28px; font-weight: bold;">
                                            오<br>
                                            후
                                        </div>
                                        <div style=" margin-left: 100px; width: 800px; height: 107px; margin-top: -77px;">
                                            <input id="pm" style=" width: 780px; height: 100px; text-align: left; border: 0; margin-top: 5px;" name="pm" readonly="readonly" value="${reportWorkVO.pm }">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div style="height: 40px; border-bottom: solid 1px black; padding-top: 5px;">
                                    미처리내역 및 개선사항
                            </div>
                        <div style="height: 212px; border-bottom: solid 1px black;">
                            <input  style="width:895px; height: 209px; text-align: left; border: 0;" name="undo" readonly="readonly" value="${reportWorkVO.undo }">
                        </div>
                            <div style="height: 40px; border-bottom: solid 1px black; padding-top: 5px;">
                                내일 예정업무
                            </div>
                        <div style="height: 212px; border-bottom: solid 1px black;">
                            <input style="width:895px; height: 209px; text-align: left; border: 0;" name="todo" readonly="readonly" value="${reportWorkVO.todo }">
                        </div>
                            <div style="height: 40px; border-bottom: solid 1px black; padding-top: 5px;">
                                문제점 및 특이사항 보고
                            </div>
                        <div class="d-flex" style="height: 212px; border-bottom: solid 1px black; ">
                            <div style="border-right: solid 1px black; height: 212px; width: 450px;">
                                <input  style="border: 0; width: 445px; height: 212px; text-align: left;" name="wrong" readonly="readonly" value="${reportWorkVO.wrong }">
                            </div>
                            <div style=" height: 212px; width: 450px;">
                                <input  style="border: 0; width: 445px; height: 212px; text-align: left;" name="etc" readonly="readonly" value="${reportWorkVO.etc }">
                            </div>
                        </div>
                        
                   
                   <div>

                   </div>
            </div>

        </div>

    </div>
	            </div>
	            <!-- End Page Content -->
		    
		    
		    </c:when>
		    <c:when test="${vo.reportNum eq 4}">
		    
		     <input type="text" style="display: none;" value="${result }" data-status="${result }">
    			<input type="text" style="display: none;" value="${reportSorryVO.applyNum }" data-num="${reportSorryVO.applyNum }">
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
                        <c:choose>
                            	<c:when test="${reportSorryVO.status == 2}">
                            		<div id="ajaaja"></div>
                            
                            	</c:when>
                            	<c:when test="${reportSorryVO.status == 3}">
                            		<div id="ajaaja"></div>
                            		<div id="ajaaja"></div>
                           
                            	</c:when>
                            	<c:otherwise>
                            	
                            	</c:otherwise>
                        </c:choose>
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
                        <input style="width: 220px; height: 50px; border: 0; text-align: center;" name="name" id="ApologyName" readonly="readonly" value="${reportSorryVO.name}"/>

                        <div style="width: 225px; height: 55px; border-right: solid 1px black;  border-left: solid 1px black;">
                            <div style=" font-size:  16px; padding-top: 15px; font-weight: bolder; letter-spacing: 40px; padding-left: 50px;">
                                부서명
                            </div>
                        </div>
                        <input style="width: 220px; height: 50px; text-align: center; border: 0;" id="ApologyPartname" name="depName" readonly="readonly" value="${reportSorryVO.depName}"/>
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
                            <input style="width: 220px; height: 50px; border: 0; text-align: center;" id="ApologyRes" name="roleName" readonly="readonly" value="${reportSorryVO.roleName}"/>
    
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
                    <input style=" margin-left:180px; width: 895px; height: 595px; border: 0;" name="text" id="text" readonly="readonly" value="${reportSorryVO.text }">
                </div>
                <div style="font-weight: bold; text-align: center; margin-top: 25px;">
                    상기 기록사실에 허위가 없습니다.
                </div>
                <div style=" width: 900px; height: 250px;"> 
                    <div class="d-flex" style="font-weight: bold; margin-left: 240px; margin-top: 45px;">
                        <div><input type="text" style="width: 100px; border:0 solid black; text-align:right" id="ApologyY" readonly="readonly" value="${year}"/>년</div>
                        <div><input type="text" style="width: 100px; border:0 solid black; text-align:right" id="ApologyM" readonly="readonly" value="${month}"/>월</div>
                        <div><input type="text" style="width: 100px; border:0 solid black; text-align:right" id="ApologyD" readonly="readonly" value="${day}"/>일</div>
                    </div>
                    <div style="font-weight: bold; margin-top: 50px; margin-left: 150px;">
                        신청자 : <input type="text" value="${reportSorryVO.id}" name="order" style="border:0 solid black" id="ApologyWN" readonly="readonly"/>
                    </div>
                </div>
            </div>
        </div>    
        <button type="button" id="license" class="btn btn-info btn-icon-split">승인</button>
		<button type="button" id="returns" class="btn btn-info btn-icon-split">반려</button>

    </div>
	            </div>
	            <!-- End Page Content -->
		    
		    </c:when>
		</c:choose>
		
		</div>
            <!-- End of Main Content -->

            <!-- Footer -->
			<c:import url="../temp/layout_footer.jsp"></c:import>
            <!-- End of Footer -->

        </div>
        <!-- End of Content Wrapper -->

    </div>
    <!-- End of Page Wrapper -->

    <!-- Scroll to Top Button-->
 	<c:import url="../temp/layout_top_logoutModal.jsp"></c:import>
    <!-- Logout Modal-->
</body>
</html>