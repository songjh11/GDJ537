<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- meta tag 추가 -->
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
<link rel="stylesheet" href="/css/goods/ad_list.css">
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
      google.charts.load('current', {'packages':['corechart']});
      google.charts.setOnLoadCallback(drawChart);

      function drawChart() {

        var data = google.visualization.arrayToDataTable([
          ['Reason', 'Count'],
          ${result}
        ]);

        var options = {
          title: '차량 통계'
          
        };

        var chart = new google.visualization.PieChart(document.getElementById('piechart'));

        chart.draw(data, options);
      }
      </script>
      <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
      <script type="text/javascript">
        google.charts.load('current', {'packages':['bar']});
        google.charts.setOnLoadCallback(drawChart1);
  
        function drawChart1() {
          //부서명 가지고 오기
          var data = google.visualization.arrayToDataTable([
            ['부서명', 'Count'],
            ${depart}
          ]);
  
          var options = {
            chart: {
              title: '부서별 차량 예약 통계',
            }
          };
  
          var chart = new google.charts.Bar(document.getElementById('columnchart_material'));
  
          chart.draw(data, google.charts.Bar.convertOptions(options));
        }
      </script>


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
	            <div class="container-fluid">
	
	            	<!-- Page Heading -->
	            	<h1 class="h3 mb-4 text-gray-800">차량 예약 통계</h1>
					
                    
                    <div id="piechart" style="width: 700px; height: 500px; float:left; margin-right : 30px;"></div>

                    <div id="columnchart_material" style="width: 800px; height: 500px; float: left;"></div>

                    <div class="card" id="total">
                        <div class="card-body">
                          <div class="row align-items-center gx-0">
                            <div class="col">
                              <!-- Title -->
                              <h6 class="text-uppercase text-muted mb-2">
                                총 예약 건수
                              </h6>
                              <!-- Heading -->
                              <span class="h2 mb-0">
                                ${total}
                              </span>
                            </div>
                            <div class="col-auto">
                              <!-- Icon -->
                              <span class="h2 fe fe-briefcase text-muted mb-0"></span>
                            </div>
                          </div> <!-- / .row -->
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

	<!-- Scroll Top, Login Modal import -->
	<c:import url="../temp/layout_top_logoutModal.jsp"></c:import>
	<script src="/js/goods/ad_list.js"></script>
    
</body>
</html>