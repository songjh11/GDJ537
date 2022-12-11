<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<head>
<style>
	body{
		font-family: 'Nanum Gothic', sans-serif !important;
	}
	.container-fluid{
		padding: 0 0 !important;
		margin: 0 0 !important;
	}

	.mb-4{
		margin-bottom: 0px !important;
	}

	.blank{
		height: 34px;
	}

	.miniBar{
		width: 50px;
		height: 100%;
		background:#4e73df24;
	}

	.miniBar img{
		width: 35px;
		margin-top: 20px;
	}

	.miniBar button{
		background: transparent;
		border: none;
	}

	.searchOption{
		font-size: 0.9rem !important;
		font-weight: 400;
		line-height: 1.5;
		color: #858796;
		background-color: #f8f9fc!important;
		border: none !important;
		width: 40px !important;
	}

	li{
		list-style: none;
	}

	.chatDiv{
		width:580px;
		height: 100%;
		border-right: 1px #4e73df24 solid;
	}

	.yourImg{
		border-radius: 50%;
		width: 50px;
	}

	.chatUl{
		padding: 0 0 !important;
	}

	.titleLi{
		font-size: 18px; 
		font-weight: bold; 
		margin-right: 10px; 
		color: #696969; 
		display: flex;	
		justify-content: space-between; 
		border-bottom: 1px solid rgba(0,0,0,.1);
		padding: 5px 0;
		width: 100%;
	}

	.chatLi{
		display: flex;
		list-style: none;
		border-bottom: 1px #4e73df24 solid;
		margin-top: 5px;
		margin-bottom: 10px;
		padding-bottom: 10px;
		padding-left: 10px;
		align-items: flex-end;
	}

	.userInfo{
		color: #696969;
		font-size: 16px;
		width: 70%;
	}

	.statMsg{
		width: 100%;
		display: flex;
		justify-content: space-between;
	}

	.userArea{
		width: 100%;
	}

	.pickBtn{
		background: transparent;
		border: none;
	}

	.roomImg{
		width: 30px;
		margin-right: 12px;
	}

	.pickImg{
		width: 25px;
		margin-right: 7px;
	}

	img{
		vertical-align: middle;
	}

	button{
		border: none;
		background: transparent;
	}

	.titleLi .showBtn {
		display: block;
	}
	.titleLi .hideBtn {
	display: none;
	}
	.titleLi.on .showBtn  {
	display: none;
	}
	.titleLi.on .hideBtn {
	display: block; 
	}

	.acoArea{
		display: none;
		padding-inline-start: 0px !important;
	}

	.acoArea::before {
		display: inline-block;
	}

	.profile{
		display: flex;
		flex-direction: column;
		align-items: center;
		width: 100%;
	}	

	.profile p{
		font-size: 18px;
	}

	.h2title{
		font-weight: bold; 
		background: linear-gradient(#4e73df 10%,#224abe 100%);
		color: transparent; 
		-webkit-background-clip: text;
	}

	.proArea{
		width: 80%;
		padding: 20px;
		background-color: #FFFFFF;
		border-radius: 20px;
		box-shadow: 0 .15rem 1.75rem 0 rgba(58,59,69,.15)!important;
		text-align: center;
	}

	#modal.modal-overlay {
		width: 100%;
		height: 100%;
		position: absolute;
		left: 0;
		top: 0;
		display: none;
		flex-direction: column;
		align-items: center;
		justify-content: center;
		background: rgba(255, 255, 255, 0.25);
		box-shadow: 0 8px 32px 0 rgba(31, 38, 135, 0.37);
		backdrop-filter: blur(1.5px);
		-webkit-backdrop-filter: blur(1.5px);
		border-radius: 10px;
		border: 1px solid rgba(255, 255, 255, 0.18);
	}
	#modal .modal-window {
		background: rgba( 69, 139, 197, 0.70 );
		box-shadow: 0 8px 32px 0 rgba( 31, 38, 135, 0.37 );
		backdrop-filter: blur( 13.5px );
		-webkit-backdrop-filter: blur( 13.5px );
		border-radius: 10px;
		border: 1px solid rgba( 255, 255, 255, 0.18 );
		width: 400px;
		height: 500px;
		position: relative;
		top: -100px;
		padding: 10px;
	}
	#modal .title {
		padding-left: 10px;
		display: inline;
		text-shadow: 1px 1px 2px gray;
		color: white;
		
	}
	#modal .title h2 {
		display: inline;
	}
	#modal .close-area {
		display: inline;
		float: right;
		padding-right: 10px;
		cursor: pointer;
		text-shadow: 1px 1px 2px gray;
		color: white;
	}
	
	#modal .content {
		margin-top: 20px;
		padding: 0px 10px;
		text-shadow: 1px 1px 2px gray;
		color: white;
	}

	/* 채팅방 만드는 모달 */

	#room.room-overlay {
		width: 100%;
		height: 100%;
		position: absolute;
		left: 0;
		top: 0;
		display: none;
		flex-direction: column;
		align-items: center;
		justify-content: center;
		background: rgba(255, 255, 255, 0.25);
		box-shadow: 0 8px 32px 0 rgba(31, 38, 135, 0.37);
		backdrop-filter: blur(1.5px);
		-webkit-backdrop-filter: blur(1.5px);
		border-radius: 10px;
		border: 1px solid rgba(255, 255, 255, 0.18);
	}
	#room .room-window {
		background: rgba( 69, 139, 197, 0.70 );
		box-shadow: 0 8px 32px 0 rgba( 31, 38, 135, 0.37 );
		backdrop-filter: blur( 13.5px );
		-webkit-backdrop-filter: blur( 13.5px );
		border-radius: 10px;
		border: 1px solid rgba( 255, 255, 255, 0.18 );
		width: 400px;
		height: 680px;
		position: relative;
		padding: 10px;
		position: fixed;
		top: 43%;
		left: 50%;
		-webkit-transform: translate(-50%, -50%);
		-moz-transform: translate(-50%, -50%);
		-ms-transform: translate(-50%, -50%);
		-o-transform: translate(-50%, -50%);
		transform: translate(-50%, -50%);
	}
	#room .title {
		padding-left: 10px;
		display: inline;
		text-shadow: 1px 1px 2px gray;
		color: white;
		
	}
	#room .title h2 {
		display: inline;
	}
	#room .close-area {
		display: inline;
		float: right;
		padding-right: 10px;
		cursor: pointer;
		text-shadow: 1px 1px 2px gray;
		color: white;
	}
	
	#room .content {
		margin-top: 20px;
		padding: 0px 10px;
		text-shadow: 1px 1px 2px gray;
		color: white;
	}
</style>
</head>
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
							<!-- <a href="" class="btn"><img class="roomImg" src="/img/messenger/chatAdd.png"></a> -->
							<button type="button" id="roomBtn"><img class="roomImg" src="/img/messenger/chatAdd.png"></button>
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
														<div>
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
</html>