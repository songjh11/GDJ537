<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
						<!-- 체크박스 생성 모달 시작 -->
						<form action="./addRoom" method="post" id="addRoomForm">
						 <input type="hidden" name="kind" value="0">
							<div id="check" class="check-overlay" style="z-index: 100;">
								<div class="check-window">
									<div class="close-area">X</div>
									<div class="content">
										<div class="checkInfo">
											<c:choose>
												<c:when test="${not empty depList}">
													<c:forEach items="${depList}" var="d">
														<li class="titleLi" style="justify-content: left !important;">
															<input type="checkbox" class="checkTeam" style="margin-left: 10px;" dep-num="${d.depNum}">
															<span style="color: white; margin-left: 6px;">${d.depName}</span>
															<button type="button" class="showBtn" style="margin-right: 8px; margin-left: auto;">🔽</button>
															<button type="button" class="hideBtn" style="margin-right: 8px; margin-left: auto;">🔼</button>
														</li>
														<ul class="acoArea">
															<c:forEach items="${empList}" var="e">
																<c:if test="${e.departmentVO.depNum eq d.depNum}">
																	<c:if test="${e.id ne myId}">
																	<li class="chatLi">
																		<div class="userArea" style="display: flex;	justify-content: start; align-items: center;">
																			<div class="userAdd">
																				<input class="checkUser" type="checkbox" name="id" value="${e.id}" dep-num="${d.depNum}">
																				<img id="yourImg${e.id}" class="yourImg" src="/file/user/${e.profile}">
																			</div>
																			<div class="userInfo" style="width: 60%; color: white; margin-left: 9px;">
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
																		<div class="userArea" style="display: flex;	justify-content: start; align-items: center;">
																			<div>
																				<input class="checkUser" type="checkbox" name="id" value="${e.id}" dep-num="${d.depNum}">
																				<img id="yourImg${e.id}" class="yourImg" src="/file/user/${e.profile}">
																			</div>
																			<div class="userAdd" style="width: 60%;">
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
												<a id="groupNoteGo" class="btn" style="background: #4e73df; color: #FFFFFF;">그룹쪽지</a>
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
												<img id="rmImg" src="/img/user/user.webp" width="100" height="100" style="border-radius: 50%;">
											</div>
											<div class="infoArea" style="background: transparent; border: none; box-shadow: none !important;">
												<div class="input-group mb-3 justify-content-center">
													<div class="form-floating">
														<label for="floatingInputGroup1">채팅방 이름</label>
													  <input type="text" name="roomName" class="form-control" id="floatingInputGroup1" placeholder="방이름을 입력해 주세요">
													</div>
												</div>
												<div class="input-group has-validation mb-3 justify-content-center">
													<div class="form-floating is-invalid">
													  <label for="floatingInputGroup2">비밀번호 설정</label>
													  <input type="password" id="numCheck" name="pw" class="form-control" id="floatingInputGroup2" placeholder="숫자를 입력해 주세요">
													</div>
												</div>
												<p class="mt-4">
													<button type="button" id="roomAddBtn" class="btn" style="background: #4e73df; color: #FFFFFF;">생성</button>
												</p>
											</div>
										</div>
									</div>
								</div>
							</div>
						</form>

						<div style="display: none;" id="dksk"></div>

						

						<script>
							//팀 선택시 전체팀원도 선택되게...
							$(".checkTeam").on("change", function(e){
								event.stopPropagation();
								let Mastdep = '';
								$('input:checkbox[class=checkTeam]').each(function (index) {
									// console.log("이상한아이",$(this))

									if($(this).is(":checked")==true){
										Mastdep = $(this).attr("dep-num");
										$.each($(".checkUser"), function(index, item){
											// console.log("췍유저의뎁넘",$(this).attr("dep-num"));
											// console.log(Mastdep);
											if($(this).attr("dep-num")==Mastdep) {
												// console.log("같으면뜨셈",$(this));
												// $(this).prop("checked","true");
												item.checked=true;

											} 
										})
									} else {
										Mastdep = $(this).attr("dep-num");
										$.each($(".checkUser"), function(index, item){
											// console.log("췍유저의뎁넘",$(this).attr("dep-num"));
											// console.log(Mastdep);
											if($(this).attr("dep-num")==Mastdep) {
												if($(this).attr("dep-num")==$(e.target).attr("dep-num")) {
												// console.log("같으면뜨셈",$(this));
												// $(this).prop("checked","true");
												item.checked=false;

												}
											} 
										})
										
									}
								})
							})

							//개인 선택하면 팀 체크칸 불켜지게
							$(".checkUser").click(function(e) {
								
								let checkCount = 0;
								let totalCount = 0;
								$("input[class=checkUser]").each(function(index, item) {
									if($(item).attr("dep-num")==$(e.target).attr("dep-num")) {
										totalCount += 1;
										if($(item).prop("checked")) {
											checkCount += 1;
										}
									}
								})
								// console.log("체크된이부서의사원은몇명",checkCount);
								// console.log("이부서의사원은총몇명",totalCount);

								if(totalCount==checkCount) {
									console.log("위에꺼체크하자");
									$("input[class=checkTeam]").each(function(index, item) {
										if($(item).attr("dep-num")==$(e.target).attr("dep-num")) {
											// $(item).prop("checked","true")
											// console.log($(item));
											item.checked=true;
										}
									})
									
								} else {
									console.log("위에꺼해제하자")
									$("input[class=checkTeam]").each(function(index, item) {
										if ($(item).attr("dep-num")==$(e.target).attr("dep-num")) {
											// $(item).prop("checked","false")
											// console.log($(item));
											item.checked=false;
										}
									})
								}
								
							});


							//그룹쪽지 발송
							$("#groupNoteGo").on("click", function(){
								let arr = [];
								$(".checkUser").each(function(index, item) {
									if($(item).prop("checked")) {
										// console.log($(item).val())
										if($(item).val().length>0) {
											arr.push($(item).val());
										}
									}
								})
								console.log(arr);
								let arrr = "";

								for(let i=0;i<arr.length;i++) {
									arrr += '<div class="dkdksk" value="'+arr[i]+'"></div>'
								}
								console.log(arrr);
								$("#dksk").append(arrr);

								$.ajax({
									type:"POST",
									url :"./note/group1",
									traditional:true,
									data:{
										arr: arr
									},
									success : function(data){
										modalChat.style.display = "none";
									},
									error   : function(){

									}
								})

								window.open('./note/group', '_blank', "width=450px, height=500px, location=no, top=100, left=500");



							})
								

							
							

						</script>
