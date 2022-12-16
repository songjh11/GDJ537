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
		height: 17px;
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
		height: 57px;
		border-top-left-radius: 9px;
		border-top-right-radius: 9px;
		border-bottom-left-radius: 9px;
   		border-bottom-right-radius: 9px;
		display: flex;
		justify-content: center;
		/* align-items: center; */
		border-bottom: 1px solid #80808057;
	}

	#noteChoice div {
		width: 50%; 
		display: flex;
		justify-content: center;
	}

	#noteChoice p {
		transform: translate3d(0px, -10px, 10px);
		font-size: 13px;
	}

	#noteChoiceSearch {
		height: 57px;
		border-top-left-radius: 20px;
		border-top-right-radius: 20px;
		display: flex;
		justify-content: center;
		align-items: center;

	}

	#noteContent {
		/* height: 700px; */
		height: 570px;
		
		/* height: 500px; */
		overflow-y: scroll;
	}

	#noteContent::-webkit-scrollbar {
		display: none;
	}
	
	.noteList{
		border: 1px solid #d8d9f7a1;
		/* background: #3b4bbd0f; */
		background: #fff;
		margin: 8px 7px;
		display: flex;
		height: 54px;
		/* height: 73px; */
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
		width: 7%;
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
		width: 92%;
	}

	#previewId {
		margin: 3px 0px 4px;
		font-weight: bold;
	}

	#previewNote {
		word-wrap: break-word;
		text-overflow: ellipsis;
    	width: 300px;
		/* width: 100%; */
		padding-right: 37px;
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

	#noteDelete {
		width: 20px;
    	height: 20px;
		margin: 0px;
	
		display: flex;
		float: right;
		margin-left: auto;
	}

	#countse {
		width: 18px;
		/* margin: auto 0px; */
		transform: translate3d(24px, 32px, 10px) !important;
		background: red;
		height: 17px;
		border-radius: 83px;
		margin-bottom: 0px;
		position: absolute;
		color: white;
		font-size: 11px;
		display: flex;
	    justify-content: center;
	}

	.iconMsg {
		font-size: 13px;
		color: #4c6ac4;
	}

	

