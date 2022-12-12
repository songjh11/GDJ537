<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
						<div id="modal" class="modal-overlay" style="z-index: 100;">
							<div class="modal-window">
								<div class="close-area">X</div>
								<div class="content">
									<div class="profile">
										<img id="proImg" src="/img/profiletest.png" width="200" height="200" style="border-radius: 50%;">
										<div class="proArea" style="background: transparent; border: none; box-shadow: none !important;">
											<p id="proName">이름</p>
											<p id="proDep">부서/직급</p>
											<p id="proEmail">이메일</p>
											<p id="proPhone">전화번호</p>
											<p><a class="btn" style="background: #4e73df; color: #FFFFFF;" href="#">채팅</a>
											<a class="btn" style="background: #4e73df; color: #FFFFFF;" href="#">쪽지</a></p>
										</div>
									</div>
								</div>
							</div>
						</div>
						
						<!-- 채팅방 만드는 폼 -->
						<div id="room" class="room-overlay" style="z-index: 100;">
							<div class="room-window">
								<div class="close-area">X</div>
								<div class="content">
									<div class="roomInfo">
										<div class="row">
											<img id="rmImg" src="/img/undraw_profile_3.svg" width="100" height="100" style="border-radius: 50%;">
											<img id="rmImg" src="/img/undraw_profile_3.svg" width="100" height="100" style="border-radius: 50%;">
										</div>
										<div class="row">
											<img id="rmImg" src="/img/undraw_profile_3.svg" width="100" height="100" style="border-radius: 50%;">
											<img id="rmImg" src="/img/undraw_profile_3.svg" width="100" height="100" style="border-radius: 50%;">
										</div>
										<div class="infoArea" style="background: transparent; border: none; box-shadow: none !important;">
											<form action="./addRoom">
												<div class="mb-3">
													<label for="exampleFormControlTextarea1" class="form-label">채팅방 이름</label>
													<input type="text" name="roomName" class="form-control form-control-sm" placeholder="방이름을 입력해 주세요">
												</div>
												<div class="mb-3">
													<label for="exampleFormControlTextarea1" class="form-label">비밀번호</label>
													<input type="password" name="pw" class="form-control form-control-sm" placeholder="숫자를 입력해 주세요">
												</div>
												<p class="mt-4">
													<button type="submit" class="btn" style="background: #4e73df; color: #FFFFFF;">생성</button>
												</p>
											</form>
										</div>
									</div>
								</div>
							</div>
						</div>						
						
						<!-- Topbar Search -->
						<div>
							<form action="searchEmp" method="POST" class="form-inline navbar-search" style="display: flex; justify-content: flex-end; margin-right: 10px; margin-bottom: 30px;">
								<div class="input-group" style="width: 100%;"> 
									<select class="searchOption form-control" id="kind" name="kind" value="">
										<option value="0" selected>선택</option>
										<option value="0">이름</option>
										<option value="1">부서</option>
										<option value="2">직급</option>
									</select>
									<input type="text" id="keyword" name="keyword" class="form-control bg-light border-0 small" style="width: 180px !important;" placeholder="Search for..."
									aria-label="Search" aria-describedby="basic-addon2">
									<div class="input-group-append">
										<button class="btn btn-primary" type="submit">
											<i class="fas fa-search fa-sm"></i>
										</button>
									</div>
								</div>
							</form>
						</div>
						<!-- 채팅방생성 모달 버튼 -->
						<div class="btnArea d-flex flex-row-reverse">
							<button type="button" id="userBtn"><img class="roomImg" src="/img/messenger/chatAdd.png"></button>
						</div>
						<ul class="chatUl" style="overflow-y: scroll; overflow-x: hidden; height: 560px;">
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
													<div class="userArea" style="display: flex;	justify-content: space-between; align-items: center;">
														<div class="userAdd">
															<img id="yourImg${p.id}" class="yourImg" src="/img/undraw_profile_3.svg">
														</div>
														<div class="userInfo" style="width: 60%;">
															<span class="empName" empId="${p.id}" value="${p.name}">😎${p.name}</span>
															<span id="depN${p.id}" value="${p.departmentVO.depName}/${p.roleVO.roleName}">(${p.departmentVO.depName}/${p.roleVO.roleName})</span>
														</div>
														<c:choose>
															<c:when test="${p.pickVO.myId eq myId}">
																<div class="btnArea">
																	<button type="button" class="pickBtn" value="${p.id}" pickBtnNum="${p.id}"><img class="pickImg" src="/img/star (4).png"></button>
																</div>
															</c:when>
															<c:when test="${p.pickVO.myId ne myId}">
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
 																<form action="./addRoom" class="roomForm" method="get">
																	<img id="yourImg${e.id}" class="yourImg" src="/img/undraw_profile_3.svg">
																</form>
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
						</ul>		
	<script src="/js/messenger/main.js"></script>											