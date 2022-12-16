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
                  <h1 class="h3 mb-4 text-gray-800" style="text-align: center; font-weight: bold;">공용 시설 관리</h1>
               <input type="button" id="add" class="btn btn-primary" value="추가" style="margin-left: 80%; width: 70px; height: 40px;"></button>
               <div class="container">


   <!-- Scroll Top, Login Modal import -->
   <c:import url="../temp/layout_top_logoutModal.jsp"></c:import>
   <script src="/js/goods/ad_list.js"></script>
</body>
</html>