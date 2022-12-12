<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<% pageContext.setAttribute("replaceChar", "\r\n"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- meta tag 추가 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<style>
	@import url('https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap');

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
		width:600px;
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



	/* 노트 CSS */
	.noteStart {
		display: flex;
		flex-direction: column;
		height: 100%;
    	width: 100%;
		overflow: hidden;
	}

	#noteTitle {
		height: 50px;
    	font-size: 25px;
		display: flex;
		justify-content: center;
		align-items: center;
	}

	#noteChoice {
		display: flex;
		height: 57px;
		/* border: 1px solid #80808042; */
		border-top-left-radius: 20px;
		border-top-right-radius: 20px;
		/* box-shadow: 0px -5px 7px -4px #80808052; */
		margin: 10px 0px 0px;
	}

	#noteChoice div {
		width: 50%; 
		display: flex;
		justify-content: center;
	}

	#noteChoiceSearch {
		height: 57px;
		border-top-left-radius: 20px;
		border-top-right-radius: 20px;
		margin: 10px 0px 0px;
		display: flex;
		justify-content: center;
		align-items: center;

	}

	#noteContent {
		height: 500px;
		overflow-y: scroll;
	}

	@media screen and (max-width:1024px) {
		#noteContent {
			height: 700px;
			overflow-y: scroll;
		}
	}

	@media screen and (max-width:800px) {
		#noteContent {
			height: 500px;
			overflow-y: scroll;
		}

	}

	@media screen and (max-width:640px) {
		#noteContent {
			height: 500px;
			overflow-y: scroll;
		}

	}

	@media screen and (max-width:480px) {
		#noteContent {
			height: 500px;
			overflow-y: scroll;
		}
	}

	@media screen and (max-width:375px) {
		#noteContent {
			height: 500px;
			overflow-y: scroll;
		}
	}


	.noteList{
		border: 1px solid #d8d9f7a1;
		/* background: #3b4bbd0f; */
		background: #fff;
		margin: 8px 7px;
		display: flex;
		height: 54px;
		align-items: center;
		padding: 3px;
		overflow: hidden;
		border-radius: 10px 10px;
   		font-size: 13px;
		box-shadow: 2px 2px 5px #8080801f;
	}

	.noteList:hover {
		cursor: pointer;
	}

	#listImage{
		width: 10%;
		height: 80%;
		margin: 0px 8px 0px 3px;
	}

	#listImage img{
		width:100%;
    	height:100%;
		object-fit: contain;
	}

	#listInfo {
		margin-bottom: auto;
		width: 85%;
	}

	#listInfo div:nth-child(1) {
		margin: 3px 0px 4px;
		font-weight: bold;
	}

	#listInfo div:nth-child(2) {
		word-wrap: break-word;
		text-overflow: ellipsis;
    	/* width: 300px; */
		width: 100%;
	}

	#noteContent::-webkit-scrollbar {
		display: none;
	}

	/* .noteList div:nth-child(3){
		text-overflow: ellipsis;
	} */

	#pagination {
		display: flex;
		justify-content: center;
		align-items: center;
		margin-top: 5px;
	}

	.pagep {
		background: #ffffffc2;
		width: 18px;
		display: flex;
		flex-direction: row;
		justify-content: center;
		margin: 0px 3px;
		align-items: center;
		font-size: 13px;
		border-radius: 11px;
		box-shadow: 1px 1px 5px -1px #80808054;
	}

	a:hover {
		text-decoration: none !important;
	}

	.pagep:hover {
		cursor: pointer;
	}

	

</style>
<title>Insert title here</title>
<!-- 공통 css, js -->
<c:import url="../temp/layout_header.jsp"></c:import>
</head>

