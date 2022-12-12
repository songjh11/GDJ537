<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
						<!-- 채팅 목록 -->
						<c:choose>
							<c:when test="${empty depList}">
								<div>
									<a href="../messenger/chat"><img style="width: 30px;" src="/img/messenger/left.png"></a>
								</div>
								<c:choose>
									<c:when test="${not empty roomList}">
										<c:forEach items="${roomList}" var="roomVO">
											<li class="chatLi">
												<p>${roomVO.roomName}</p>
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
										</c:forEach>		
									</c:when>
								</c:choose>
							</c:when>
						</c:choose>
						<p class="mt-4 text-center">
							<a id="roomBtn" href="" class="btn" style="background: #4e73df; color: #FFFFFF;">그룹쪽지</a>
						</p>										
						<!-- 채팅목록 -->
							