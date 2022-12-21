<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
  
                  
                  
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
                      <!-- Scroll Top, Login Modal import -->
   <c:import url="/temp/layout_top_logoutModal.jsp"></c:import>
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