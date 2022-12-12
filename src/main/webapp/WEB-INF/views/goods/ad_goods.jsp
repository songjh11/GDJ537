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
	            	<h1 class="h3 mb-4 text-gray-800">공용 시설 통계</h1>
					
                    <div class="col-xl-7 col-lg-6">
                        <div class="card card-h-100">
                            <div class="d-flex card-header justify-content-between align-items-center">
                                <h4 class="header-title">Projections Vs Actuals</h4>
                                <div class="dropdown">
                                    <a href="#" class="dropdown-toggle arrow-none card-drop" data-bs-toggle="dropdown" aria-expanded="false">
                                        <i class="mdi mdi-dots-vertical"></i>
                                    </a>
                                    <div class="dropdown-menu dropdown-menu-end">
                                        <!-- item-->
                                        <a href="javascript:void(0);" class="dropdown-item">Sales Report</a>
                                        <!-- item-->
                                        <a href="javascript:void(0);" class="dropdown-item">Export Report</a>
                                        <!-- item-->
                                        <a href="javascript:void(0);" class="dropdown-item">Profit</a>
                                        <!-- item-->
                                        <a href="javascript:void(0);" class="dropdown-item">Action</a>
                                    </div>
                                </div>
                            </div>
                            <div class="card-body pt-0">
                                <div dir="ltr">
                                    <div id="high-performing-product" class="apex-charts" data-colors="#727cf5,#e3eaef" style="min-height: 256px;">
                                        <div id="apexchartsdehu7lvv" class="apexcharts-canvas apexchartsdehu7lvv apexcharts-theme-light" style="width: 596px; height: 256px;">
                                            <svg id="SvgjsSvg1439" width="596" height="256" xmlns="http://www.w3.org/2000/svg" version="1.1" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:svgjs="http://svgjs.dev" class="apexcharts-svg" xmlns:data="ApexChartsNS" transform="translate(0, 0)" style="background: transparent;">
                                                <g id="SvgjsG1441" class="apexcharts-inner apexcharts-graphical" transform="translate(40.79998779296875, 30)">
                                                    <defs id="SvgjsDefs1440">
                                                        <linearGradient id="SvgjsLinearGradient1445" x1="0" y1="0" x2="0" y2="1">
                                                            <stop id="SvgjsStop1446" stop-opacity="0.4" stop-color="rgba(216,227,240,0.4)" offset="0"></stop>
                                                            <stop id="SvgjsStop1447" stop-opacity="0.5" stop-color="rgba(190,209,230,0.5)" offset="1"></stop>
                                                            <stop id="SvgjsStop1448" stop-opacity="0.5" stop-color="rgba(190,209,230,0.5)" offset="1"></stop>
                                                        </linearGradient>
                                                        <clipPath id="gridRectMaskdehu7lvv">
                                                            <rect id="SvgjsRect1450" width="561.2000122070312" height="187.112" x="-3" y="-1" rx="0" ry="0" opacity="1" stroke-width="0" stroke="none" stroke-dasharray="0" fill="#fff"></rect>
                                                        </clipPath>
                                                        <clipPath id="forecastMaskdehu7lvv"></clipPath>
                                                        <clipPath id="nonForecastMaskdehu7lvv"></clipPath>
                                                        <clipPath id="gridRectMarkerMaskdehu7lvv">
                                                            <rect id="SvgjsRect1451" width="559.2000122070312" height="189.112" x="-2" y="-2" rx="0" ry="0" opacity="1" stroke-width="0" stroke="none" stroke-dasharray="0" fill="#fff"></rect>
                                                        </clipPath>
                                                    </defs>
                                                    <rect id="SvgjsRect1449" width="9.253333536783854" height="185.112" x="0" y="0" rx="0" ry="0" opacity="1" stroke-width="0" stroke-dasharray="3" fill="url(#SvgjsLinearGradient1445)" class="apexcharts-xcrosshairs" y2="185.112" filter="none" fill-opacity="0.9"></rect>
                                                    <g id="SvgjsG1481" class="apexcharts-xaxis" transform="translate(0, 0)">
                                                        <g id="SvgjsG1482" class="apexcharts-xaxis-texts-g" transform="translate(0, -4)">
                                                            <c:forEach items="${room}" var="ro" varStatus="status">
                                                                <text id="SvgjsText1484" font-family="Helvetica, Arial, sans-serif" x="${roomx[status.index]}" y="214.112" text-anchor="middle" dominant-baseline="auto" font-size="12px" font-weight="400" fill="#373d3f" class="apexcharts-text apexcharts-xaxis-label " style="font-family: Helvetica, Arial, sans-serif;">
                                                                    <tspan id="SvgjsTspan1485">${ro.name}</tspan>
                                                                    <title>${ro.name}</title>
                                                                </text>
                                                            </c:forEach>
                                                        </g>
                                                    </g>
                                                    <g id="SvgjsG1539" class="apexcharts-grid">
                                                        <g id="SvgjsG1540" class="apexcharts-gridlines-horizontal">
                                                            <line id="SvgjsLine1555" x1="0" y1="0" x2="555.2000122070312" y2="0" stroke="#e0e0e0" stroke-dasharray="0" stroke-linecap="butt" class="apexcharts-gridline"></line><line id="SvgjsLine1556" x1="0" y1="37.0224" x2="555.2000122070312" y2="37.0224" stroke="#e0e0e0" stroke-dasharray="0" stroke-linecap="butt" class="apexcharts-gridline"></line>
                                                            <line id="SvgjsLine1557" x1="0" y1="74.0448" x2="555.2000122070312" y2="74.0448" stroke="#e0e0e0" stroke-dasharray="0" stroke-linecap="butt" class="apexcharts-gridline"></line>
                                                            <line id="SvgjsLine1558" x1="0" y1="111.06719999999999" x2="555.2000122070312" y2="111.06719999999999" stroke="#e0e0e0" stroke-dasharray="0" stroke-linecap="butt" class="apexcharts-gridline"></line>
                                                            <line id="SvgjsLine1559" x1="0" y1="148.0896" x2="555.2000122070312" y2="148.0896" stroke="#e0e0e0" stroke-dasharray="0" stroke-linecap="butt" class="apexcharts-gridline"></line>
                                                            <line id="SvgjsLine1560" x1="0" y1="185.112" x2="555.2000122070312" y2="185.112" stroke="#e0e0e0" stroke-dasharray="0" stroke-linecap="butt" class="apexcharts-gridline"></line>
                                                        </g>
                                                        <g id="SvgjsG1541" class="apexcharts-gridlines-vertical"></g>
                                                        <line id="SvgjsLine1542" x1="0" y1="186.112" x2="0" y2="192.112" stroke="#e0e0e0" stroke-dasharray="0" stroke-linecap="butt" class="apexcharts-xaxis-tick"></line>
                                                        <line id="SvgjsLine1543" x1="46.26666768391927" y1="186.112" x2="46.26666768391927" y2="192.112" stroke="#e0e0e0" stroke-dasharray="0" stroke-linecap="butt" class="apexcharts-xaxis-tick"></line><line id="SvgjsLine1544" x1="92.53333536783855" y1="186.112" x2="92.53333536783855" y2="192.112" stroke="#e0e0e0" stroke-dasharray="0" stroke-linecap="butt" class="apexcharts-xaxis-tick"></line>
                                                        <line id="SvgjsLine1545" x1="138.8000030517578" y1="186.112" x2="138.8000030517578" y2="192.112" stroke="#e0e0e0" stroke-dasharray="0" stroke-linecap="butt" class="apexcharts-xaxis-tick"></line><line id="SvgjsLine1546" x1="185.0666707356771" y1="186.112" x2="185.0666707356771" y2="192.112" stroke="#e0e0e0" stroke-dasharray="0" stroke-linecap="butt" class="apexcharts-xaxis-tick"></line>
                                                        <line id="SvgjsLine1547" x1="231.33333841959637" y1="186.112" x2="231.33333841959637" y2="192.112" stroke="#e0e0e0" stroke-dasharray="0" stroke-linecap="butt" class="apexcharts-xaxis-tick"></line><line id="SvgjsLine1548" x1="277.6000061035156" y1="186.112" x2="277.6000061035156" y2="192.112" stroke="#e0e0e0" stroke-dasharray="0" stroke-linecap="butt" class="apexcharts-xaxis-tick"></line>
                                                        <line id="SvgjsLine1549" x1="323.8666737874349" y1="186.112" x2="323.8666737874349" y2="192.112" stroke="#e0e0e0" stroke-dasharray="0" stroke-linecap="butt" class="apexcharts-xaxis-tick"></line><line id="SvgjsLine1550" x1="370.13334147135413" y1="186.112" x2="370.13334147135413" y2="192.112" stroke="#e0e0e0" stroke-dasharray="0" stroke-linecap="butt" class="apexcharts-xaxis-tick"></line>
                                                        <line id="SvgjsLine1551" x1="416.4000091552734" y1="186.112" x2="416.4000091552734" y2="192.112" stroke="#e0e0e0" stroke-dasharray="0" stroke-linecap="butt" class="apexcharts-xaxis-tick"></line><line id="SvgjsLine1552" x1="462.66667683919263" y1="186.112" x2="462.66667683919263" y2="192.112" stroke="#e0e0e0" stroke-dasharray="0" stroke-linecap="butt" class="apexcharts-xaxis-tick"></line>
                                                        <line id="SvgjsLine1553" x1="508.9333445231119" y1="186.112" x2="508.9333445231119" y2="192.112" stroke="#e0e0e0" stroke-dasharray="0" stroke-linecap="butt" class="apexcharts-xaxis-tick"></line><line id="SvgjsLine1554" x1="555.2000122070311" y1="186.112" x2="555.2000122070311" y2="192.112" stroke="#e0e0e0" stroke-dasharray="0" stroke-linecap="butt" class="apexcharts-xaxis-tick"></line>
                                                        <line id="SvgjsLine1562" x1="0" y1="185.112" x2="555.2000122070312" y2="185.112" stroke="transparent" stroke-dasharray="0" stroke-linecap="butt"></line><line id="SvgjsLine1561" x1="0" y1="1" x2="0" y2="185.112" stroke="transparent" stroke-dasharray="0" stroke-linecap="butt"></line>
                                                    </g>
                                                    <g id="SvgjsG1452" class="apexcharts-bar-series apexcharts-plot-series">
                                                        <g id="SvgjsG1453" class="apexcharts-series" seriesName="Actual" rel="1" data:realIndex="0">
                                                            <path id="SvgjsPath1455" d="M 18.50666707356771 185.112L 18.50666707356771 124.95060000000001Q 18.50666707356771 124.95060000000001 18.50666707356771 124.95060000000001L 25.76000061035156 124.95060000000001Q 25.76000061035156 124.95060000000001 25.76000061035156 124.95060000000001L 25.76000061035156 124.95060000000001L 25.76000061035156 185.112L 25.76000061035156 185.112z" fill="rgba(114,124,245,1)" fill-opacity="1" stroke="transparent" stroke-opacity="1" stroke-linecap="round" stroke-width="2" stroke-dasharray="0" class="apexcharts-bar-area" index="0" clip-path="url(#gridRectMaskdehu7lvv)" cy="124.95060000000001" cx="63.77333475748698" j="0" val="65" barHeight="60.16139999999999" barWidth="9.253333536783854"></path>
                                                            <path id="SvgjsPath1456" d="M 64.77333475748698 185.112L 64.77333475748698 130.50396Q 64.77333475748698 130.50396 64.77333475748698 130.50396L 72.02666829427083 130.50396Q 72.02666829427083 130.50396 72.02666829427083 130.50396L 72.02666829427083 130.50396L 72.02666829427083 185.112L 72.02666829427083 185.112z" fill="rgba(114,124,245,1)" fill-opacity="1" stroke="transparent" stroke-opacity="1" stroke-linecap="round" stroke-width="2" stroke-dasharray="0" class="apexcharts-bar-area" index="0" clip-path="url(#gridRectMaskdehu7lvv)"  cy="130.50396" cx="110.04000244140624" j="1" val="59" barHeight="54.608039999999995" barWidth="9.253333536783854"></path>
                                                            <path id="SvgjsPath1457" d="M 111.04000244140624 185.112L 111.04000244140624 111.0672Q 111.04000244140624 111.0672 111.04000244140624 111.0672L 118.2933359781901 111.0672Q 118.2933359781901 111.0672 118.2933359781901 111.0672L 118.2933359781901 111.0672L 118.2933359781901 185.112L 118.2933359781901 185.112z" fill="rgba(114,124,245,1)" fill-opacity="1" stroke="transparent" stroke-opacity="1" stroke-linecap="round" stroke-width="2" stroke-dasharray="0" class="apexcharts-bar-area" index="0" clip-path="url(#gridRectMaskdehu7lvv)"  cy="111.0672" cx="156.30667012532552" j="2" val="80" barHeight="74.0448" barWidth="9.253333536783854"></path>
                                                            <path id="SvgjsPath1458" d="M 157.30667012532552 185.112L 157.30667012532552 110.14164Q 157.30667012532552 110.14164 157.30667012532552 110.14164L 164.56000366210938 110.14164Q 164.56000366210938 110.14164 164.56000366210938 110.14164L 164.56000366210938 110.14164L 164.56000366210938 185.112L 164.56000366210938 185.112z" fill="rgba(114,124,245,1)" fill-opacity="1" stroke="transparent" stroke-opacity="1" stroke-linecap="round" stroke-width="2" stroke-dasharray="0" class="apexcharts-bar-area" index="0" clip-path="url(#gridRectMaskdehu7lvv)"  cy="110.14164" cx="202.5733378092448" j="3" val="81" barHeight="74.97036" barWidth="9.253333536783854"></path>
                                                            <path id="SvgjsPath1459" d="M 203.5733378092448 185.112L 203.5733378092448 133.28064Q 203.5733378092448 133.28064 203.5733378092448 133.28064L 210.82667134602866 133.28064Q 210.82667134602866 133.28064 210.82667134602866 133.28064L 210.82667134602866 133.28064L 210.82667134602866 185.112L 210.82667134602866 185.112z" fill="rgba(114,124,245,1)" fill-opacity="1" stroke="transparent" stroke-opacity="1" stroke-linecap="round" stroke-width="2" stroke-dasharray="0" class="apexcharts-bar-area" index="0" clip-path="url(#gridRectMaskdehu7lvv)" cy="133.28064" cx="248.84000549316409" j="4" val="56" barHeight="51.83136" barWidth="9.253333536783854"></path>
                                                            <path id="SvgjsPath1460" d="M 249.84000549316409 185.112L 249.84000549316409 102.73716Q 249.84000549316409 102.73716 249.84000549316409 102.73716L 257.0933390299479 102.73716Q 257.0933390299479 102.73716 257.0933390299479 102.73716L 257.0933390299479 102.73716L 257.0933390299479 185.112L 257.0933390299479 185.112z" fill="rgba(114,124,245,1)" fill-opacity="1" stroke="transparent" stroke-opacity="1" stroke-linecap="round" stroke-width="2" stroke-dasharray="0" class="apexcharts-bar-area" index="0" clip-path="url(#gridRectMaskdehu7lvv)" cy="102.73716" cx="295.10667317708334" j="5" val="89" barHeight="82.37483999999999" barWidth="9.253333536783854"></path>
                                                            <path id="SvgjsPath1461" d="M 296.10667317708334 185.112L 296.10667317708334 148.0896Q 296.10667317708334 148.0896 296.10667317708334 148.0896L 303.36000671386716 148.0896Q 303.36000671386716 148.0896 303.36000671386716 148.0896L 303.36000671386716 148.0896L 303.36000671386716 185.112L 303.36000671386716 185.112z" fill="rgba(114,124,245,1)" fill-opacity="1" stroke="transparent" stroke-opacity="1" stroke-linecap="round" stroke-width="2" stroke-dasharray="0" class="apexcharts-bar-area" index="0" clip-path="url(#gridRectMaskdehu7lvv)" cy="148.0896" cx="341.3733408610026" j="6" val="40" barHeight="37.0224" barWidth="9.253333536783854"></path>
                                                            <path id="SvgjsPath1462" d="M 342.3733408610026 185.112L 342.3733408610026 155.49408Q 342.3733408610026 155.49408 342.3733408610026 155.49408L 349.6266743977864 155.49408Q 349.6266743977864 155.49408 349.6266743977864 155.49408L 349.6266743977864 155.49408L 349.6266743977864 185.112L 349.6266743977864 185.112z" fill="rgba(114,124,245,1)" fill-opacity="1" stroke="transparent" stroke-opacity="1" stroke-linecap="round" stroke-width="2" stroke-dasharray="0" class="apexcharts-bar-area" index="0" clip-path="url(#gridRectMaskdehu7lvv)" cy="155.49408" cx="387.64000854492184" j="7" val="32" barHeight="29.617919999999998" barWidth="9.253333536783854"></path>
                                                            <path id="SvgjsPath1463" d="M 388.64000854492184 185.112L 388.64000854492184 124.95060000000001Q 388.64000854492184 124.95060000000001 388.64000854492184 124.95060000000001L 395.89334208170567 124.95060000000001Q 395.89334208170567 124.95060000000001 395.89334208170567 124.95060000000001L 395.89334208170567 124.95060000000001L 395.89334208170567 185.112L 395.89334208170567 185.112z" fill="rgba(114,124,245,1)" fill-opacity="1" stroke="transparent" stroke-opacity="1" stroke-linecap="round" stroke-width="2" stroke-dasharray="0" class="apexcharts-bar-area" index="0" clip-path="url(#gridRectMaskdehu7lvv)" cy="124.95060000000001" cx="433.9066762288411" j="8" val="65" barHeight="60.16139999999999" barWidth="9.253333536783854"></path>
                                                            <path id="SvgjsPath1464" d="M 434.9066762288411 185.112L 434.9066762288411 130.50396Q 434.9066762288411 130.50396 434.9066762288411 130.50396L 442.1600097656249 130.50396Q 442.1600097656249 130.50396 442.1600097656249 130.50396L 442.1600097656249 130.50396L 442.1600097656249 185.112L 442.1600097656249 185.112z" fill="rgba(114,124,245,1)" fill-opacity="1" stroke="transparent" stroke-opacity="1" stroke-linecap="round" stroke-width="2" stroke-dasharray="0" class="apexcharts-bar-area" index="0" clip-path="url(#gridRectMaskdehu7lvv)"  cy="130.50396" cx="480.17334391276034" j="9" val="59" barHeight="54.608039999999995" barWidth="9.253333536783854"></path>
                                                            <path id="SvgjsPath1465" d="M 481.17334391276034 185.112L 481.17334391276034 111.0672Q 481.17334391276034 111.0672 481.17334391276034 111.0672L 488.4266774495442 111.0672Q 488.4266774495442 111.0672 488.4266774495442 111.0672L 488.4266774495442 111.0672L 488.4266774495442 185.112L 488.4266774495442 185.112z" fill="rgba(114,124,245,1)" fill-opacity="1" stroke="transparent" stroke-opacity="1" stroke-linecap="round" stroke-width="2" stroke-dasharray="0" class="apexcharts-bar-area" index="0" clip-path="url(#gridRectMaskdehu7lvv)"  cy="111.0672" cx="526.4400115966796" j="10" val="80" barHeight="74.0448" barWidth="9.253333536783854"></path>
                                                            <path id="SvgjsPath1466" d="M 527.4400115966796 185.112L 527.4400115966796 110.14164Q 527.4400115966796 110.14164 527.4400115966796 110.14164L 534.6933451334635 110.14164Q 534.6933451334635 110.14164 534.6933451334635 110.14164L 534.6933451334635 110.14164L 534.6933451334635 185.112L 534.6933451334635 185.112z" fill="rgba(114,124,245,1)" fill-opacity="1" stroke="transparent" stroke-opacity="1" stroke-linecap="round" stroke-width="2" stroke-dasharray="0" class="apexcharts-bar-area" index="0" clip-path="url(#gridRectMaskdehu7lvv)"  cy="110.14164" cx="572.7066792805989" j="11" val="81" barHeight="74.97036" barWidth="9.253333536783854"></path>
                                                        </g>
                                                        
                                                        <g id="SvgjsG1454" class="apexcharts-datalabels" data:realIndex="0"></g>
                                                        <g id="SvgjsG1468" class="apexcharts-datalabels" data:realIndex="1"></g>
                                                    </g>
                                                    <line id="SvgjsLine1563" x1="0" y1="0" x2="555.2000122070312" y2="0" stroke="#b6b6b6" stroke-dasharray="0" stroke-width="1" stroke-linecap="butt" class="apexcharts-ycrosshairs"></line>
                                                    <line id="SvgjsLine1564" x1="0" y1="0" x2="555.2000122070312" y2="0" stroke-dasharray="0" stroke-width="0" stroke-linecap="butt" class="apexcharts-ycrosshairs-hidden"></line>
                                                    <g id="SvgjsG1565" class="apexcharts-yaxis-annotations"></g>
                                                    <g id="SvgjsG1566" class="apexcharts-xaxis-annotations"></g>
                                                    <g id="SvgjsG1567" class="apexcharts-point-annotations"></g>
                                                </g>
                                                <g id="SvgjsG1519" class="apexcharts-yaxis" rel="0" transform="translate(7.79998779296875, 0)">
                                                    <g id="SvgjsG1520" class="apexcharts-yaxis-texts-g">
                                                        <text id="SvgjsText1522" font-family="Helvetica, Arial, sans-serif" x="20" y="31.5" text-anchor="end" dominant-baseline="auto" font-size="11px" font-weight="400" fill="#373d3f" class="apexcharts-text apexcharts-yaxis-label " style="font-family: Helvetica, Arial, sans-serif;">
                                                            <tspan id="SvgjsTspan1523">50</tspan>
                                                            <title>50</title>
                                                        </text>
                                                        <text id="SvgjsText1525" font-family="Helvetica, Arial, sans-serif" x="20" y="68.5224" text-anchor="end" dominant-baseline="auto" font-size="11px" font-weight="400" fill="#373d3f" class="apexcharts-text apexcharts-yaxis-label " style="font-family: Helvetica, Arial, sans-serif;">
                                                            <tspan id="SvgjsTspan1526">40</tspan>
                                                            <title>40</title>
                                                        </text>
                                                        <text id="SvgjsText1528" font-family="Helvetica, Arial, sans-serif" x="20" y="105.54480000000001" text-anchor="end" dominant-baseline="auto" font-size="11px" font-weight="400" fill="#373d3f" class="apexcharts-text apexcharts-yaxis-label " style="font-family: Helvetica, Arial, sans-serif;">
                                                            <tspan id="SvgjsTspan1529">30</tspan>
                                                            <title>30</title>
                                                        </text>
                                                        <text id="SvgjsText1531" font-family="Helvetica, Arial, sans-serif" x="20" y="142.5672" text-anchor="end" dominant-baseline="auto" font-size="11px" font-weight="400" fill="#373d3f" class="apexcharts-text apexcharts-yaxis-label " style="font-family: Helvetica, Arial, sans-serif;">
                                                            <tspan id="SvgjsTspan1532">20</tspan>
                                                            <title>20</title>
                                                        </text>
                                                        <text id="SvgjsText1534" font-family="Helvetica, Arial, sans-serif" x="20" y="179.58960000000002" text-anchor="end" dominant-baseline="auto" font-size="11px" font-weight="400" fill="#373d3f" class="apexcharts-text apexcharts-yaxis-label " style="font-family: Helvetica, Arial, sans-serif;">
                                                            <tspan id="SvgjsTspan1535">10</tspan>
                                                            <title>10</title>
                                                        </text>
                                                        <text id="SvgjsText1537" font-family="Helvetica, Arial, sans-serif" x="20" y="216.61200000000002" text-anchor="end" dominant-baseline="auto" font-size="11px" font-weight="400" fill="#373d3f" class="apexcharts-text apexcharts-yaxis-label " style="font-family: Helvetica, Arial, sans-serif;">
                                                            <tspan id="SvgjsTspan1538">0</tspan>
                                                            <title>0</title>
                                                        </text>
                                                    </g>
                                                </g>
                                                <g id="SvgjsG1442" class="apexcharts-annotations"></g>
                                            </svg>
                                            <div class="apexcharts-legend" style="max-height: 128px;"></div>
                                            <div class="apexcharts-tooltip apexcharts-theme-light">
                                                <div class="apexcharts-tooltip-title" style="font-family: Helvetica, Arial, sans-serif; font-size: 12px;"></div>
                                                <div class="apexcharts-tooltip-series-group" style="order: 1;">
                                                    <span class="apexcharts-tooltip-marker" style="background-color: rgb(114, 124, 245);"></span>
                                                    <div class="apexcharts-tooltip-text" style="font-family: Helvetica, Arial, sans-serif; font-size: 12px;">
                                                        <div class="apexcharts-tooltip-y-group">
                                                            <span class="apexcharts-tooltip-text-y-label"></span>
                                                            <span class="apexcharts-tooltip-text-y-value"></span>
                                                        </div>
                                                        <div class="apexcharts-tooltip-goals-group">
                                                            <span class="apexcharts-tooltip-text-goals-label"></span>
                                                            <span class="apexcharts-tooltip-text-goals-value"></span>
                                                        </div>
                                                        <div class="apexcharts-tooltip-z-group">
                                                            <span class="apexcharts-tooltip-text-z-label"></span>
                                                            <span class="apexcharts-tooltip-text-z-value"></span>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="apexcharts-tooltip-series-group" style="order: 2;">
                                                    <span class="apexcharts-tooltip-marker" style="background-color: rgb(227, 234, 239);"></span>
                                                    <div class="apexcharts-tooltip-text" style="font-family: Helvetica, Arial, sans-serif; font-size: 12px;">
                                                        <div class="apexcharts-tooltip-y-group">
                                                            <span class="apexcharts-tooltip-text-y-label"></span>
                                                            <span class="apexcharts-tooltip-text-y-value"></span>
                                                        </div>
                                                        <div class="apexcharts-tooltip-goals-group">
                                                            <span class="apexcharts-tooltip-text-goals-label"></span>
                                                            <span class="apexcharts-tooltip-text-goals-value"></span>
                                                        </div>
                                                        <div class="apexcharts-tooltip-z-group">
                                                            <span class="apexcharts-tooltip-text-z-label"></span>
                                                            <span class="apexcharts-tooltip-text-z-value"></span>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="apexcharts-yaxistooltip apexcharts-yaxistooltip-0 apexcharts-yaxistooltip-left apexcharts-theme-light">
                                                <div class="apexcharts-yaxistooltip-text"></div>
                                            </div>
                                        </div>
                                    </div>
                                </div>   
                            </div> <!-- end card-body-->
                        </div> <!-- end card-->
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