<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
						
						<!-- 사원 프로필 모달 -->
						<form action="./addRoom" method="post">
							<div id="modal" class="modal-overlay" style="z-index: 100;">
								<div class="modal-window">
									<div class="close-area">X</div>
									<div class="content">
										<div class="profile">
											<input type="hidden" name="id" id="proId">
											<input type="hidden" name="roomName" id="roomName">
											<input type="hidden" name="pw">
											<img id="proImg" src="/file/profile/" width="200" height="200" style="border-radius: 50%;">
											<div class="proArea" style="background: transparent; border: none; box-shadow: none !important;">
												<p id="proName">이름</p>
												<p id="proDep">부서/직급</p>
												<p id="proEmail">이메일</p>
												<p id="proPhone">전화번호</p>
												<p><button type="submit" class="btn" style="background: #4e73df; color: #FFFFFF;">채팅</button>
												<a class="btn" id="sendNote" style="background: #4e73df; color: #FFFFFF;" href="#">쪽지</a></p>
											</div>
										</div>
									</div>
								</div>
							</div>
						</form>
						<!-- 사원 검색 -->
						<div style="display: flex; align-items: center; height: 57px;">
							<form action="searchEmp" method="POST" class="form-inline navbar-search" style="width: 100%; display: flex; margin-right: 10px;">
								<div class="input-group" style="width: 92%;"> 
									<select class="searchOption form-control" id="kind" name="kind" value="">
										<option value="0" selected>선택</option>
										<option value="0">이름</option>
										<option value="1">부서</option>
										<option value="2">직급</option>
									</select>
									<input type="text" id="keyword" name="keyword" class="form-control bg-light border-0 small" style="width: 180px !important;" placeholder="Search for..."
									aria-label="Search" aria-describedby="basic-addon2">
									<div class="input-group-append">
										<button class="btn btn-primary" type="submit" id="searchBtn">
											<i class="fas fa-search fa-sm"></i>
										</button>
									</div>
								</div>
								<div style="margin-left: 12px;">
									<c:choose>
										<c:when test="${url eq 'note'}">
											<a href="../messenger/note" title="초기화면으로 돌아가기"><img style="width: 32px;" src="/img/messenger/left.png"></a>
										</c:when>
										<c:otherwise>
											<a href="../messenger/chat" title="초기화면으로 돌아가기"><img style="width: 32px;" src="/img/messenger/left.png"></a>
										</c:otherwise>
									</c:choose>
								</div>
							</form>
						</div>
						<input type="hidden" id="loginUserId" value="${user.id}">
						<ul class="chatUl" style="overflow-y: scroll; overflow-x: hidden; height: 560px;">
							<c:choose>
								<c:when test="${not empty depList}">
									<!-- 즐찾 시작 -->
									<li class="titleLi">
										<span style="margin-left: 20px;">즐겨찾기</span>
										<button type="button" class="showBtn" style="margin-right: 8px;">🔽</button>
										<button type="button" class="hideBtn" style="margin-right: 8px;">🔼</button>
									</li>
									<ul class="acoArea pickLi">
										<div id="pickRemove">
										<c:choose>
											<c:when test="${empty pickList}">
											</c:when>
											<c:when test="${not empty pickList}">
												<c:forEach items="${pickList}" var="p">
													<c:if test="${e.id ne myId}">
														<li class="chatLi">
															<input type="hidden" id="email${p.id}" value="${p.email}">
															<input type="hidden" id="phone${p.id}" value="${p.phone}">
															<div class="userArea rrrr" empId="${p.id}" value="${p.name}" style="display: flex;	justify-content: space-between; align-items: center;">
																<div class="userAdd">
																	<img id="yourImg${p.id}" class="yourImg" src="/file/user/${p.profile}">
																</div>
																<div class="userInfo" style="width: 60%;">
																	<span class="empName" empId="${p.id}" value="${p.name}">😎${p.name}</span>
																	<span id="${p.id}" value="${p.departmentVO.depName}/${p.roleVO.roleName}">(${p.departmentVO.depName}/${p.roleVO.roleName})</span>
																</div>
																<c:choose>
																	<c:when test="${p.pickVO[0].myId eq myId}">
																		<div class="btnArea">
																			<button type="button" class="pickBtn" value="${p.id}" pickBtnNum="${p.id}"><img class="pickImg" src="/img/star (4).png"></button>
																		</div>
																	</c:when>
																	<c:when test="${p.pickVO[0].myId ne myId}">
																		<div class="btnArea">
																			<button type="button" class="pickBtn" value="${p.id}" pickBtnNum="${p.id}"><img class="pickImg" src="/img/star (3).png"></button>
																		</div>
																	</c:when>
																</c:choose>
															</div>
														</li>
													</c:if>
												</c:forEach>
											</c:when>
										</c:choose>
									</div>
								</ul>
								<!-- 전체 사원 목록 -->
								<c:forEach items="${depList}" var="d">
									<li class="titleLi">
										<span style="margin-left: 20px;">${d.depName}</span>
											<button type="button" class="showBtn" style="margin-right: 8px;">🔽</button>
											<button type="button" class="hideBtn" style="margin-right: 8px;">🔼</button>
										</li>
										<ul class="acoArea">
											<div class="userList">
											<c:forEach items="${empList}" var="e">
												<c:if test="${e.departmentVO.depNum eq d.depNum}">
													<c:if test="${e.id ne myId}">
													<li class="chatLi">
														<input type="hidden" id="email${e.id}" value="${e.email}">
														<input type="hidden" id="phone${e.id}" value="${e.phone}">
														<div class="userArea rrrr" empId="${e.id}" value="${e.name}" style="display: flex;	justify-content: space-between; align-items: center;">
															<div class="userAdd">
 																<form action="./addRoom" class="roomForm" method="get">
																	<img id="yourImg${e.id}" class="yourImg" src="/file/user/${e.profile}">
																</form>
															</div>
															<div class="userInfo" style="width: 60%;">
																<span class="empName" empId="${e.id}" value="${e.name}">😎${e.name}</span>
																<span id="depN${e.id}" value="${e.departmentVO.depName}/${e.roleVO.roleName}">(${e.departmentVO.depName}/${e.roleVO.roleName})</span>
															</div>
															<div class="btnArea">
																<c:set var="count" value="1"></c:set>
																<c:if test="${empty e.pickVO}">
																	<c:set var="count" value="0"></c:set>
																	<button type="button" class="pickBtn" value="${e.id}"><img class="pickImg" src="/img/star (3).png"></button>	
															</c:if>
															<c:forEach items="${e.pickVO}" var="p">
																<c:choose>
																	<c:when test="${not empty p}">
																		<c:if test="${p.myId eq myId}">
																				<c:set var="count" value="0"></c:set>
																				<button type="button" class="pickBtn" value="${e.id}"><img class="pickImg" src="/img/star (4).png"></button>
																			</c:if>
													
																			</c:when>															
																	</c:choose>																	
																</c:forEach>
																<c:if test="${count eq 1}">
																	<button type="button" class="pickBtn" value="${e.id}"><img class="pickImg" src="/img/star (3).png"></button>	
																</c:if>
															</div>
														</div>
													</li>
													</c:if>
												</c:if> 
											</c:forEach>
											</div>
										</ul>
									</c:forEach>
								</c:when>
								<c:when test="${empty depList}">
									<!-- 검색 시 사원 목록(부서목록X) -->
									
									<!-- 즐찾 시작 -->
									<li class="titleLi">
										<span style="margin-left: 20px;">즐겨찾기</span>
										<button type="button" class="showBtn" style="margin-right: 8px;">🔽</button>
										<button type="button" class="hideBtn" style="margin-right: 8px;">🔼</button>
									</li>
									<ul class="acoArea pickLi">
										<div id="pickRemove">
										<c:choose>
											<c:when test="${empty pickList}">
											</c:when>
											<c:when test="${not empty pickList}">
												<c:forEach items="${pickList}" var="p">
													<c:if test="${e.id ne myId}">
														<li class="chatLi">
															<input type="hidden" id="email${p.id}" value="${p.email}">
															<input type="hidden" id="phone${p.id}" value="${p.phone}">
															<div class="userArea rrrr" empId="${e.id}" value="${e.name}" style="display: flex;	justify-content: space-between; align-items: center;">
																<div class="userAdd">
																	<img id="yourImg${p.id}" class="yourImg" src="/file/user/${p.profile}">
																</div>
																<div class="userInfo" style="width: 60%;">
																	<span class="empName" empId="${p.id}" value="${p.name}">😎${p.name}</span>
																	<span id="depN${p.id}" value="${p.departmentVO.depName}/${p.roleVO.roleName}">(${p.departmentVO.depName}/${p.roleVO.roleName})</span>
																</div>
																<c:choose>
																	<c:when test="${p.pickVO[0].myId eq myId}">
																		<div class="btnArea">
																			<button type="button" class="pickBtn" value="${p.id}" pickBtnNum="${p.id}"><img class="pickImg" src="/img/star (4).png"></button>
																		</div>
																	</c:when>
																	<c:when test="${p.pickVO[0].myId ne myId}">
																		<div class="btnArea">
																			<button type="button" class="pickBtn" value="${p.id}" pickBtnNum="${p.id}"><img class="pickImg" src="/img/star (3).png"></button>
																		</div>
																	</c:when>
																</c:choose>
															</div>
														</li>
													</c:if>
												</c:forEach>
											</c:when>
										</c:choose>
									</div>
								</ul>
									<c:choose>
										<c:when test="${empty empList}">
											<h6 style="text-align: center; margin-top: 10px;">검색 결과가 없습니다</h6>
										</c:when>
										<c:when test="${not empty empList}">
											<li class="titleLi">
												<span style="margin-left: 20px;">검색 결과</span>
											</li>
											<ul class="searchArea" style="padding-inline-start: 0px !important;">
												<div class="userList">
											<c:forEach items="${empList}" var="e">
												<c:if test="${e.id ne myId}">
													<li class="chatLi">
														<input type="hidden" id="email${e.id}" value="${e.email}">
														<input type="hidden" id="phone${e.id}" value="${e.phone}">
														<div class="userArea rrrr" empId="${e.id}" value="${e.name}" style="display: flex;	justify-content: space-between; align-items: center;">
															<div>
																<img id="yourImg${e.id}" class="yourImg" src="/file/user/${e.profile}">
															</div>
															<div class="userInfo" style="width: 60%;">
																<span class="empName" empId="${e.id}" value="${e.name}">😎${e.name}</span>
																<span id="depN${e.id}" value="${e.departmentVO.depName}/${e.roleVO.roleName}">(${e.departmentVO.depName}/${e.roleVO.roleName})</span>
															</div>
															<div class="btnArea">
																<c:set var="count" value="1"></c:set>
																<c:if test="${empty e.pickVO}">
																	<c:set var="count" value="0"></c:set>
																	<button type="button" class="pickBtn" value="${e.id}"><img class="pickImg" src="/img/star (3).png"></button>	
															</c:if>
															<c:forEach items="${e.pickVO}" var="p">
																<c:choose>
																	<c:when test="${not empty p}">
																		<c:if test="${p.myId eq myId}">
																				<c:set var="count" value="0"></c:set>
																				<button type="button" class="pickBtn" value="${e.id}"><img class="pickImg" src="/img/star (4).png"></button>
																			</c:if>
													
																			</c:when>															
																	</c:choose>																	
																</c:forEach>
																<c:if test="${count eq 1}">
																	<button type="button" class="pickBtn" value="${e.id}"><img class="pickImg" src="/img/star (3).png"></button>	
																</c:if>
															</div>
														</div>
													</li>
												</c:if>
											</c:forEach>	
											</div>
										</ul>	
										</c:when>
									</c:choose>
								</c:when>
							</c:choose>
						</ul>