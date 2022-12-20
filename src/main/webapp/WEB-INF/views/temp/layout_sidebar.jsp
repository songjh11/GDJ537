<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>


<ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

            <!-- Sidebar - Brand -->
            <a class="sidebar-brand d-flex align-items-center justify-content-center" href="/">
                <div class="sidebar-brand-icon rotate-n-15">
                    <i class="fas fa-laugh-wink"></i>
                </div>
                <div class="sidebar-brand-text mx-3">Goodee Company</div>
            </a>

            <!-- Divider -->
            <hr class="sidebar-divider my-0">

            <!-- Nav Item - Dashboard -->
            <li class="nav-item">

                <a class="nav-link" href="/">

                    <i class="fas fa-fw fa-tachometer-alt"></i>
                    <span>Goodee</span></a>
            </li>

            <!-- Divider -->
            <hr class="sidebar-divider">

            <!-- Heading -->
 
            <!-- Nav Item - Board Collapse Menu -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseBoard"
                    aria-expanded="true" aria-controls="collapseBoard">
                    <i class="fas fa-fw fa-cog"></i>
                    <span>게시판</span>
                </a>
                <div id="collapseBoard" class="collapse" aria-labelledby="headingBoard" data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <a class="collapse-item" href="/notice/list">공지사항</a>
                        <a class="collapse-item" href="/request/list">요청게시판</a>
                        <a class="collapse-item" href="/unknown/list">익명게시판</a>
                    </div>
                </div>
            </li>
            
            <!-- Divider -->
            <hr class="sidebar-divider">


            <!-- Nav Item - Schedule Collapse Menu -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseSchedule"
                    aria-expanded="true" aria-controls="collapseSchedule">
                    <i class="fas fa-fw fa-wrench"></i>
                    <span>예약</span>
                </a>
                <div id="collapseSchedule" class="collapse" aria-labelledby="headingSchedule"
                    data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <h6 class="collapse-header">예약 현황</h6>
                        <a class="collapse-item" href="/goods/calendar">캘린더</a>  
                        <h6 class="collapse-header">예약 바로가기</h6>
                        <a class="collapse-item" href="/goods/room/roomList">회의실 예약</a>
                        <a class="collapse-item" href="/goods/car/carList">차량 예약</a>
						
                    </div>
                </div>
            </li>

            <!-- Divider -->
            <hr class="sidebar-divider">

            <!-- Nav Item - 보고서 Collapse Menu -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseReport"
                    aria-expanded="true" aria-controls="collapseReport">
                    <i class="fas fa-fw fa-folder"></i>
                    <span>보고서</span>
                </a>
                <div id="collapseReport" class="collapse" aria-labelledby="headingReport" data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                      
                      	
                      	  

                        
                      
                        <sec:authorize access="isAuthenticated()">
 						<sec:authentication property="Principal" var="member"/>
                     	<c:if test="${member.reportVO.lstatus >= 2}">
                        <a class="collapse-item" href="/report/doreport?depNum=${member.depNum}">결제/반려 승인</a>
                        <a class="collapse-item" href="/report/licenserList">전체 승인자 리스트</a>
                     	</c:if>
                        <c:if test="${member.reportVO.lstatus eq 3}">	
                        <a class="collapse-item" href="/report/insa">휴가담당 관리자</a>
                        </c:if>
                        <c:if test="${member.reportVO.lstatus ne 3}">
                        <a class="collapse-item" href="/kdy/reportAdd">보고서 작성</a>
                        </c:if>
                        
                        <%-- <sec:authorize access="hasRole('ADMIN')"> --%>
                        <c:choose>
                      		<c:when test="${member.reportVO.lstatus >= 0 && member.roleNum ne 1}">
                      			<a class="collapse-item" href="/report/reportMyPage">나의 결재선</a>
                      		</c:when>
                      	</c:choose>
						<%-- </sec:authorize> --%>
						</sec:authorize>
						<c:if test="${member.reportVO.lstatus ne 3}">
                        	<a class="collapse-item" href="/report/mylist?cat=1">결재 신청 목록</a>
                     	</c:if>
                        
                    </div>
                </div>
			</li>


            <!-- Divider -->
            <hr class="sidebar-divider">
            <!-- Nav Item - Messanger -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseMessenger"
                    aria-expanded="true" aria-controls="collapseReport">
                    <i class="fas fa-fw fa-folder"></i>
                    <span>Messenger</span>
                </a>
                <!-- <a class="nav-link" href="/messenger/chat">
                    <i class="fas fa-fw fa-chart-area"></i>
                    <span>Messenger</span>
                </a> -->
                <div id="collapseMessenger" class="collapse" aria-labelledby="headingMessenger" data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <a class="collapse-item" href="/messenger/chat">채팅</a>
                        <a class="collapse-item" href="/messenger/note">쪽지</a>
                        
                    </div>
                </div>
            </li>

            <!-- Nav Item - Tables -->
            <!-- <li class="nav-item">
                <a class="nav-link" href="tables.html">
                    <i class="fas fa-fw fa-table"></i>
                    <span>Tables</span></a>
            </li> -->

            <!-- Divider -->
            <sec:authorize access="hasAnyAuthority('사장', '부장', '과장', '관리자')">



            <hr class="sidebar-divider d-none d-md-block">
            <!-- Nav Item - 관리자 -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="/user/admin/wait" data-toggle="collapse" data-target="#collapseAdmin"
                aria-expanded="true" aria-controls="collapseAdmin">
                    <i class="fas fa-fw fa-table"></i>
                    <span>관리자</span>
                </a>
                <div id="collapseAdmin" class="collapse" aria-labelledby="headingAdmin"
                    data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                    <h6 class="collapse-header">인사</h6>
                    <a class="collapse-item" href="/user/admin/wait">인사 관리</a>
                        <h6 class="collapse-header">시설</h6>
                        <a class="collapse-item" href="/goods/ad_list">시설 관리</a>
                        <a class="collapse-item" href="#" data-toggle="collapse" data-target="#collapseReserve" aria-expanded="true" aria-controls="collapseReserve" id="accordionReserve">
                            <!-- <i class="fas fa-fw fa-table"></i> -->
                            <span>예약 통계</span>
                        </a>
                        <div id="collapseReserve" class="collapse" aria-labelledby="headingReserve" data-parent="#accordionReserve">
                            <div class="bg-white py-2 collapse-inner rounded">
                                <a class="collapse-item" href="/goods/ad_room">회의실 예약 통계</a>
                                <a class="collapse-item" href="/goods/ad_car">차량 예약 통계</a>
                            </div>
                        </div>
                    </div>
                </div>
            </li> 
</sec:authorize>
            <!-- Divider -->

            <!-- Sidebar Toggler (Sidebar) -->
            <div class="text-center d-none d-md-inline">
                <button class="rounded-circle border-0" id="sidebarToggle"></button>
            </div>

</ul> 