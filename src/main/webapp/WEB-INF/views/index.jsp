<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- meta tag 추가 -->
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Insert title here</title>
<!-- 공통 css, js, jquery -->
<link
  href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css"
  rel="stylesheet"
  integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT"
  crossorigin="anonymous">
<c:import url="./temp/layout_header.jsp"></c:import>


<sec:authorize access="isAuthenticated()">
<!-- fullCaledar CDN -->
<c:import url="./temp/fullcalendar.jsp"></c:import>

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
     .toggleSwitch {
  width: 50px;
  height: 30px;
  display: block;
  position: relative;
  border-radius: 30px;
  background-color: #fff;
  box-shadow: 0 0 16px 3px rgba(0 0 0 / 15%);
  cursor: pointer;
  margin: 10px;
}

.toggleSwitch .toggleButton {
  width: 20px;
  height: 20px;
  position: absolute;
  top: 50%;
  left: 4px;
  transform: translateY(-50%);
  border-radius: 50%;
  background: #3b61d1;
}

.filter:checked + .toggleSwitch {
  background: #3b61d1;
}

.filter:checked + .toggleSwitch .toggleButton {
  left: calc(100% - 25px);
  background: #fff;
}

.toggleSwitch, .toggleButton {
  transition: all 0.2s ease-in;
}
</style>
</sec:authorize>
</head>

<!-- body ID 작성 -->
<body id="page-top">
	<sec:authorize access="!isAuthenticated()">
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
	            <div class="container-fluid my-5">
	            	
					<c:import url="./temp/indexContentWithnotLogin.jsp"></c:import>
					
	            						
						
				</div>
			</div>	
			<!-- End of Main Content -->
		<!-- Footer import -->
		<c:import url="./temp/layout_footer.jsp"></c:import>
		</div>	
			
		
			

			
	</div>
		<!-- End of Content Wrapper -->
	</sec:authorize>
	<sec:authorize access="isAuthenticated()">
		<c:import url="./temp/indexContentWithLogin.jsp"></c:import>
	</sec:authorize>
	
</body>
</html>