</style>
<title>Insert title here</title>
<!-- 공통 css, js -->
<link href="/css/chat/employeeList.css" rel="stylesheet">
<link rel="stylesheet" href="/css/chat/groupModal.css">
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
						<a href="../messenger/chat"><button type="button" id="chatBtn"><img src="/img/messenger/m_chatX.png"><p class="iconMsg" style="color: white;">채팅</p></button></a>
						
						<a href="../messenger/note"><button type="button" id="msgBtn"><img src="/img/messenger/m_note.png"><p class="iconMsg" style="margin-top: -4px;">쪽지</p></button></a>
					</div>

					<div class="chatDiv" id="chatArea">
						<div class="blank"></div>
							<c:import url="./groupModal.jsp"></c:import>
							<c:import url="./employeeList.jsp"></c:import>
							<div class="btnArea d-flex flex-row-reverse" style="background: #4e73df; color: #FFFFFF; height: 38px; display: flex; text-align: center; justify-content: center;">
								<button type="button" id="userBtn" style="color: #FFFFFF;">그룹채팅/쪽지<img class="roomImg" style="width: 20px; margin-left: 5px; margin-bottom: 7px; filter: invert(1);" src="/img/messenger/chatAdd.png"></button>
							</div>
					</div>

					<div class="chatDiv" id="chatArea">
						<div class="blank"></div>
						<!------------------------------------ YR ------------------------------------------->
						<div class="noteStart">
							<!-- <div id="noteTitle">쪽지함</div> -->

							<div id="noteChoice">
								<div>
									<button id="receiveNote" onclick="location.href='./note'">
										<img id="rImg" src="/img/messenger/receive.png" alt="">
										<p id="soosin" style="color: #fe4a69;">수신</p>
									</button>
									<c:if test="${not empty getNotReadCount}">
										<span id="countse">${getNotReadCount}</span>
									</c:if>
								</div>
								<div><button id="sentNoteList" onclick="ajaxPage(1)"><img style="transform: translateY(-4px);" id="sImg" src="/img/messenger/sendX.png" alt=""><p id="balsin">발신</p></button></div>
								<div><button id="goSearch"><img style="width: 30px;" src="/img/messenger/searchzz.png"></button></div>
							</div>
							<form id="ajaxSearchForm" action="./note" method="get">
								
								<div id="noteChoiceSearch">
									<div class="input-group" style="width: 80%; 
									/* border: 1px solid black; */
									"> 
										<select class="searchOption form-control" name="kind" id="kindkind" placeholder="선택하세요">
											<option value="contents" selected>내용</option>
											<option id="changeOption" value="sendId">보낸 사람 ID</option>
										</select>
										<!-- <input hidden="hidden" /> -->
										<input id="searchInput" name="search" type="text" class="form-control bg-light border-0 small" style="width: 130px !important;" placeholder="Search for..."
											aria-label="Search" aria-describedby="basic-addon2">
										<div class="input-group-append">
											<button class="btn btn-primary" id="gogogogo" type="submit">
												<i class="fas fa-search fa-sm"></i>
											</button>
										</div>
										
									</div>
									<!-- <a href="javascript:ajaxPage(1);"><img style="width: 30px;" src="/img/messenger/return.png"></a> -->
									<a id="goBackNote"><img style="width: 44px; margin: 5px;" src="/img/messenger/close.png"></a>
								
									
								</div>
							</form>

							

							<div id="noteContent">
								<c:forEach items="${list}" var="list">
									<div class="noteList on" id="noteNum${list.noteNum}" noteNum="${list.noteNum}" onclick="notePop(${list.noteNum})" read-check="${list.readCheck}">
										<div id="listImage">
											<img src="/img/undraw_profile_3.svg" alt="">
										</div>
										<div id="listInfo">
											<div style="display: flex;">
											<div id="previewId"><strong>${list.sendName}</strong></div>
											<img id="noteDelete" onclick="noteDelete(${list.noteNum})" src="/img/messenger/close.png">
											</div>
											
											<div id="previewNote">${fn:replace(list.contents, replaceChar, "<br/>")}
												<!-- ${list.contents} -->
											</div>
										</div>
									</div>

								</c:forEach>
								<c:if test="${empty list}">
									<div id="imEmpty" style="justify-content: center; margin-top: 5px; display: flex;" value="${message5}">${message5}</div>
								</c:if>
								
								<script>

									

								</script>
								
								
								
							</div>
							
							<!-- <c:if test="${not empty list}"> -->
							<div id="pagination">
								<p style="margin: 0; display: flex; align-items: center;">
									<a href="./note?kind=${pager.kind}&search=${pager.search}&page=${pager.startnum-1}" style="margin: 0px 5px;" class="${pager.pre?'':'disabled'}"><img src="/img/messenger/left2.png" alt=""></a>
									<c:forEach begin="${pager.startnum}" end="${pager.lastnum}" var="i">
                                    
                                    	<!-- <a href="./simpleresult?search=${pager.search}&kind=${pager.kind}&page=${i}" id="ppaaggee${i}">${i}</a> -->
                                    	<a href="./note?kind=${pager.kind}&search=${pager.search}&page=${i}" class="pagep" id="ppaaggee${i}">${i}</a>
                                    
                                	</c:forEach>
									<a href="./note?kind=${pager.kind}&search=${pager.search}&page=${pager.lastnum+1}" style="margin: 0px 5px;" class="${pager.next?'':'disabled'}"><img src="/img/messenger/right2.png" alt=""></a>
								</p>
							</div>
							<!-- </c:if> -->

							

						</div>
						<!------------------------------------ YR ------------------------------------------->


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

		//읽은 아이들은 회색으로 표시..
		$($(".noteList")).each(function(index, item) {
			if($(this).attr("read-check")==0) {
				$(this).css("color","lightgrey");
			}
		});	
		
		//검색아이콘 클릭시
		$(document).ready(function() {
			$('#noteChoice').show(); //페이지를 로드할 때 표시할 요소
			$('#noteChoiceSearch').hide();
		})

		$("#goSearch").on("click", function(){
			$('#noteChoice').hide();
			$('#noteChoiceSearch').fadeIn();

		})

		$("#goBackNote").on("click", function(){
			$('#noteChoiceSearch').hide();
			$('#noteChoice').fadeIn();
			$("#searchInput").val("");
		})


		// 쪽지 삭제
		function noteDelete(num) {
			event.stopPropagation();
			if(confirm("쪽지를 삭제하시겠습니까?")) {
				$.ajax({
					type:"GET",
					url :"./note/delete",
					traditional:true, //배열을 전송할 때 사용, true
					data:{
						noteNum: num
					},
					success : function(data){
						console.log(data);
						$("#noteNum"+num).remove();
						// console.log($("#noteNum"+num).attr("id"))
						setTimeout(function(){
							location.reload();
						},250);
						
					},
					error : function(){
					}
				})
			} else {
				
			}
		}
		
		// 쪽지 상세보기
		function notePop(num) {
			
			window.open('./note/detail?noteNum='+num, '_blank', "width=450px, height=500px, location=no, top=100, left=500");
			

			//수신함일때만 새로고침하게... (읽은거 표시하려면 새로고침해야 반영되는데 읽은거 표시는 수신함만 하려고함.... 맘에안든다....)
			if($("#sImg").attr("src")=="/img/messenger/sendX.png") {
				setTimeout(function(){
					location.reload();
				},200);

				$(".noteList").each(function(index, item){
					// console.log()
					if($(item).attr("noteNum")==num) {
						$(item).css("color","lightgrey");
					}
					
					
				})

				
			}

			
			
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


					// 검색기능을 위해 기존 폼을 발신전용으로 잠시 수정
					$("#changeOption").val("receiveId");
					$("#changeOption").html("받는 사람 ID");
					$("#gogogogo").attr("type","button");

					$('input[type="text"]').keydown(function() {
						if (event.keyCode === 13) {
							event.preventDefault();
						};
					});

					$("#gogogogo").on("click", function(){
						console.log("에젝에서만나와");
						ajaxPage(1, $("#kindkind").val(), $("#searchInput").val())
						// console.log($("#kindkind").val());
						// console.log($("#searchInput").val());
					});

					$("#pagination").empty();

					try {

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
						let pageAjax = "";

						if($("#searchInput").val()=="") {
							console.log("검색아닌중..");
							// $("#searchInput").val("");
							// $("#kindkind").val("");
							let nullll = "";

							for(let i=data.pager.startNum;i<=data.pager.lastNum;i++) {
								forPage += '<a onclick="ajaxPage('+i+')" class="pagep" id="ppaaggee'+i+'">'+i+'</a>'
							}
							
							pageAjax = '<p style="margin: 0; display: flex; align-items: center;"><a onclick="ajaxPage('+(data.pager.startNum-1)+')" style="margin: 0px 5px;"><img src="/img/messenger/left2.png" alt=""></a>'+forPage+'<a onclick="ajaxPage('+(data.pager.lastNum+1)+')" style="margin: 0px 5px;" id="nextg" class="'+disabled2+'"><img src="/img/messenger/right2.png" alt=""></a></p>';
						
							
						} else {
							console.log("검색중");
							let kindval = $("#kindkind").val();
							let searchval = $("#searchInput").val();

							for(let i=data.pager.startNum;i<=data.pager.lastNum;i++) {
								forPage += '<a onclick="ajaxPage('+i+', ' +'\'' + kindval+'\'' +', '+ '\'' + $("#searchInput").val()+'\'' +')" class="pagep" id="ppaaggee'+i+'">'+i+'</a>'
							}

							pageAjax = '<p style="margin: 0; display: flex; align-items: center;"><a onclick="ajaxPage('+(data.pager.startNum-1)+','+ '\'' + $("#kindkind").val()+'\'' +','+ '\'' + $("#searchInput").val()+'\'' +')" style="margin: 0px 5px;" class="'+disabled+'"><img src="/img/messenger/left2.png" alt=""></a>'+forPage+'<a onclick="ajaxPage('+(data.pager.lastNum+1)+','+ '\'' + $("#kindkind").val()+'\'' +','+ '\'' + $("#searchInput").val()+'\'' +')" style="margin: 0px 5px;" id="nextg" class="'+disabled2+'"><img src="/img/messenger/right2.png" alt=""></a></p>';
						
						}

						console.log(data.notePager.totalPage);
						console.log(data.notePager.page);
						

						console.log($("#kindkind").val());
						console.log($("#searchInput").val());
						$("#pagination").html(pageAjax);

						$(".disabled").removeAttr("onclick");
						// $("#disabled").attr('onclick', '').unbind('click');
						

						
					} catch (error) {
						
					}
					
					let tempest = '';
					let src2="/img/messenger/send.png";
					let src="/img/messenger/receiveX.png";
					$("#sImg").attr("src",src2);
					$("#rImg").attr("src",src);

					$("#soosin").css("color", "#000000");
					$("#balsin").css("color", "#4a7bdd");

					
					

					$.each(data.list, function(index, item) { 
						// console.log(item);
						$('#noteContent').empty();
						// console.log(item.notenum);
						item.contents = item.contents.replace(/\r\n/g, "</br>");

						// 쪽지번호, 수신자라는 글자 있는 버전
						// tempest += '<div class="noteList" id="noteNum'+item.noteNum+'" onclick="notePop('+item.noteNum+')"><div id="listImage"><img src="/img/undraw_profile_3.svg" alt=""></div><div id="listInfo"><div style="display: flex;"><div id="previewId">'+item.noteNum+' 수신자 : <strong>'+item.receiveName+'</strong></div><img id="noteDelete" onclick="noteDelete('+item.noteNum+')" src="/img/messenger/close.png"></div><div id="previewNote">'+item.contents+'</div></div></div>'
						tempest += '<div class="noteList" id="noteNum'+item.noteNum+'" onclick="notePop('+item.noteNum+')"><div id="listImage"><img src="/img/undraw_profile_3.svg" alt=""></div><div id="listInfo"><div style="display: flex;"><div id="previewId"><strong>'+item.receiveName+'</strong></div><img id="noteDelete" onclick="noteDelete('+item.noteNum+')" src="/img/messenger/close.png"></div><div id="previewNote">'+item.contents+'</div></div></div>'

						$('#noteContent').html(tempest);
					})

					if(data.list.length==0) {
						$('#noteContent').empty();
						console.log($("#imEmpty").val());
						$('#noteContent').html('<div style="justify-content: center; margin-top: 5px; display: flex;">'+data.message5+'</div>');
						// $("#imEmpty").html(data.message5)
					} 

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
	<script src="/js/messenger/groupModal.js"></script>
</body>
</html>