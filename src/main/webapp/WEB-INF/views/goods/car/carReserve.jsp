<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- meta tag 추가 -->
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Insert title here</title>
<!-- 공통 css, js, jquery -->
<c:import url="../../temp/layout_header.jsp"></c:import>

<!-- 차량 예약 JS -->
<script defer src="/js/room/reserve.js"></script>
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
					<section class="container d-flex flex-wrap justify-content-center">
						<!-- Page Heading -->
						
						<form action="carReserve" method="POST" id="frm">
							<h1 class="h3 mb-4 text-gray-800" style="text-align: center;">차량 예약</h1>
								<table class="table table-hover justify-content-right mb-5" style="text-align: center;">
									<tr>
										<th>차량번호</th>
										<td>${goods.carnum}</td>
										<th>모델명</th>
										<td>${goods.name}</td>									
										<th>정원</th>
										<td>${goods.max}명</td>													
									</tr>
								</table>
								


						<input type="hidden" name="goodsId" value="${goods.goodsId}">
                     	<c:forEach items="${timeNotEqual }" var="t">
	                        <div class="timeCheck">
	                           <input type="hidden" value="${t.startTime }" class="startTimeCheck">
	                           <input type="hidden" value="${t.endTime }" class="endTimeCheck">
	                        </div>
                     	</c:forEach>
                     	
						<div class="mb-3">
                           <label>예약날짜</label>
                           <input type="datetime-local" name="startTime" class="form-control" id="exampleFormControlInput1" >
                          	<p id="startText" style="color: red; display: none;">필수 작성 조건입니다.</p> <br>
						</div>
                        
                        <div class="mb-5">
                           <label>반납날짜</label>
                           <input type="datetime-local" name="endTime" class="form-control" id="exampleFormControlInput2">
                           <p id="startText" style="color: red; display: none;">필수 작성 조건입니다.</p>
                        </div> 
                        
                        <div class="mb-5">
                           <label>사원이름</label>
                           <input type="hidden" name="id" class="form-control" readonly="readonly" id="exampleFormControlInput1" value="${userInfo.id}">
                           <input type="text" class="form-control" readonly="readonly" id="exampleFormControlInput1" value="${userInfo.name}">
                        </div>
                        
                        <div class="mb-5">
                           <label>부서명</label>
                           <c:choose>
                           <c:when test="${userInfo.departmentVO.depNum == 1}"><input type="text" class="form-control" id="exampleFormControlInput1" readonly="readonly" value="영업팀"></c:when>
                           <c:when test="${userInfo.departmentVO.depNum == 2}"><input type="text" class="form-control" id="exampleFormControlInput1" readonly="readonly" value="총무팀"></c:when>
                           <c:when test="${userInfo.departmentVO.depNum == 3}"><input type="text" class="form-control" id="exampleFormControlInput1" readonly="readonly" value="인사팀"></c:when>
                           <c:when test="${userInfo.departmentVO.depNum == 4}"><input type="text" class="form-control" id="exampleFormControlInput1" readonly="readonly" value="IT개발팀"></c:when>
                           <c:when test="${userInfo.departmentVO.depNum == 5}"><input type="text" class="form-control" id="exampleFormControlInput1" readonly="readonly" value="생산팀"></c:when>
                           </c:choose>
                        </div>   
                                                                                                   
                        <div class="mb-5">
                          <label>사용 목적</label>
                          <input type="text" name="usePurpose" class="form-control" id="purpose">
                          <p id="purposeText" style="color: red; display: none;">필수 작성 조건입니다.</p>
                        </div>
                        
                        <div class="text-center mb-3">
	                        <button type="submit" id="resBtn" class="btn" style="background-color: #4e73df; color: white;">예약하기</button>
	                        <a href="../car/carList" class="btn" style="background-color: #4e73df; color: white;">뒤로가기</a>
                        </div>
                     </form>
               </section>


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
<script type="text/javascript">

document.getElementById('startTime').value= new Date().toISOString().slice(0, 8);
document.getElementById('endTime').value= new Date().toISOString().slice(0, 8);
</script>
</body>
</html>
								