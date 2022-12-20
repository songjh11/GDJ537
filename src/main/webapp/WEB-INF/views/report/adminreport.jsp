
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <title>SB Admin 2 - Tables</title>

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
                    <p class="mb-4">
                    	<a href="./doreport?cat=1&kind=${pager.kind }" class="btn btn-info btn-icon-split">
                            <span class="icon text-white-50">
                                  <i class="fas fa-info-circle"></i>
                              </span>
                            <span class="text">휴가신청서</span>
                         </a>
                         <a href="./doreport?cat=2&kind=${pager.kind }" class="btn btn-info btn-icon-split">
                            <span class="icon text-white-50">
                                  <i class="fas fa-info-circle"></i>
                              </span>
                            <span class="text">업무보고서</span>
                         </a>
                         <a href="./doreport?cat=3&kind=${pager.kind }" class="btn btn-info btn-icon-split">
                            <span class="icon text-white-50">
                                  <i class="fas fa-info-circle"></i>
                              </span>
                            <span class="text">지출결의서</span>
                         </a>
                         <a href="./doreport?cat=4&kind=${pager.kind }" class="btn btn-info btn-icon-split">
                            <span class="icon text-white-50">
                                  <i class="fas fa-info-circle"></i>
                              </span>
                            <span class="text">시말서</span>
                         </a>

                    <!-- DataTales Example -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <c:choose>
                            	<c:when test="${cat eq 1}">
									<div class="container text-center">
										<div class="row">
											<div class="col">
											  <h4 class="m-0 font-weight-bold text-primary">휴가신청서</h4>
										  </div>
										  <div class="col">
											
										  </div>
										  <div class="col">
											  <select class="form-select" aria-label="Default select example" onchange="if(this.value) location.href=(this.value);">
												  <option value="./doreport?cat=1&kind=1" <c:if test="${pager.kind == '1'}">selected</c:if>>결제/승인 반려</option>
												  <option value="./doreport?cat=1&kind=2" <c:if test="${pager.kind == '2'}">selected</c:if>>승인 목록</option>
												  <option value="./doreport?cat=1&kind=3" <c:if test="${pager.kind == '3'}">selected</c:if>>반려 목록</option>
											  </select>
										  </div>
										</div>
									  </div>
                        		</c:when>
                        		<c:when test="${cat eq 2}">
                            		<div class="container text-center">
										<div class="row">
											<div class="col">
											  <h4 class="m-0 font-weight-bold text-primary">업무보고서</h4>
										  </div>
										  <div class="col">
											
										  </div>
										  <div class="col">
											  <select class="form-select" aria-label="Default select example" onchange="if(this.value) location.href=(this.value);">
												  <option value="./doreport?cat=2&kind=1" <c:if test="${pager.kind == '1'}">selected</c:if>>결제/승인 반려</option>
												  <option value="./doreport?cat=2&kind=2" <c:if test="${pager.kind == '2'}">selected</c:if>>승인 목록</option>
												  <option value="./doreport?cat=2&kind=3" <c:if test="${pager.kind == '3'}">selected</c:if>>반려 목록</option>
											  </select>
										  </div>
										</div>
									  </div>
                        		</c:when>
                        		<c:when test="${cat eq 3}">
                            		<div class="container text-center">
										<div class="row">
											<div class="col">
											  <h4 class="m-0 font-weight-bold text-primary">지출결의서</h4>
										  </div>
										  <div class="col">
											
										  </div>
										  <div class="col">
											  <select class="form-select" aria-label="Default select example" onchange="if(this.value) location.href=(this.value);">
												  <option value="./doreport?cat=3&kind=1" <c:if test="${pager.kind == '1'}">selected</c:if>>결제/승인 반려</option>
												  <option value="./doreport?cat=3&kind=2" <c:if test="${pager.kind == '2'}">selected</c:if>>승인 목록</option>
												  <option value="./doreport?cat=3&kind=3" <c:if test="${pager.kind == '3'}">selected</c:if>>반려 목록</option>
											  </select>
										  </div>
										</div>
									  </div>
                        		</c:when>
                        		<c:when test="${cat eq 4}">
                            		<div class="container text-center">
										<div class="row">
											<div class="col">
											  <h4 class="m-0 font-weight-bold text-primary">시말서</h4>
										  </div>
										  <div class="col">
											
										  </div>
										  <div class="col">
											  <select class="form-select" aria-label="Default select example" onchange="if(this.value) location.href=(this.value);">
												  <option value="./doreport?cat=4&kind=1" <c:if test="${pager.kind == '1'}">selected</c:if>>결제/승인 반려</option>
												  <option value="./doreport?cat=4&kind=2" <c:if test="${pager.kind == '2'}">selected</c:if>>승인 목록</option>
												  <option value="./doreport?cat=4&kind=3" <c:if test="${pager.kind == '3'}">selected</c:if>>반려 목록</option>
											  </select>
										  </div>
										</div>
									  </div>
                        		</c:when>
                        		<c:otherwise>
                        			<div class="container text-center">
										<div class="row">
											<div class="col">
											  <h4 class="m-0 font-weight-bold text-primary">휴가신청서</h4>
										  </div>
										  <div class="col">
											
										  </div>
										  <div class="col">
											  <select class="form-select" aria-label="Default select example" onchange="if(this.value) location.href=(this.value);">
												  <option value="./doreport?cat=1&kind=1" <c:if test="${pager.kind == '1'}">selected</c:if>>결제/승인 반려</option>
												  <option value="./doreport?cat=1&kind=2" <c:if test="${pager.kind == '2'}">selected</c:if>>승인 목록</option>
												  <option value="./doreport?cat=1&kind=3" <c:if test="${pager.kind == '3'}">selected</c:if>>반려 목록</option>
											  </select>
										  </div>
										</div>
									  </div>
                        		</c:otherwise>
                        	</c:choose>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                    <c:choose>
                                    	<c:when test="${cat eq 1}">
                                    		<thead>
		                                        <tr>
		                                            <th>보고서번호</th>
		                                            <th>사원번호</th>
		                                            <th>사원이름</th>
		                                            <th>부서명</th>
		                                            <th>신청일자</th>
		                                        </tr>
	                                        </thead>
                                            <tbody>
                                                <c:forEach items="${reportApplyVOs}" var="vo">
                                                	<tr>
                                                		<c:choose>
                                                			<c:when test="${pager.kind eq '1'}">
                                                				<td><a href="./vacadetail?applyNum=${vo.applyNum }&lstatus=${check}">${vo.applyNum}</a></td>
                                                			</c:when>
                                                			<c:otherwise>
                                                				<td>${vo.applyNum}</td>
                                                			</c:otherwise>
                                                		</c:choose>
                                                		<td>${vo.id}</td>
                                                		<td>${vo.name}</td>
                                                		<td>${vo.depName }</td>
                                                		<td>${vo.apDate }</td>
                                                	</tr>
                                                </c:forEach>
                                            </tbody>    
                                        </c:when>
                                        <c:when test="${cat eq 2}">
                                        	<thead>
                                                <tr>
                                                    <th>보고서번호</th>
		                                            <th>사원번호</th>
		                                            <th>사원이름</th>
		                                            <th>부서명</th>
		                                            <th>신청일자</th>
                                                </tr>
                                            </thead>
                                            <tbody>
												<c:forEach items="${reportApplyVOs}" var="vo">
                                                	<tr>
                                                		<c:choose>
                                                			<c:when test="${pager.kind eq '1'}">
                                                				<td><a href="./workdetail?applyNum=${vo.applyNum }&lstatus=${check}">${vo.applyNum}</a></td>
                                                			</c:when>
                                                			<c:otherwise>
                                                				<td>${vo.applyNum}</td>
                                                			</c:otherwise>
                                                		</c:choose>
                                                		<td>${vo.id}</td>
                                                		<td>${vo.name}</td>
                                                		<td>${vo.depName }</td>
                                                		<td>${vo.apDate }</td>
                                                	</tr>
                                                </c:forEach>
                                            </tbody>   
                                        </c:when>
                                        <c:when test="${cat eq 3}">
                                        	<thead>
                                                <tr>
                                                    <th>보고서번호</th>
		                                            <th>사원번호</th>
		                                            <th>사원이름</th>
		                                            <th>부서명</th>
		                                            <th>신청일자</th>
                                                </tr>
                                            </thead>
                                            <tbody>
												<c:forEach items="${reportApplyVOs}" var="vo">
                                                	<tr>
                                                		<c:choose>
                                                			<c:when test="${pager.kind eq '1'}">
                                                				<td><a href="./paydetail?applyNum=${vo.applyNum }&lstatus=${check}">${vo.applyNum}</a></td>
                                                			</c:when>
                                                			<c:otherwise>
                                                				<td>${vo.applyNum}</td>
                                                			</c:otherwise>
                                                		</c:choose>
                                                		<td>${vo.id}</td>
                                                		<td>${vo.name}</td>
                                                		<td>${vo.depName }</td>
                                                		<td>${vo.apDate }</td>
                                                	</tr>
                                                </c:forEach>
                                            </tbody>
                                        </c:when>
                                        <c:when test="${cat eq 4}">
                                        	<thead>
                                                <tr>
                                                    <th>보고서번호</th>
		                                            <th>사원번호</th>
		                                            <th>사원이름</th>
		                                            <th>부서명</th>
		                                            <th>신청일자</th>
                                                </tr>
                                            </thead>
                                            <tbody>
												<c:forEach items="${reportApplyVOs}" var="vo">
                                                	<tr>
                                                		<c:choose>
                                                			<c:when test="${pager.kind eq '1'}">
                                                				<td><a href="./sorrydetail?applyNum=${vo.applyNum }&lstatus=${check}">${vo.applyNum}</a></td>
                                                			</c:when>
                                                			<c:otherwise>
                                                				<td>${vo.applyNum}</td>
                                                			</c:otherwise>
                                                		</c:choose>
                                                		<td>${vo.id}</td>
                                                		<td>${vo.name}</td>
                                                		<td>${vo.depName }</td>
                                                		<td>${vo.apDate }</td>
                                                	</tr>
                                                </c:forEach>
                                            </tbody>
                                        </c:when>
                                        <c:otherwise>
                                        	<thead>
                                                <tr>
                                                    <th>보고서번호</th>
		                                            <th>사원번호</th>
		                                            <th>사원이름</th>
		                                            <th>부서명</th>
		                                            <th>신청일자</th>
                                                </tr>
                                            </thead>
                                            <tbody>
												<c:forEach items="${reportApplyVOs}" var="vo">
                                                	<tr>
                                                		<c:choose>
                                                			<c:when test="${pager.kind eq '1'}">
                                                				<td><a href="./vacadetail?applyNum=${vo.applyNum }&lstatus=${check}">${vo.applyNum}</a></td>
                                                			</c:when>
                                                			<c:otherwise>
                                                				<td>${vo.applyNum}</td>
                                                			</c:otherwise>
                                                		</c:choose>
                                                		<td>${vo.id}</td>
                                                		<td>${vo.name}</td>
                                                		<td>${vo.depName }</td>
                                                		<td>${vo.apDate }</td>
                                                	</tr>
                                                </c:forEach>
                                            </tbody>
                                        </c:otherwise>
                                     </c:choose>  
                                </table>
                            </div>
                            <c:choose>
                            		<c:when test="${cat eq 1}">                           		 
		                            	<nav aria-label="Page navigation example">
											<ul class="pagination justify-content-center">
												<li class="page-item ${pager.pre?'':'disabled'}">
													<a class="page-link" href="./doreport?cat=1&page=${pager.startNum-1}&kind=${pager.kind}">《</a>
												</li>
											<c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i">
												<li class="page-item">
													<a class="page-link" href="./doreport?cat=1&page=${i}&kind=${pager.kind}">${i}</a>
												</li>	
											</c:forEach>
												<li>
													<a class="page-link ${pager.next?'':'disabled'}" href="./doreport?cat=1&page=${pager.lastNum+1}&kind=${pager.kind}">》</a>
												</li>
											</ul>
										</nav>
									</c:when>
									<c:when test="${cat eq 2}">
										<nav aria-label="Page navigation example">
											<ul class="pagination justify-content-center">
												<li class="page-item ${pager.pre?'':'disabled'}">
													<a class="page-link" href="./doreport?cat=2&page=${pager.startNum-1}&kind=${pager.kind}">《</a>
												</li>
											<c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i">
												<li class="page-item">
													<a class="page-link" href="./doreport?cat=2&page=${i}&kind=${pager.kind}">${i}</a>
												</li>	
											</c:forEach>
												<li>
													<a class="page-link ${pager.next?'':'disabled'}" href="./doreport?cat=2&page=${pager.lastNum+1}&kind=${pager.kind}">》</a>
												</li>
											</ul>
										</nav>
									</c:when>
									<c:when test="${cat eq 3}">
										<nav aria-label="Page navigation example">
											<ul class="pagination justify-content-center">
												<li class="page-item ${pager.pre?'':'disabled'}">
													<a class="page-link" href="./doreport?cat=3&page=${pager.startNum-1}&kind=${pager.kind}">《</a>
												</li>
											<c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i">
												<li class="page-item">
													<a class="page-link" href="./doreport?cat=3&page=${i}&kind=${pager.kind}">${i}</a>
												</li>	
											</c:forEach>
												<li>
													<a class="page-link ${pager.next?'':'disabled'}" href="./doreport?cat=3&page=${pager.lastNum+1}&kind=${pager.kind}">》</a>
												</li>
											</ul>
										</nav>
									</c:when>
									<c:when test="${cat eq 4}">
										<nav aria-label="Page navigation example">
											<ul class="pagination justify-content-center">
												<li class="page-item ${pager.pre?'':'disabled'}">
													<a class="page-link" href="./doreport?cat=4&page=${pager.startNum-1}&kind=${pager.kind}">《</a>
												</li>
											<c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i">
												<li class="page-item">
													<a class="page-link" href="./doreport?cat=4&page=${i}&kind=${pager.kind}">${i}</a>
												</li>	
											</c:forEach>
												<li>
													<a class="page-link ${pager.next?'':'disabled'}" href="./doreport?cat=4&page=${pager.lastNum+1}&kind=${pager.kind}">》</a>
												</li>
											</ul>
										</nav>
									</c:when>
									<c:otherwise>
										<nav aria-label="Page navigation example">
											<ul class="pagination justify-content-center">
												<li class="page-item ${pager.pre?'':'disabled'}">
													<a class="page-link" href="./doreport?cat=1&page=${pager.startNum-1}&kind=${pager.kind}">《</a>
												</li>
											<c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i">
												<li class="page-item">
													<a class="page-link" href="./doreport?cat=1&page=${i}&kind=${pager.kind}">${i}</a>
												</li>	
											</c:forEach>
												<li>
													<a class="page-link ${pager.next?'':'disabled'}" href="./doreport?cat=1&page=${pager.lastNum+1}&kind=${pager.kind}">》</a>
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