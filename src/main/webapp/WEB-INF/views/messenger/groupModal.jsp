<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
						<!-- 체크박스 생성 모달 시작 -->
						<form action="./addRoom" method="post">
							<div id="check" class="check-overlay" style="z-index: 100;">
								<div class="check-window">
									<div class="close-area">X</div>
									<div class="content">
										<div class="checkInfo">
											<c:choose>
												<c:when test="${not empty depList}">
													<c:forEach items="${depList}" var="d">
														<li class="titleLi" style="justify-content: left !important;">
															<input type="checkbox" name="id" class="checkTeam" value="${e.id}" style="margin-left: 10px;" dep-num="${d.depNum}">
															<span style="color: white; margin-left: 6px;">${d.depName}</span>
															<button type="button" class="showBtn" style="margin-right: 8px; margin-left: auto;">🔽</button>
															<button type="button" class="hideBtn" style="margin-right: 8px; margin-left: auto;">🔼</button>
														</li>
														<ul class="acoArea">
															<c:forEach items="${empList}" var="e">
																<c:if test="${e.departmentVO.depNum eq d.depNum}">
																	<c:if test="${e.id ne myId}">
																	<li class="chatLi">
																		<div class="userArea" style="display: flex;	justify-content: space-between; align-items: center;">
																			<div class="userAdd">
																				<input type="checkbox" name="id" value="${e.id}" dep-num="${d.depNum}">
																				<img id="yourImg${e.id}" class="yourImg" src="/img/undraw_profile_3.svg">
																			</div>
																			<div class="userInfo" style="width: 60%; color: white;">
																				<span class="empName" empId="${e.id}" value="${e.name}">😎${e.name}</span>
																				<span id="depN${e.id}" value="${e.departmentVO.depName}/${e.roleVO.roleName}">(${e.departmentVO.depName}/${e.roleVO.roleName})</span>
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
													<c:choose>
														<c:when test="${not empty empList}">
															<c:forEach items="${empList}" var="e">
																<c:if test="${e.id ne myId}">
																	<li class="chatLi">
																		<div class="userArea" style="display: flex;	justify-content: space-between; align-items: center;">
																			<div>
																				<img id="yourImg${e.id}" class="yourImg" src="/img/undraw_profile_3.svg">
																			</div>
																			<div class="userAdd" style="width: 60%;">
																				<input type="checkbox" name="id" value="${e.id}">
																				<span class="empName" empId="${e.id}" value="${e.name}">😎${e.name}</span>
																				<span id="depN${e.id}" value="${e.departmentVO.depName}/${e.roleVO.roleName}">(${e.departmentVO.depName}/${e.roleVO.roleName})</span>
																			</div>																			
																		</div>
																	</li>
																</c:if>
															</c:forEach>		
														</c:when>
													</c:choose>
												</c:when>
											</c:choose>
											<p class="mt-4 text-center">
												<button type="button" id="roomBtn" class="btn" style="background: #4e73df; color: #FFFFFF;">그룹채팅</button>
												<a id="groupNoteGo" href="" class="btn" style="background: #4e73df; color: #FFFFFF;">그룹쪽지</a>
											</p>										
										</div>
									</div>
								</div>
							</div>
							<!-- 체크박스 생성 모달 끝 -->

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
											</div>
										</div>
									</div>
								</div>
							</div>
						</form>


						<script>

							$.each($(".checkTeam"), function(index, item) {
								console.log(index)
								console.log(item)
							});

						</script>