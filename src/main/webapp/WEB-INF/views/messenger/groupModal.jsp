<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
						<!-- 체크박스 생성 모달 시작 -->
						<div id="check" class="check-overlay" style="z-index: 100;">
							<div class="check-window">
								<div class="close-area">X</div>
								<div class="content">
									<div class="checkInfo">
										<form action="./addRoom" method="post">
											<c:choose>
												<c:when test="${not empty depList}">
													<c:forEach items="${depList}" var="d">
														<li class="titleLi">
															<span style="margin-left: 20px;">${d.depName}</span>
															<button type="button" class="showBtn" style="margin-right: 8px;">🔽</button>
															<button type="button" class="hideBtn" style="margin-right: 8px;">🔼</button>
														</li>
														<ul class="acoArea">
															<c:forEach items="${empList}" var="e">
																<c:if test="${e.departmentVO.depNum eq d.depNum}">
																	<c:if test="${e.id ne myId}">
																	<li class="chatLi">
																		<input type="hidden" id="email${e.id}" value="${e.email}">
																		<input type="hidden" id="phone${e.id}" value="${e.phone}">
																		<div class="userArea" style="display: flex;	justify-content: space-between; align-items: center;">
																			<div class="userAdd">
																				<input type="checkbox" name="id" value="${e.id}">
																				<img id="yourImg${e.id}" class="yourImg" src="/img/undraw_profile_3.svg">
																			</div>
																			<div class="userInfo" style="width: 60%;">
																				<span class="empName" empId="${e.id}" value="${e.name}">😎${e.name}</span>
																				<span id="depN${e.id}" value="${e.departmentVO.depName}/${e.roleVO.roleName}">(${e.departmentVO.depName}/${e.roleVO.roleName})</span>
																			</div>
																			<div class="btnArea">
																				<c:choose>
																					<c:when test="${e.pickVO.myId eq myId}">
																							<button type="button" class="pickBtn" value="${e.id}"><img class="pickImg" src="/img/star (4).png"></button>
																					</c:when>
																					<c:when test="${e.pickVO.myId ne myId}">
																						<button type="button" class="pickBtn" value="${e.id}"><img class="pickImg" src="/img/star (3).png"></button>
																					</c:when>
																				</c:choose>
																			</div>
																		</div>
																	</li>
																	</c:if>
																</c:if> 
															</c:forEach>
														</ul>
													</c:forEach>
												</c:when>
												<c:when test="${empty depList}">
													<div>
														<a href="../messenger/chat"><img style="width: 30px;" src="/img/messenger/left.png"></a>
													</div>
													<c:choose>
														<c:when test="${empty empList}">
															<h1>검색 결과가 없습니다</h1>
														</c:when>
														<c:when test="${not empty empList}">
															<c:forEach items="${empList}" var="e">
																<c:if test="${e.id ne myId}">
																	<li class="chatLi">
																		<input type="hidden" id="email${e.id}" value="${e.email}">
																		<input type="hidden" id="phone${e.id}" value="${e.phone}">
																		<div class="userArea" style="display: flex;	justify-content: space-between; align-items: center;">
																			<div>
																				<img id="yourImg${e.id}" class="yourImg" src="/img/undraw_profile_3.svg">
																			</div>
																			<div class="userInfo" style="width: 60%;">
																				<span class="empName" empId="${e.id}" value="${e.name}">😎${e.name}</span>
																				<span id="depN${e.id}" value="${e.departmentVO.depName}/${e.roleVO.roleName}">(${e.departmentVO.depName}/${e.roleVO.roleName})</span>
																			</div>
																			<div class="btnArea">
																				<c:choose>
																					<c:when test="${e.pickVO.myId eq myId}">
																							<button type="button" class="pickBtn" value="${e.id}"><img class="pickImg" src="/img/star (4).png"></button>
																					</c:when>
																					<c:when test="${e.pickVO.myId ne myId}">
																						<button type="button" class="pickBtn" value="${e.id}"><img class="pickImg" src="/img/star (3).png"></button>
																					</c:when>
																				</c:choose>
																			</div>
																		</div>
																	</li>
																</c:if>
															</c:forEach>		
														</c:when>
													</c:choose>
												</c:when>
											</c:choose>
											<p class="mt-4">
												<a id="roomBtn" href="" class="btn" style="background: #4e73df; color: #FFFFFF;">생성</a>
											</p>
										</form>
									</div>
								</div>
							</div>
						</div>
						<!-- 체크박스 생성 모달 끝 -->