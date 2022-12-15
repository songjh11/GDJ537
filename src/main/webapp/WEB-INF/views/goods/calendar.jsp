<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- meta tag 추가 -->
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Insert title here</title>
<!-- 공통 css, js, jquery -->
<c:import url="../temp/layout_header.jsp"></c:import>

<!-- 화면 해상도에 따라 글자 크기 대응(모바일 대응) -->
  <meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no">
  <!-- jquery CDN -->
  
  <!-- jQuery -->
  <c:import url="../temp/fullcalendar.jsp"></c:import>
<style>
  /* body 스타일 */
  html, body {
    overflow: hidden;
    font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
    font-size: 14px;
  }
  /* 캘린더 위의 해더 스타일(날짜가 있는 부분) */
  .fc-header-toolbar {
    padding-top: 1em;
    padding-left: 1em;
    padding-right: 1em;
  }
</style>
</head>
<body style="padding:30px;">

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
	            <div class="container-fluid">
	
	            	<!-- Page Heading -->
	            	<div id='calendar-container'>
		            	<input class="filter" id="room" type="checkbox" name="room"  checked>회의실
                  <input class="filter" id="car" type="checkbox" name="car" >차량
                  <input class="filter" id="vacation" type="checkbox" name="vacation">휴가
                  <label for="pl" hidden >카테고리</label>
                  <select name="depNum" id="depNum" class="filter">
                    <option value="">부서별</option>
                    <option value="1">영업팀</option>
                    <option value="2">총무팀</option>
                    <option value="3">인사팀</option>
                    <option value="4">IT개발팀</option>
                    <option value="5">생산팀</option>
                  </select>
						<!-- Calendar -->
					    <div id='calendar'></div>
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
<div class="modal fade" id="calendarModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">일정을 확인하세요.</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <label for="taskId" class="col-form-label">공공 시설 예약</label>
                        <input type="text" class="form-control" id="calendar_content" >
                        <label for="taskId" class="col-form-label">시작 날짜</label>
                        <input type="text" class="form-control" id="calendar_start_date" >
                        <label for="taskId" class="col-form-label">종료 날짜</label>
                        <input type="text" class="form-control" id="calendar_end_date" >
                         <label for="taskId" class="col-form-label">직급</label>
                        <input type="text" class="form-control" id="calendar_user_roleName" >
                         <label for="taskId" class="col-form-label">사원명</label>
                        <input type="text" class="form-control" id="calendar_user_name">
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-info" data-dismiss="modal"
                        id="sprintSettingModalClose">확인</button>
                   
                </div>
    
            </div>
        </div>
    </div>

	<!-- Scroll Top, Logout Modal import -->
	<%-- <c:import url="../temp/layout_top_logoutModal.jsp"></c:import> --%>
	<script>
	
	
	
	
  var loadCalendar = function() {
      // calendar element 취득
      var calendarEl = $('#calendar')[0];
      console.log("rr");
      var params = {
				room : $("#room").is(':checked') ,
				car : $("#car").is(':checked'),
				vacation : $("#vacation").is(':checked'),
        depNum : $("#depNum").val()
			}
      

      var request = $.ajax({
          url: "/goods/calendar", // 변경하기
          method: "POST",
      	  data : params,
          dataType: "json"
      });
      
      
      
      request.done(function (data) {
          console.log(data); // log 로 데이터 찍어주기.

          var calendarEl = document.getElementById('calendar');

          var calendar = new FullCalendar.Calendar(calendarEl, {
        	  height: '700px', // calendar 높이 설정
              expandRows: true, // 화면에 맞게 높이 재설정
              slotMinTime: '08:00', // Day 캘린더에서 시작 시간
              slotMaxTime: '20:00', // Day 캘린더에서 종료 시간
              // 해더에 표시할 툴바
              headerToolbar: {
                left: 'prev,next today',
                center: 'title',
                right: 'dayGridMonth,timeGridWeek,timeGridDay,listWeek'
              },
              initialView: 'dayGridMonth', // 초기 로드 될때 보이는 캘린더 화면(기본 설정: 달)
              // initialDate: '2021-12-15', // 초기 날짜 설정 (설정하지 않으면 오늘 날짜가 보인다.)
              navLinks: true, // 날짜를 선택하면 Day 캘린더나 Week 캘린더로 링크
              editable: true, // 수정 가능?
              selectable: true, // 달력 일자 드래그 설정가능
              nowIndicator: true, // 현재 시간 마크
              dayMaxEvents: true, // 이벤트가 오버되면 높이 제한 (+ 몇 개식으로 표현)
              locale: 'ko', // 한국어 설정
              eventAdd: function(obj) { // 이벤트가 추가되면 발생하는 이벤트
                console.log(obj);
              },
              eventChange: function(obj) { // 이벤트가 수정되면 발생하는 이벤트
                console.log(obj);
              },
              eventRemove: function(obj){ // 이벤트가 삭제되면 발생하는 이벤트
                console.log(obj);
              },
              
              /**
               * data 로 값이 넘어온다. log 값 전달.
               */
               events: data
              
               ,eventClick:function(data) {
                
                  if(data) {
                    $('#calendarModal').modal("show");    
                	  var startTimeCheck = new Date(data.event.start);
                	  var endTimeCheck = new Date(data.event.end);
                    console.log(data.event)
                    console.log(data.event.extendedProps.content);
                	  

                	  $('#calendar_content').val(data.event.title);
			        		  $('#calendar_start_date').val(startTimeCheck.toLocaleDateString('ko-kr')+startTimeCheck.toLocaleTimeString('ko-kr'));
				        	  $('#calendar_end_date').val(endTimeCheck.toLocaleDateString('ko-kr')+endTimeCheck.toLocaleTimeString('ko-kr'));
                    $('#calendar_user_roleName').val(data.event.extendedProps.test1);
				        	  $('#calendar_user_name').val(data.event.extendedProps.test2);
                    
                    
                  }
              }
              
              //  [{
              //     title: 'All Day Event',
              //     start: '2022-12-01 12:30:00',
              //     end: '2022-12-03',
              //     content : '메롱'
              //   }] 
              
          });

          calendar.render();
          
      });

      request.fail(function( jqXHR, textStatus ) {
          alert( "Request failed: " + textStatus );
      });

     
   }; 
   
   loadCalendar();
   
   $('.filter').click(function(){
	   
	   loadCalendar();
   });
   

</script>
</body>
</html>