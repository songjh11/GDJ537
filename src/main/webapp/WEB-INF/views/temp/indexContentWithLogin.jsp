<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

   <!-- Page Wrapper 전체 Contents Wrapper -->
    <div id="wrapper">

      <!-- Sidebar import -->
      <c:import url="./temp/layout_sidebar.jsp"></c:import>
      <!-- End of Sidebar -->
      
       <!-- Content Wrapper -->
      <div id="content-wrapper" class="d-flex flex-column">
         <!-- Main Content -->
         <div id="content">
         
            <!-- Topbar import-->
            <c:import url="./temp/layout_topbar.jsp"></c:import>
            <!-- End of Topbar -->
            
            <!-- Begin Page Content -->
               <div class="container-fluid" style="height: 900px;">
   
                  <!-- Page Heading -->
                  <h1 class="h3 mb-4 pt-2 text-gray-800"><b><sec:authentication property="Principal.name"/> 님의 정보</b></h1>
                  
                  <div class="d-flex" style="height: 700px;">
                  <div style="width: 40%">
                     <!-- Approach -->
                       <div class="card shadow mb-4" style=" height: 230px">
                           <div class="card-body">
                              <div class="d-flex">
                              <c:choose>
			                   	<c:when test="${userVO.profile eq null}">
			                   		<img src="/img/user/user.webp" class="rounded" alt="..." style="width: 180px; margin-right: 1.3em">
			                   	</c:when>
			                   	<c:otherwise>
		                            <img src="/file/user/${userVO.profile}" class="rounded" alt="..." style="width: 180px; margin-right: 1.3em">
			                   	</c:otherwise>
			                 </c:choose>
                              <div style="margin-top: 10px">
                                 <h4 style="color: black; margin-bottom: 10px"><sec:authentication property="Principal.name"/> <span>사원</span></h4>
                                 <span>사원번호 : <sec:authentication property="Principal.id"/></span><br/>
                                 <span>직급 : <sec:authentication property="Principal.roleVO.roleName"/></span><br/>
                                 <span>부서명 : <sec:authentication property="Principal.departmentVO.depName"/></span><br/>
                                 <span>이메일 :<sec:authentication property="Principal.email"/></span><br/>
                                 <span>전화번호 : <sec:authentication property="Principal.phone"/></span>
                              </div>
                              </div>
                           </div>
                       </div>
                       
                       <!-- Approach -->
                        <div class="card shadow mb-4" style="height: 420px;">
                            <div class="card-header py-3">
                                <h6 class="m-0 font-weight-bold text-primary">나의 예약 목록</h6>
                            </div>
                            <div class="card-body">
                                
                                    
                                <table class="table table-hover justify-content-right" style="text-align: center;">
                                    <tr>
                                        <th>예약 날짜</th>
                                        <th>예약정보</th>
                                        <th>예약 변경</th>
                                        <th>예약 취소</th>
                                        <th>공공 시설</th>
                                    </tr>
                                    <c:forEach items="${reserveVO}" var="reserve">
                                        <c:if test="${reserve.goodsId.substring(0,2) == 'RO'}">
                                            <tr>
                                                <td>${reserve.startTime.substring(0,10)}  ${reserve.startTime.substring(11,reserve.startTime.length())}</td>
                                                
                                                <td><a href="/goods/room/roomReserveDetail?reserveNum=${reserve.reserveNum}" class="btn btn-outline-none">정보 보기</a></td>
                                                <td><a href="/goods/room/roomReserveUpdate?reserveNum=${reserve.reserveNum}&goodsId=${reserve.goodsId}" class="btn btn-outline-none">변경</a></td>
                                                <td><button name='delete' class="btn btn-outline-none delete_btn" value="${reserve.reserveNum}">취소</button></td>
                                                <td>회의실</td>
                                            </tr>
                                        </c:if>
                                        <c:if test="${reserve.goodsId.substring(0,2) == 'CA'}">

                                            <tr>
                                                <td>${reserve.startTime.substring(0,10)}  ${reserve.startTime.substring(11,reserve.startTime.length())}</td>
                                                <td><a href="/goods/car/carReserveDetail?reserveNum=${reserve.reserveNum}" class="btn btn-outline-none">정보 보기</a></td>
                                                <td><a href="/goods/car/carReserveChange?reserveNum=${reserve.reserveNum}" class="btn btn-outline-none">변경</a></td>
                                                <td><button name='delete' class="btn btn-outline-none delete_btn" value="${reserve.reserveNum}">취소</button></td>
                                                <td>차량</td>
                                            </tr>
                                        </c:if>
                                    </c:forEach>
                                </table>
                               
                                <p class="mb-0"></p>
                            </div>
                        </div>
                    </div>
                    
                    <!-- Area Chart -->
                    <div class="col-lg-8">
                        <div class="card shadow mb-4" style="height: 672.22222px;">
                            <!-- Card Header - Dropdown -->
                            <div
                                class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                                <h6 class="m-0 font-weight-bold text-primary">예약 캘린더</h6>
                                <div class="dropdown no-arrow">
                                    <a class="dropdown-toggle" href="#" role="button" id="dropdownMenuLink"
                                        data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        <i class="fas fa-ellipsis-v fa-sm fa-fw text-gray-400"></i>
                                    </a>
                                    <div class="dropdown-menu dropdown-menu-right shadow animated--fade-in"
                                        aria-labelledby="dropdownMenuLink">
                                        <div class="dropdown-header">Dropdown Header:</div>
                                        <a class="dropdown-item" href="#">Action</a>
                                        <a class="dropdown-item" href="#">Another action</a>
                                        <div class="dropdown-divider"></div>
                                        <a class="dropdown-item" href="#">Something else here</a>
                                    </div>
                                </div>
                            </div>
                            <!-- Card Body -->
                            <div class="card-body">
                                <div class="chart-area">
                                    <div id='calendar-container' >
                                     <div style="display: flex; align-items: center;">
                                       <select name="depNum" id="depNum" class="filter" style="margin: 0 10px;">
					                    <option value="">부서별</option>
					                    <option value="1">영업팀</option>
					                    <option value="2">총무팀</option>
					                    <option value="3">인사팀</option>
					                    <option value="4">IT개발팀</option>
					                    <option value="5">생산팀</option>
					                  </select>
					                  
					                  
					            	  	<input class="filter" id="room" type="checkbox" name="room"  hidden checked>회의실
					            	  	<label for="room" class="toggleSwitch">
										  <span class="toggleButton"></span>
										</label>
										
				                 		<input class="filter" id="car" type="checkbox" name="car" hidden>차량
				                 		<label for="car" class="toggleSwitch">
										  <span class="toggleButton"></span>
										</label>
										</div>
                                        <!-- Calendar -->
                                          <div id='calendar'></div>
                                        </div>
                                    <canvas id="myAreaChart"></canvas>
                                    <!-- calendar 추가 -->
                                </div>
                            </div>
                        </div>
                    </div>
                  
                  </div>
                  
                  <div class="row" style="padding-right: 13px">
                  <!-- Pending Requests Card Example -->
                    <div class="col-xl-3 col-md-4 mb-4">
                        <div class="card border-left-warning shadow h-100 py-2">
                            <div class="card-body">
                                <div class="row no-gutters align-items-center">
                                    <div class="col mr-2">
                                        <div class="text-xs font-weight-bold text-warning text-uppercase mb-1">
                                            Pending Requests</div>
                                        <div class="h5 mb-0 font-weight-bold text-gray-800">18</div>
                                    </div>
                                    <div class="col-auto">
                                        <i class="fas fa-comments fa-2x text-gray-300"></i>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>          
                            
                    <!-- Earnings (Monthly) Card Example -->
                    <div class="col-xl-3 col-md-4 mb-4">
                        <div class="card border-left-info shadow h-100 py-2">
                            <div class="card-body">
                                <div class="row no-gutters align-items-center">
                                    <div class="col mr-2">
                                        <div class="text-xs font-weight-bold text-info text-uppercase mb-1">Tasks
                                        </div>
                                        <div class="row no-gutters align-items-center">
                                            <div class="col-auto">
                                                <div class="h5 mb-0 mr-3 font-weight-bold text-gray-800">50%</div>
                                            </div>
                                            <div class="col">
                                                <div class="progress progress-sm mr-2">
                                                    <div class="progress-bar bg-info" role="progressbar"
                                                        style="width: 50%" aria-valuenow="50" aria-valuemin="0"
                                                        aria-valuemax="100"></div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-auto">
                                        <i class="fas fa-clipboard-list fa-2x text-gray-300"></i>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    
                    <!-- Earnings (Monthly) Card Example -->
                    <div class="col-xl-3 col-md-4 mb-4">
                        <div class="card border-left-info shadow h-100 py-2">
                            <div class="card-body">
                                <div class="row no-gutters align-items-center">
                                    <div class="col mr-2">
                                        <div class="text-xs font-weight-bold text-info text-uppercase mb-1">Tasks
                                        </div>
                                        <div class="row no-gutters align-items-center">
                                            <div class="col-auto">
                                                <div class="h5 mb-0 mr-3 font-weight-bold text-gray-800">50%</div>
                                            </div>
                                            <div class="col">
                                                <div class="progress progress-sm mr-2">
                                                    <div class="progress-bar bg-info" role="progressbar"
                                                        style="width: 50%" aria-valuenow="50" aria-valuemin="0"
                                                        aria-valuemax="100"></div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-auto">
                                        <i class="fas fa-clipboard-list fa-2x text-gray-300"></i>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    
                    <!-- Earnings (Monthly) Card Example -->
                    <div class="col-xl-3 col-md-4 mb-4">
                        <div class="card border-left-success shadow h-100 py-2">
                            <div class="card-body">
                                <div class="row no-gutters align-items-center">
                                    <div class="col mr-2">
                                        <div class="text-xs font-weight-bold text-success text-uppercase mb-1">
                                            Earnings (Annual)</div>
                                        <div class="h5 mb-0 font-weight-bold text-gray-800">$215,000</div>
                                    </div>
                                    <div class="col-auto">
                                        <i class="fas fa-dollar-sign fa-2x text-gray-300"></i>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    
                    </div>
                    
   
               </div>
               <!-- End Page Content -->
               
         </div>
         <!-- End of Main Content -->
         
         <!-- Footer import -->
         <c:import url="./temp/layout_footer.jsp"></c:import>
         <!-- End of Footer -->
      </div>
      <!-- End of Content Wrapper -->
   </div>


<!-- calendar modal-->
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
   <!-- Scroll Top, Login Modal import -->
   <c:import url="./temp/layout_top_logoutModal.jsp"></c:import>
<script>
    // 예약 취소 버튼을 눌렀을 때
    $('.delete_btn').click(function() {
        console.log($(this).val()); // 클릭 한 요소의 value값(reserveNum)을 출력한다.
        
        let reserve = $(this).val(); // value값(reserveNum)을 reserve에 저장한다.
        let result = confirm("예약을 취소하시겠습니까? \n취소 후에는 되돌릴 수 없습니다.");

        if (result) { // 확인 클릭 시
            $.get("/goods/car/carReserveDelete?reserveNum=" + reserve, function(result) { // controller로 get방식의 보낸다
                console.log(reserve);
                location.reload();
            });
        }
    });
</script>
<!-- calendar script-->
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
                height: '550px', // calendar 높이 설정
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