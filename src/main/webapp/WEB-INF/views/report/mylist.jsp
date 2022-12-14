<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <title>결재 목록</title>

    <!-- 공통 css, js, jquery -->
	<c:import url="../temp/layout_header.jsp"></c:import>

</head>
<body id="page-top">

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

                <!-- Begin Page Content -->
                <div class="container-fluid">

                    <!-- Page Heading -->
                    <h1 class="h3 mb-2 text-gray-800">결재 신청 목록</h1>
                    <p class="mb-4">
                    	<a href="./mylist?cat=2" class="btn btn-info btn-icon-split">
                            <span class="icon text-white-50">
                                  <i class="fas fa-info-circle"></i>
                              </span>
                            <span class="text">휴가신청서</span>
                         </a>
                         <a href="./mylist?cat=3" class="btn btn-info btn-icon-split">
                            <span class="icon text-white-50">
                                  <i class="fas fa-info-circle"></i>
                              </span>
                            <span class="text">업무보고서</span>
                         </a>
                         <a href="./mylist?cat=1" class="btn btn-info btn-icon-split">
                            <span class="icon text-white-50">
                                  <i class="fas fa-info-circle"></i>
                              </span>
                            <span class="text">지출결의서</span>
                         </a>
                         <a href="./mylist?cat=4" class="btn btn-info btn-icon-split">
                            <span class="icon text-white-50">
                                  <i class="fas fa-info-circle"></i>
                              </span>
                            <span class="text">시말서</span>
                         </a>
                
					
                    <!-- DataTales Example -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <c:choose>
                            	<c:when test="${cat eq '1'}">
                            		<h6 class="m-0 font-weight-bold text-primary">지출결의서</h6>
                        		</c:when>
                        		<c:when test="${cat eq '2'}">
                            		<h6 class="m-0 font-weight-bold text-primary">휴가신청서</h6>
                        		</c:when>
                        		<c:when test="${cat eq '3'}">
                            		<h6 class="m-0 font-weight-bold text-primary">업무보고서</h6>
                        		</c:when>
                        		<c:when test="${cat eq '4'}">
                            		<h6 class="m-0 font-weight-bold text-primary">시말서</h6>
                        		</c:when>
                        		<c:otherwise>
                        			<h6 class="m-0 font-weight-bold text-primary">휴가신청서</h6>
                        		</c:otherwise>
                        	</c:choose>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                    <c:choose>
                                    	<c:when test="${cat eq '1'}">
                                    		<thead>
		                                        <tr>
		                                            <th>제목</th>
		                                            <th>작성일자</th>
		                                            <th>결재일자</th>
		                                            <th>합계 금액</th>
		                                            <th colspan="4">승인상태</th>
		                                        </tr>
	                                        </thead>
                                            <tbody>
                                                <c:forEach items="${list}" var="vo">
                                                	<tr onclick="window.open('')">
                                                		<td>${vo.title}</td>
                                                		<td>${vo.date}</td>
                                                		<td>${vo.cdate}</td>
                                                		<td>${vo.sum}</td>
                                                		<c:choose>
	                                                		<c:when test="${vo.returns eq 1}">
		                                                		<c:choose>
		                                                			<c:when test="${vo.status eq 0}">
		                                                				<td>x</td>
		                                                				<td>x</td>
		                                                				<td>x</td>
		                                                				<td>반려</td>
		                                                			</c:when>
		                                                			<c:when test="${vo.status eq 1}">
		                                                				<td>o</td>
		                                                				<td>x</td>
		                                                				<td>x</td>
		                                                				<td>반려</td>
		                                                			</c:when>
		                                                			<c:when test="${vo.status eq 2}">
		                                                				<td>o</td>
		                                                				<td>o</td>
		                                                				<td>x</td>
		                                                				<td>반려</td>
		                                                			</c:when>
		                                                			<c:when test="${vo.status eq 3}">
		                                                				<td>o</td>
		                                                				<td>o</td>
		                                                				<td>o</td>
		                                                				<td>반려</td>
		                                                			</c:when>
		                                                		</c:choose>
		                                                	</c:when>
		                                                	<c:otherwise>
		                                                		<c:choose>
		                                                			<c:when test="${vo.status eq 0}">
		                                                				<td>x</td>
		                                                				<td>x</td>
		                                                				<td>x</td>
		                                                				<td>진행 중</td>
		                                                			</c:when>
		                                                			<c:when test="${vo.status eq 1}">
		                                                				<td>o</td>
		                                                				<td>x</td>
		                                                				<td>x</td>
		                                                				<td>진행 중</td>
		                                                			</c:when>
		                                                			<c:when test="${vo.status eq 2}">
		                                                				<td>o</td>
		                                                				<td>o</td>
		                                                				<td>x</td>
		                                                				<td>진행 중</td>
		                                                			</c:when>
		                                                			<c:when test="${vo.status eq 3}">
		                                                				<td>o</td>
		                                                				<td>o</td>
		                                                				<td>o</td>
		                                                				<td>최종 승인</td>
		                                                			</c:when>
		                                                		</c:choose>		                                                		
		                                                	</c:otherwise>
	                                                	</c:choose>
                                                	</tr>
                                                </c:forEach>
                                            </tbody>    
                                        </c:when>
                                        <c:when test="${cat eq '2'}">
                                        	<thead>
                                                <tr>
                                                    <th>휴가 종류</th>
                                                    <th>휴가 사유</th>
                                                    <th>휴가 기간</th>
                                                    <th>작성일자</th>
                                                    <th colspan="4">승인 상태</th> 
                                                </tr>
                                            </thead>
                                            <tbody>
												<c:forEach items="${list}" var="vo">
                                                	<tr>
                                                		<td>${vo.categoryName}</td>
                                                		<td>${vo.text}</td>
                                                		<td>${vo.period}</td>
                                                		<td>${vo.date}</td>
                                                		<c:choose>
	                                                		<c:when test="${vo.returns eq 1}">
		                                                		<c:choose>
		                                                			<c:when test="${vo.status eq 0}">
		                                                				<td>x</td>
		                                                				<td>x</td>
		                                                				<td>x</td>
		                                                				<td>반려</td>
		                                                			</c:when>
		                                                			<c:when test="${vo.status eq 1}">
		                                                				<td>o</td>
		                                                				<td>x</td>
		                                                				<td>x</td>
		                                                				<td>반려</td>
		                                                			</c:when>
		                                                			<c:when test="${vo.status eq 2}">
		                                                				<td>o</td>
		                                                				<td>o</td>
		                                                				<td>x</td>
		                                                				<td>반려</td>
		                                                			</c:when>
		                                                			<c:when test="${vo.status eq 3}">
		                                                				<td>o</td>
		                                                				<td>o</td>
		                                                				<td>o</td>
		                                                				<td>반려</td>
		                                                			</c:when>
		                                                		</c:choose>
		                                                	</c:when>
		                                                	<c:otherwise>
		                                                		<c:choose>
		                                                			<c:when test="${vo.status eq 0}">
		                                                				<td>x</td>
		                                                				<td>x</td>
		                                                				<td>x</td>
		                                                				<td>진행 중</td>
		                                                			</c:when>
		                                                			<c:when test="${vo.status eq 1}">
		                                                				<td>o</td>
		                                                				<td>x</td>
		                                                				<td>x</td>
		                                                				<td>진행 중</td>
		                                                			</c:when>
		                                                			<c:when test="${vo.status eq 2}">
		                                                				<td>o</td>
		                                                				<td>o</td>
		                                                				<td>x</td>
		                                                				<td>진행 중</td>
		                                                			</c:when>
		                                                			<c:when test="${vo.status eq 3}">
		                                                				<td>o</td>
		                                                				<td>o</td>
		                                                				<td>o</td>
		                                                				<td>최종 승인</td>
		                                                			</c:when>
		                                                		</c:choose>		                                                		
		                                                	</c:otherwise>
	                                                	</c:choose>
                                                	</tr>
                                                </c:forEach>
                                            </tbody>   
                                        </c:when>
                                        <c:when test="${cat eq '3'}">
                                        	<thead>
                                                <tr>
                                                    <th>금일 오전</th>
                                                    <th>금일 오후</th>
                                                    <th>작성 일자</th>
                                                    <th colspan="4">승인 상태</th> 
                                                </tr>
                                            </thead>
                                            <tbody>
												<c:forEach items="${list}" var="vo">
                                                	<tr>
                                                		<td>${vo.am}</td>
                                                		<td>${vo.pm}</td>
                                                		<td>${vo.date}</td>
                                                		<c:choose>
	                                                		<c:when test="${vo.returns eq 1}">
		                                                		<c:choose>
		                                                			<c:when test="${vo.status eq 0}">
		                                                				<td>x</td>
		                                                				<td>x</td>
		                                                				<td>x</td>
		                                                				<td>반려</td>
		                                                			</c:when>
		                                                			<c:when test="${vo.status eq 1}">
		                                                				<td>o</td>
		                                                				<td>x</td>
		                                                				<td>x</td>
		                                                				<td>반려</td>
		                                                			</c:when>
		                                                			<c:when test="${vo.status eq 2}">
		                                                				<td>o</td>
		                                                				<td>o</td>
		                                                				<td>x</td>
		                                                				<td>반려</td>
		                                                			</c:when>
		                                                			<c:when test="${vo.status eq 3}">
		                                                				<td>o</td>
		                                                				<td>o</td>
		                                                				<td>o</td>
		                                                				<td>반려</td>
		                                                			</c:when>
		                                                		</c:choose>
		                                                	</c:when>
		                                                	<c:otherwise>
		                                                		<c:choose>
		                                                			<c:when test="${vo.status eq 0}">
		                                                				<td>x</td>
		                                                				<td>x</td>
		                                                				<td>x</td>
		                                                				<td>진행 중</td>
		                                                			</c:when>
		                                                			<c:when test="${vo.status eq 1}">
		                                                				<td>o</td>
		                                                				<td>x</td>
		                                                				<td>x</td>
		                                                				<td>진행 중</td>
		                                                			</c:when>
		                                                			<c:when test="${vo.status eq 2}">
		                                                				<td>o</td>
		                                                				<td>o</td>
		                                                				<td>x</td>
		                                                				<td>진행 중</td>
		                                                			</c:when>
		                                                			<c:when test="${vo.status eq 3}">
		                                                				<td>o</td>
		                                                				<td>o</td>
		                                                				<td>o</td>
		                                                				<td>최종 승인</td>
		                                                			</c:when>
		                                                		</c:choose>		                                                		
		                                                	</c:otherwise>
	                                                	</c:choose>
                                                	</tr>
                                                </c:forEach>
                                            </tbody>
                                        </c:when>
                                        <c:when test="${cat eq '4'}">
                                        	<thead>
                                                <tr>
                                                    <th>위반 내용</th>
                                                    <th>신청자</th>
                                                    <th>작성일자</th>
                                                    <th colspan="4">승인 상태</th> 
                                                </tr>
                                            </thead>
                                            <tbody>
												<c:forEach items="${list}" var="vo">
                                                	<tr>
                                                		<td>${vo.text}</td>
                                                		<td>${vo.order}</td>
                                                		<td>${vo.date}</td>
                                                		<c:choose>
	                                                		<c:when test="${vo.returns eq 1}">
		                                                		<c:choose>
		                                                			<c:when test="${vo.status eq 0}">
		                                                				<td>x</td>
		                                                				<td>x</td>
		                                                				<td>x</td>
		                                                				<td>반려</td>
		                                                			</c:when>
		                                                			<c:when test="${vo.status eq 1}">
		                                                				<td>o</td>
		                                                				<td>x</td>
		                                                				<td>x</td>
		                                                				<td>반려</td>
		                                                			</c:when>
		                                                			<c:when test="${vo.status eq 2}">
		                                                				<td>o</td>
		                                                				<td>o</td>
		                                                				<td>x</td>
		                                                				<td>반려</td>
		                                                			</c:when>
		                                                			<c:when test="${vo.status eq 3}">
		                                                				<td>o</td>
		                                                				<td>o</td>
		                                                				<td>o</td>
		                                                				<td>반려</td>
		                                                			</c:when>
		                                                		</c:choose>
		                                                	</c:when>
		                                                	<c:otherwise>
		                                                		<c:choose>
		                                                			<c:when test="${vo.status eq 0}">
		                                                				<td>x</td>
		                                                				<td>x</td>
		                                                				<td>x</td>
		                                                				<td>진행 중</td>
		                                                			</c:when>
		                                                			<c:when test="${vo.status eq 1}">
		                                                				<td>o</td>
		                                                				<td>x</td>
		                                                				<td>x</td>
		                                                				<td>진행 중</td>
		                                                			</c:when>
		                                                			<c:when test="${vo.status eq 2}">
		                                                				<td>o</td>
		                                                				<td>o</td>
		                                                				<td>x</td>
		                                                				<td>진행 중</td>
		                                                			</c:when>
		                                                			<c:when test="${vo.status eq 3}">
		                                                				<td>o</td>
		                                                				<td>o</td>
		                                                				<td>o</td>
		                                                				<td>최종 승인</td>
		                                                			</c:when>
		                                                		</c:choose>		                                                		
		                                                	</c:otherwise>
	                                                	</c:choose>
                                                	</tr>
                                                </c:forEach>
                                            </tbody>
                                        </c:when>
                                        <c:otherwise>
                                        	<thead>
                                                <tr>
                                                    <th>휴가 종류</th>
                                                    <th>휴가 사유</th>
                                                    <th>휴가 기간</th>
                                                    <th>작성일자</th>
                                                    <th colspan="4">승인 상태</th> 
                                                </tr>
                                            </thead>
                                            <tbody>
												<c:forEach items="${list}" var="vo">
                                                	<tr>
                                                		<td>${vo.category}</td>
                                                		<td>${vo.text}</td>
                                                		<td>${vo.period}</td>
                                                		<td>${vo.date}</td>
                                                		<c:choose>
	                                                		<c:when test="${vo.returns eq 1}">
		                                                		<c:choose>
		                                                			<c:when test="${vo.status eq 0}">
		                                                				<td>x</td>
		                                                				<td>x</td>
		                                                				<td>x</td>
		                                                				<td>반려</td>
		                                                			</c:when>
		                                                			<c:when test="${vo.status eq 1}">
		                                                				<td>o</td>
		                                                				<td>x</td>
		                                                				<td>x</td>
		                                                				<td>반려</td>
		                                                			</c:when>
		                                                			<c:when test="${vo.status eq 2}">
		                                                				<td>o</td>
		                                                				<td>o</td>
		                                                				<td>x</td>
		                                                				<td>반려</td>
		                                                			</c:when>
		                                                			<c:when test="${vo.status eq 3}">
		                                                				<td>o</td>
		                                                				<td>o</td>
		                                                				<td>o</td>
		                                                				<td>반려</td>
		                                                			</c:when>
		                                                		</c:choose>
		                                                	</c:when>
		                                                	<c:otherwise>
		                                                		<c:choose>
		                                                			<c:when test="${vo.status eq 0}">
		                                                				<td>x</td>
		                                                				<td>x</td>
		                                                				<td>x</td>
		                                                				<td>진행 중</td>
		                                                			</c:when>
		                                                			<c:when test="${vo.status eq 1}">
		                                                				<td>o</td>
		                                                				<td>x</td>
		                                                				<td>x</td>
		                                                				<td>진행 중</td>
		                                                			</c:when>
		                                                			<c:when test="${vo.status eq 2}">
		                                                				<td>o</td>
		                                                				<td>o</td>
		                                                				<td>x</td>
		                                                				<td>진행 중</td>
		                                                			</c:when>
		                                                			<c:when test="${vo.status eq 3}">
		                                                				<td>o</td>
		                                                				<td>o</td>
		                                                				<td>o</td>
		                                                				<td>최종 승인</td>
		                                                			</c:when>
		                                                		</c:choose>		                                                		
		                                                	</c:otherwise>
	                                                	</c:choose>
                                                	</tr>
                                                </c:forEach>
                                            </tbody>
                                        </c:otherwise>
                                     </c:choose>   
                                    <!-- <tfoot>
                                        <tr>
                                            <th>Name</th>
                                            <th>Position</th>
                                            <th>Office</th>
                                            <th>Age</th>
                                            <th>Start date</th>
                                            <th>Salary</th>
                                        </tr>
                                    </tfoot> -->
                                </table>
                            </div>
                            	
                            	<c:choose>
                            		<c:when test="${cat eq 1}">                           		 
		                            	<nav aria-label="Page navigation example">
											<ul class="pagination justify-content-center">
												<li class="page-item ${pager.pre?'':'disabled'}">
													<a class="page-link" href="./mylist?cat=1&page=${pager.startNum-1}&kind=${pager.kind}">《</a>
												</li>
											<c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i">
												<li class="page-item">
													<a class="page-link" href="./mylist?cat=1&page=${i}&kind=${pager.kind}">${i}</a>
												</li>	
											</c:forEach>
												<li>
													<a class="page-link ${pager.next?'':'disabled'}" href="./mylist?cat=1&page=${pager.lastNum+1}&kind=${pager.kind}">》</a>
												</li>
											</ul>
										</nav>
									</c:when>
									<c:when test="${cat eq 2}">
										<nav aria-label="Page navigation example">
											<ul class="pagination justify-content-center">
												<li class="page-item ${pager.pre?'':'disabled'}">
													<a class="page-link" href="./mylist?cat=2&page=${pager.startNum-1}&kind=${pager.kind}">《</a>
												</li>
											<c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i">
												<li class="page-item">
													<a class="page-link" href="./mylist?cat=2&page=${i}&kind=${pager.kind}">${i}</a>
												</li>	
											</c:forEach>
												<li>
													<a class="page-link ${pager.next?'':'disabled'}" href="./mylist?cat=2&page=${pager.lastNum+1}&kind=${pager.kind}">》</a>
												</li>
											</ul>
										</nav>
									</c:when>
									<c:when test="${cat eq 3}">
										<nav aria-label="Page navigation example">
											<ul class="pagination justify-content-center">
												<li class="page-item ${pager.pre?'':'disabled'}">
													<a class="page-link" href="./mylist?cat=3&page=${pager.startNum-1}&kind=${pager.kind}">《</a>
												</li>
											<c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i">
												<li class="page-item">
													<a class="page-link" href="./mylist?cat=3&page=${i}&kind=${pager.kind}">${i}</a>
												</li>	
											</c:forEach>
												<li>
													<a class="page-link ${pager.next?'':'disabled'}" href="./mylist?cat=3&page=${pager.lastNum+1}&kind=${pager.kind}">》</a>
												</li>
											</ul>
										</nav>
									</c:when>
									<c:when test="${cat eq 4}">
										<nav aria-label="Page navigation example">
											<ul class="pagination justify-content-center">
												<li class="page-item ${pager.pre?'':'disabled'}">
													<a class="page-link" href="./mylist?cat=4&page=${pager.startNum-1}&kind=${pager.kind}">《</a>
												</li>
											<c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i">
												<li class="page-item">
													<a class="page-link" href="./mylist?cat=4&page=${i}&kind=${pager.kind}">${i}</a>
												</li>	
											</c:forEach>
												<li>
													<a class="page-link ${pager.next?'':'disabled'}" href="./mylist?cat=4&page=${pager.lastNum+1}&kind=${pager.kind}">》</a>
												</li>
											</ul>
										</nav>
									</c:when>
									<c:otherwise>
										<nav aria-label="Page navigation example">
											<ul class="pagination justify-content-center">
												<li class="page-item ${pager.pre?'':'disabled'}">
													<a class="page-link" href="./mylist?cat=2&page=${pager.startNum-1}&kind=${pager.kind}">《</a>
												</li>
											<c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i">
												<li class="page-item">
													<a class="page-link" href="./mylist?cat=2&page=${i}&kind=${pager.kind}">${i}</a>
												</li>	
											</c:forEach>
												<li>
													<a class="page-link ${pager.next?'':'disabled'}" href="./mylist?cat=2&page=${pager.lastNum+1}&kind=${pager.kind}">》</a>
												</li>
											</ul>
										</nav>
									</c:otherwise>
                            	</c:choose>
                        </div>
                    </div>

                </div>
                <!-- /.container-fluid -->

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