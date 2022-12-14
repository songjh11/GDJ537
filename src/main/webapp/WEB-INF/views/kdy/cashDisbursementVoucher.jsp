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
    <script defer src="/js/kdy/dafas.js"></script>
<c:import url="../temp/layout_header.jsp"></c:import>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
    <title>Document</title>
    <script defer src="/js/kdy/totalPrice.js"></script>
        <style>
        #ajaaja{
            border-right: solid 1px black;
             height: 90px;
              width: 122px;
              margin-top: 6px;
        }
        .plus{
            text-align: center;
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
		
		<form action="/report/addpay" method="post" id="frm">
	            <input style="display: none;" value="${vo.id}" name="id">
                 <input style="display: none;" value="${vo.depNum}" name="depNum">
                 <input style="display: none;" value="3" name="reportNum">
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
                        
                        <div style="width: 235px; height: 55px; border-right: solid 1px black;">
                            <div style=" font-size:  16px; padding-top: 15px; font-weight: bolder;  ">
                                지출 제목
                            </div>
                        </div>

                        <input style="margin-left: 2px; width: 210px; height: 50px; border: 0; text-align: center;" value="" class="check" name="title"/>

                        <div style="width: 235px; height: 55px; border-right: solid 1px black; border-left: solid 1px black;">
                            <div style=" font-size:  16px; padding-top: 15px; font-weight: bolder;  ">
                                작성 일자
                            </div>
                        </div>

                        <input style="margin-left: 2px; width: 210px; height: 50px; border: 0; text-align: center;" readonly value="${year}-${month}-${day}" class="check" name="date"/>

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
    
                            <input style="margin-left: 2px; width: 210px; height: 50px; border: 0; text-align: center;" value="" class="check" name="cdate"/>
    
                            <div style="width: 235px; height: 55px; border-right: solid 1px black; border-left: solid 1px black;">
                                <div style=" font-size:  16px; padding-top: 15px; font-weight: bolder;  ">
                                    부서 / 담당
                                </div>
                            </div>
    
                            <input style="margin-left: 2px; width: 210px; height: 50px; border: 0; text-align: center;" class="check" readonly value="${vo.departmentVO.depName}" name="depName"/>
    
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
                    <div style="border-bottom: solid 1px black; height: 42px; margin-left: 160px; width: 738px;">
                        <div style="border-right: solid 1px black; width: 366px; height: 42px; font-weight: bold; padding-top: 12px;">
                            <input type="text" style="border: 0; width: 360px; height: 35px; margin-top: -40px;" name="repriceVOs[0].item">
                        </div>
                        <div style="border-right: solid 1px black; width: 179px; margin-left: 366px; height: 42px; margin-top: -42px;">
                            <input class="plus" type="number" style="border: 0; width: 173px; height: 35px; margin-top: 5px;" name="repriceVOs[0].price">
                        </div>
                    </div>
                    <div style="border-bottom: solid 1px black; height: 42px; margin-left: 160px; width: 738px;">
                        <div style="border-right: solid 1px black; width: 366px; height: 42px; font-weight: bold; padding-top: 12px;">
                            <input type="text" style="border: 0; width: 360px; height: 35px; margin-top: -40px;" name="repriceVOs[1].item">
                        </div>
                        <div style="border-right: solid 1px black; width: 179px; margin-left: 366px; height: 42px; margin-top: -42px;">
                            <input class="plus" type="number" style="border: 0; width: 173px; height: 35px; margin-top: 5px;" name="repriceVOs[1].price">
                        </div>
                    </div>
                    <div style="border-bottom: solid 1px black; height: 42px; margin-left: 160px; width: 738px;">
                        <div style="border-right: solid 1px black; width: 366px; height: 42px; font-weight: bold; padding-top: 12px;">
                            <input type="text" style="border: 0; width: 360px; height: 35px; margin-top: -40px;" name="repriceVOs[2].item">
                        </div>
                        <div style="border-right: solid 1px black; width: 179px; margin-left: 366px; height: 42px; margin-top: -42px;">
                            <input class="plus" type="number" style="border: 0; width: 173px; height: 35px; margin-top: 5px;" name="repriceVOs[2].price">
                        </div>
                    </div>
                    <div style="border-bottom: solid 1px black; height: 42px; margin-left: 160px; width: 738px;">
                        <div style="border-right: solid 1px black; width: 366px; height: 42px; font-weight: bold; padding-top: 12px;">
                            <input type="text" style="border: 0; width: 360px; height: 35px; margin-top: -40px;" name="repriceVOs[3].item">
                        </div>
                        <div style="border-right: solid 1px black; width: 179px; margin-left: 366px; height: 42px; margin-top: -42px;">
                            <input class="plus" type="number" style="border: 0; width: 173px; height: 35px; margin-top: 5px;" name="repriceVOs[3].price">
                        </div>
                    </div>
                    <div style="border-bottom: solid 1px black; height: 42px; margin-left: 160px; width: 738px;">
                        <div style="border-right: solid 1px black; width: 366px; height: 42px; font-weight: bold; padding-top: 12px;">
                            <input type="text" style="border: 0; width: 360px; height: 35px; margin-top: -40px;" name="repriceVOs[4].item">
                        </div>
                        <div style="border-right: solid 1px black; width: 179px; margin-left: 366px; height: 42px; margin-top: -42px;">
                            <input class="plus" type="number" style="border: 0; width: 173px; height: 35px; margin-top: 5px;" name="repriceVOs[4].price">
                        </div>
                    </div>
                    <div style="border-bottom: solid 1px black; height: 42px; margin-left: 160px; width: 738px;">
                        <div style="border-right: solid 1px black; width: 366px; height: 42px; font-weight: bold; padding-top: 12px;">
                            <input type="text" style="border: 0; width: 360px; height: 35px; margin-top: -40px;" name="repriceVOs[5].item">
                        </div>
                        <div style="border-right: solid 1px black; width: 179px; margin-left: 366px; height: 42px; margin-top: -42px;">
                            <input class="plus" type="number" style="border: 0; width: 173px; height: 35px; margin-top: 5px;" name="repriceVOs[5].price">
                        </div>
                    </div>
                    <div style="border-bottom: solid 1px black; height: 42px; margin-left: 160px; width: 738px;">
                        <div style="border-right: solid 1px black; width: 366px; height: 42px; font-weight: bold; padding-top: 12px;">
                            <input type="text" style="border: 0; width: 360px; height: 35px; margin-top: -40px;" name="repriceVOs[6].item">
                        </div>
                        <div style="border-right: solid 1px black; width: 179px; margin-left: 366px; height: 42px; margin-top: -42px;">
                            <input class="plus" type="number" style="border: 0; width: 173px; height: 35px; margin-top: 5px;" name="repriceVOs[6].price">
                        </div>
                    </div>
                    <div style="border-bottom: solid 1px black; height: 42px; margin-left: 160px; width: 738px;">
                        <div style="border-right: solid 1px black; width: 366px; height: 42px; font-weight: bold; padding-top: 12px;">
                            <input type="text" style="border: 0; width: 360px; height: 35px; margin-top: -40px;" name="repriceVOs[7].item">
                        </div>
                        <div style="border-right: solid 1px black; width: 179px; margin-left: 366px; height: 42px; margin-top: -42px;">
                            <input class="plus" type="number" style="border: 0; width: 173px; height: 35px; margin-top: 5px;" name="repriceVOs[7].price">
                        </div>
                    </div>
                    <div style="border-bottom: solid 1px black; height: 42px; margin-left: 160px; width: 738px;">
                        <div style="border-right: solid 1px black; width: 366px; height: 42px; font-weight: bold; padding-top: 12px;">
                            <input type="text" style="border: 0; width: 360px; height: 35px; margin-top: -40px;" name="repriceVOs[8].item">
                        </div>
                        <div style="border-right: solid 1px black; width: 179px; margin-left: 366px; height: 42px; margin-top: -42px;">
                            <input class="plus" type="number" style="border: 0; width: 173px; height: 35px; margin-top: 5px;" name="repriceVOs[8].price">
                        </div>
                    </div>
                    <div style="border-bottom: solid 1px black; height: 42px; margin-left: 160px; width: 738px;">
                        <div style="border-right: solid 1px black; width: 366px; height: 42px; font-weight: bold; padding-top: 12px;">
                            <input type="text" style="border: 0; width: 360px; height: 35px; margin-top: -40px;" name="repriceVOs[9].item">
                        </div>
                        <div style="border-right: solid 1px black; width: 179px; margin-left: 366px; height: 42px; margin-top: -42px;">
                            <input class="plus" type="number" style="border: 0; width: 173px; height: 35px; margin-top: 5px;" name="repriceVOs[9].price">
                        </div>
                    </div>
                    <div style="border-bottom: solid 1px black; height: 42px; margin-left: 160px; width: 738px;">
                        <div style="border-right: solid 1px black; width: 366px; height: 42px; font-weight: bold; padding-top: 12px;">
                            <input type="text" style="border: 0; width: 360px; height: 35px; margin-top: -40px;" name="repriceVOs[10].item">
                        </div>
                        <div style="border-right: solid 1px black; width: 179px; margin-left: 366px; height: 42px; margin-top: -42px;">
                            <input class="plus" type="number" style="border: 0; width: 173px; height: 35px; margin-top: 5px;" name="repriceVOs[10].price">
                        </div>
                    </div>
                    <div style="border-bottom: solid 1px black; height: 42px; margin-left: 160px; width: 738px;">
                        <div style="border-right: solid 1px black; width: 366px; height: 42px; font-weight: bold; padding-top: 12px;">
                            <input type="text" style="border: 0; width: 360px; height: 35px; margin-top: -40px;" name="repriceVOs[11].item">
                        </div>
                        <div style="border-right: solid 1px black; width: 179px; margin-left: 366px; height: 42px; margin-top: -42px;">
                            <input class="plus" type="number" style="border: 0; width: 173px; height: 35px; margin-top: 5px;" name="repriceVOs[11].price">
                        </div>
                    </div>
                    <div style="border-bottom: solid 1px black; height: 42px; margin-left: 160px; width: 738px;">
                        <div style="border-right: solid 1px black; width: 366px; height: 42px; font-weight: bold; padding-top: 12px;">
                            <input type="text" style="border: 0; width: 360px; height: 35px; margin-top: -40px;" name="repriceVOs[12].item">
                        </div>
                        <div style="border-right: solid 1px black; width: 179px; margin-left: 366px; height: 42px; margin-top: -42px;">
                            <input class="plus" type="number" style="border: 0; width: 173px; height: 35px; margin-top: 5px;" name="repriceVOs[12].price">
                        </div>
                    </div>
                    <div style="border-bottom: solid 1px black; height: 42px; margin-left: 160px; width: 738px;">
                        <div style="border-right: solid 1px black; width: 366px; height: 42px; font-weight: bold; padding-top: 12px;">
                            <input type="text" style="border: 0; width: 360px; height: 35px; margin-top: -40px;" name="repriceVOs[13].item">
                        </div>
                        <div style="border-right: solid 1px black; width: 179px; margin-left: 366px; height: 42px; margin-top: -42px;">
                            <input class="plus" type="number" style="border: 0; width: 173px; height: 35px; margin-top: 5px;" name="repriceVOs[3].price">
                        </div>
                    </div>
                    <div style="border-bottom: solid 1px black; height: 42px; margin-left: 160px; width: 738px;">
                        <div style="border-right: solid 1px black; width: 366px; height: 42px; font-weight: bold; padding-top: 12px;">
                            <input type="text" style="border: 0; width: 360px; height: 35px; margin-top: -40px;" name="repriceVOs[14].item">
                        </div>
                        <div style="border-right: solid 1px black; width: 179px; margin-left: 366px; height: 42px; margin-top: -42px;">
                            <input class="plus" type="number" style="border: 0; width: 173px; height: 35px; margin-top: 5px;" name="repriceVOs[14].price">
                        </div>
                    </div>
                    <div style="border-bottom: solid 1px black; height: 42px; margin-left: 160px; width: 738px;">
                        <div style="border-right: solid 1px black; width: 366px; height: 42px; font-weight: bold; padding-top: 12px;">
                            <input type="text" style="border: 0; width: 360px; height: 35px; margin-top: -40px;" name="repriceVOs[15].item">
                        </div>
                        <div style="border-right: solid 1px black; width: 179px; margin-left: 366px; height: 42px; margin-top: -42px;">
                            <input class="plus" type="number" style="border: 0; width: 173px; height: 35px; margin-top: 5px;" name="repriceVOs[15].price">
                        </div>
                    </div>
                    <div style="border-bottom: solid 1px black; height: 42px; margin-left: 160px; width: 738px;">
                        <div style="border-right: solid 1px black; width: 366px; height: 42px; font-weight: bold; padding-top: 12px;">
                            <input type="text" style="border: 0; width: 360px; height: 35px; margin-top: -40px;" name="repriceVOs[16].item">
                        </div>
                        <div style="border-right: solid 1px black; width: 179px; margin-left: 366px; height: 42px; margin-top: -42px;">
                            <input class="plus" type="number" style="border: 0; width: 173px; height: 35px; margin-top: 5px;" name="repriceVOs[16].price">
                        </div>
                    </div>
                    <div style="border-bottom: solid 1px black; height: 42px; margin-left: 160px; width: 738px;">
                        <div style="border-right: solid 1px black; width: 366px; height: 42px; font-weight: bold; padding-top: 8px;">
                            합 계
                        </div>
                        <div style="border-right: solid 1px black; width: 179px; margin-left: 366px; height: 42px; margin-top: -42px;">
                            <input type="number" id="total" readonly style="font-weight: bold; border: 0; width: 173px; height: 35px; margin-top: 5px; text-align: right;" name="sum">
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
                            <input type="text" style="border: 0; width: 735px; height: 47px; text-align: center;" value="" id="account" name="payment"/>
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

    </div>
	            </div>
	            
	       <button type="button" onclick="checkAll()">제출</button>
	</form>
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