<!-- body ID 작성 -->
<body id="page-top">

	<!-- Page Wrapper 전체 Contents Wrapper -->
    <div id="wrapper">

		<!-- Sidebar import -->
		<c:import url="../temp/layout_sidebar.jsp"></c:import>
		<!-- End of Sidebar -->
		
		 <!-- Content Wrapper -->
		<div id="content-wrapper" class="d-flex flex-column">
			<!-- Main Content -->
			<div id="content">
			
				<!-- Topbar import-->
				<c:import url="../temp/layout_topbar.jsp"></c:import>
				<!-- End of Topbar -->
				
				<!-- Begin Page Content -->
	            <div class="container-fluid" style="display: flex; height: 100%;">
	
	            	<!-- Page Heading -->
					<div class="miniBar">
						<a href="../messenger/chat"><button type="button" id="chatBtn"><img src="/img/conversation.png"></button></a>
						<a href="../messenger/note"><button type="button" id="msgBtn"><img src="/img/email.png"></button></a>
					</div>

					<div class="chatDiv">
						<div class="blank"></div>
						<div>
							<!-- Topbar Search -->
						<form class="form-inline navbar-search" style="display: flex; justify-content: flex-end; margin-right: 10px; margin-bottom: 30px;">
							<div class="input-group" style="width: 100%;"> 
								<select class="searchOption form-control" value="">
									<option vlaue="" selected>정렬</option>
									<option value="">이름 순</option>
									<option value="">부서 순</option>
									<option value="">직급 순</option>
								</select>
								<input type="text" class="form-control bg-light border-0 small" style="width: 180px !important;" placeholder="Search for..."
									aria-label="Search" aria-describedby="basic-addon2">
								<div class="input-group-append">
									<button class="btn btn-primary" type="button">
										<i class="fas fa-search fa-sm"></i>
									</button>
								</div>
							</div>
						</form>
						</div>
						<ul class="chatUl">
							<li class="titleLi">
								<span style="margin-left: 20px;">즐겨찾기</span>
								<button type="button" class="showBtn" style="margin-right: 8px;">🔽</button>
								<button type="button" class="hideBtn" style="margin-right: 8px;">🔼</button>
							</li>
							<ul class="acoArea" id="acoArea1">
								<li class="chatLi">
									<div class="userArea" style="display: flex;	justify-content: space-between; align-items: center;">
										<div>
											<img class="yourImg" src="/img/undraw_profile_3.svg">
										</div>
										<div class="userInfo">
											<span>김사원</span>
											<span>(마케팅부/사원)</span>
										</div>
										<div class="btnArea">
											<button type="button" class="pickBtn" userNum="2"><img class="pickImg" src="/img/star (3).png"></button>
										</div>
									</div>
								</li>
								<li class="chatLi">
									<div class="userArea" style="display: flex;	justify-content: space-between; align-items: center;">
										<div>
											<img class="yourImg" src="/img/undraw_profile_3.svg">
										</div>
										<div class="userInfo">
											<span>김사원</span>
											<span>(마케팅부/사원)</span>
										</div>
											<div class="btnArea">
												<button type="button" class="pickBtn" userNum="2"><img class="pickImg" src="/img/star (3).png"></button>
											</div>
									</div>
								</li>
							</ul>
							<li class="titleLi">
								<span style="margin-left: 20px;">개발팀</span>
								<button type="button" class="showBtn" style="margin-right: 8px;">🔽</button>
								<button type="button" class="hideBtn" style="margin-right: 8px;">🔼</button>
							</li>
							<ul class="acoArea">
								<li class="chatLi">
									<div class="userArea" style="display: flex;	justify-content: space-between; align-items: center;">
										<div>
											<img class="yourImg" src="/img/undraw_profile_3.svg">
										</div>
										<div class="userInfo" style="width: 60%;">
											<span>김사원</span>
											<span>(마케팅부/사원)</span>
										</div>
											<div class="btnArea">
												<button type="button" class="pickBtn" userNum="2"><img class="pickImg" src="/img/star (3).png"></button>
											</div>
									</div>
								</li>
							</ul>
							<li class="titleLi">
								<span style="margin-left: 20px;">인사팀</span>
								<button type="button" class="showBtn" style="margin-right: 8px;">🔽</button>
								<button type="button" class="hideBtn" style="margin-right: 8px;">🔼</button>
							</li>
							<ul class="acoArea">
								<li class="chatLi">
									<div class="userArea" style="display: flex;	justify-content: space-between; align-items: center;">
										<div>
											<img class="yourImg" src="/img/undraw_profile_3.svg">
										</div>
										<div class="userInfo" style="width: 60%;">
											<span>김사원</span>
											<span>(마케팅부/사원)</span>
										</div>
											<div class="btnArea">
												<button type="button" class="pickBtn" userNum="2"><img class="pickImg" src="/img/star (3).png"></button>
											</div>
									</div>
								</li>
							</ul>
						</ul>
					</div>





					<div class="chatDiv">

						<!------------------------------------ YR ------------------------------------------->
						<div class="noteStart">
							<!-- <div id="noteTitle">쪽지함</div> -->

							<div id="noteChoice">
								<div><button id="receiveNote" onclick="location.href='./note'"><img id="rImg" src="/img/messenger/receive.png" alt=""></button></div>
								<div><button id="sentNoteList" onclick="ajaxPage(1)"><img style="transform: translateY(-4px);" id="sImg" src="/img/messenger/sendX.png" alt=""></button></div>
								<div><button id="goSearch"><img style="width: 30px;" src="/img/messenger/searchzz.png"></button></div>
							</div>
							<form id="ajaxSearchForm" action="./note" method="get">
								<div id="noteChoiceSearch">
									<div class="input-group" style="width: 95%;"> 
										<select class="searchOption form-control" name="kind" id="kindkind">
											<option value="contents" selected>내용</option>
											<option id="changeOption" value="sendId">발신ID</option>
										</select>
										<input id="searchInput" name="search" type="text" class="form-control bg-light border-0 small" style="width: 120px !important;" placeholder="Search for..."
											aria-label="Search" aria-describedby="basic-addon2">
										<div class="input-group-append">
											<button class="btn btn-primary" id="gogogogo" type="submit">
												<i class="fas fa-search fa-sm"></i>
											</button>
										</div>
									</div>
								
									
								</div>
							</form>

							

							<div id="noteContent">
								<c:forEach items="${list}" var="list">
									<div class="noteList" onclick="notePop(${list.noteNum})">
										<div id="listImage">
											<img src="/img/messenger/test.png" alt="">
										</div>
										<div id="listInfo">
											<div>발신자:${list.sendId}</div>
											<div>${fn:replace(list.contents, replaceChar, "<br/>")}
												<!-- ${list.contents} -->
											</div>
										</div>
									</div>

								</c:forEach>

								<div>임시쪽지보내기버튼
									<button id="sendNote" style="background-color: rgb(158, 158, 255);">발송@</button>
								</div>
	
								
							</div>

							<div id="pagination">
								<p style="margin: 0; display: flex; align-items: center;">
									<a href="./note?kind=${pager.kind}&search=${pager.search}&page=${pager.startNum-1}" style="margin: 0px 5px;" class="${pager.pre?'':'disabled'}"><img src="/img/messenger/left.png" alt=""></a>
									<c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i">
                                    
                                    	<!-- <a href="./simpleresult?search=${pager.search}&kind=${pager.kind}&page=${i}" id="ppaaggee${i}">${i}</a> -->
                                    	<a href="./note?kind=${pager.kind}&search=${pager.search}&page=${i}" class="pagep" id="ppaaggee${i}">${i}</a>
                                    
                                	</c:forEach>
									<a href="./note?kind=${pager.kind}&search=${pager.search}&page=${pager.lastNum+1}" style="margin: 0px 5px;" class="${pager.next?'':'disabled'}"><img src="/img/messenger/right.png" alt=""></a>
								</p>
							</div>

							

						</div>
						<!------------------------------------ YR ------------------------------------------->


					</div>

					<div class="chatDiv">
						<div class="blank"></div>
						<div class="profile">
							<img src="/img/profiletest.png" width="200" height="200" style="border-radius: 50%;">
							<h2 class="h2title">Goodee Company</h2>
							<div class="proArea">
								<p>이름</p>
								<p>부서</p>
								<p>직급</p>
								<p>이메일</p>
								<p>전화번호</p>
								<p><a class="btn" style="background: #4e73df; color: #FFFFFF;" href="#">개인 정보 수정 »</a></p>
							</div>
						  </div>
					</div>
	
	            </div>
	            <!-- End Page Content -->
					
			</div>
			<!-- End of Main Content -->
			
			<!-- Footer import -->
			<c:import url="../temp/layout_footer.jsp"></c:import>
			<!-- End of Footer -->
		</div>
		<!-- End of Content Wrapper -->
	</div>



	<script>
		$(document).ready(function() {
			$('#noteChoice').show(); //페이지를 로드할 때 표시할 요소
			$('#noteChoiceSearch').hide();
		})

		$("#goSearch").on("click", function(){
			$('#noteChoice').hide();
			$('#noteChoiceSearch').fadeIn();


			// $('#topSearchForm').fadeIn();
			// $('#searchTopClose').show();
			// $('#searchBoxArea').animate({height:'104px',opacity:'1'},'fast');
			// $('#topSearchForm .searchBox').attr('tabIndex','0').focus();

		})

		

		$('#sendNote').on("click",function(){
			window.open('./note/send?receiveId=2', '_blank', "width=450px, height=500px, location=no, top=100, left=500");
		})

		function notePop(num) {
			window.open('./note/detail?noteNum='+num, '_blank', "width=450px, height=500px, location=no, top=100, left=500");
		};


		function ajaxPage(page, kind, search){
			$.ajax({
				type:"GET",
				url :"./note/sent",
				traditional:true, //배열을 전송할 때 사용, true
				data:{
					page: page,
					kind: kind,
					search: search
				},
				success : function(data){
					let disabled = "";
					let disabled2 = "";
					console.log("나는성공, 나의 데이터는? : ", data);
					console.log(data.pager.page)
					console.log(data.pager.startNum)
					console.log(data.pager.lastNum)
					console.log(data.pager.pre)
					console.log(data.pager.next)

					// 검색기능을 위해 기존 폼을 발신전용으로 잠시 수정
					$("#changeOption").val("receiveId");
					$("#changeOption").html("수신ID");
					$("#gogogogo").attr("type","button");

					$("#gogogogo").on("click", function(){
						console.log("에젝에서만나와");
						ajaxPage(1, $("#kindkind").val(), $("#searchInput").val())
						// console.log($("#kindkind").val());
						// console.log($("#searchInput").val());
					});

					$("#pagination").empty();

					if(data.pager.pre) {
						disabled = "";
					} else {
						disabled = "disabled";
					}

					if(data.pager.next) {
						disabled2 = ""
					} else {
						disabled2 = "disabled";
					}

					let forPage = "";
					for(let i=data.pager.startNum;i<=data.pager.lastNum;i++) {
						forPage += '<a onclick="ajaxPage('+i+')" class="pagep" id="ppaaggee'+i+'">'+i+'</a>'
					}

					console.log(forPage);

					let pageAjax = '<p style="margin: 0; display: flex; align-items: center;"><a onclick="ajaxPage('+(data.pager.startNum-1)+')" style="margin: 0px 5px;" class="'+disabled+'"><img src="/img/messenger/left.png" alt=""></a>'+forPage+'<a onclick="ajaxPage('+(data.pager.lastNum+1)+')" style="margin: 0px 5px;" class="'+disabled2+'"><img src="/img/messenger/right.png" alt=""></a></p>';

					$("#pagination").html(pageAjax);


					let tempest = '';
					let src2="/img/messenger/send.png";
					let src="/img/messenger/receiveX.png";
					$("#sImg").attr("src",src2);
					$("#rImg").attr("src",src);

					$.each(data.list, function(index, item) { 
						// console.log(item);
						$('#noteContent').empty();
						// console.log(item.noteNum);
						item.contents = item.contents.replace(/\r\n/g, "</br>");

						tempest += '<div class="noteList" onclick="notePop('+item.noteNum+')"><div id="listImage"><img src="/img/messenger/test.png" alt=""></div><div id="listInfo"><div>'+item.noteNum+'수신자:'+item.receiveId+'</div><div>'+item.contents+'</div></div></div>'

						$('#noteContent').html(tempest);
					})

					$(".disabled").removeAttr("href");
				},
				error   : function(){
					console.log("나는에러");
				}
			});

			
			
		}

		$(".disabled").removeAttr("href");
	</script>

	<!-- Scroll Top, Login Modal import -->
	<c:import url="../temp/layout_top_logoutModal.jsp"></c:import>
	<script src="/js/messenger/main.js"></script>
</body>
</html>