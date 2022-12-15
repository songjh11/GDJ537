<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>  

<ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

            <!-- Sidebar - Brand -->
            <a class="sidebar-brand d-flex align-items-center justify-content-center" href="index.html">
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
                    <span>Board</span>
                </a>
                <div id="collapseBoard" class="collapse" aria-labelledby="headingBoard" data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <h6 class="collapse-header">Board List</h6>
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
                        <h6 class="collapse-header">예약 List</h6>
                        <a class="collapse-item" href="#">회의실 예약</a>
                        <a class="collapse-item" href="#">출장자동차 예약</a>
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
                        <a class="collapse-item" href="#">업무보고서</a>
                        <a class="collapse-item" href="#">휴가신청서</a>
                    </div>
                </div>
			</li>


            <!-- Divider -->
            <hr class="sidebar-divider">
            <!-- Nav Item - Messanger -->
            <li class="nav-item">
                <a class="nav-link" href="/messenger/chat">
                    <i class="fas fa-fw fa-chart-area"></i>
                    <span>Messenger</span></a>
            </li>

            <!-- Nav Item - Tables -->
            <!-- <li class="nav-item">
                <a class="nav-link" href="tables.html">
                    <i class="fas fa-fw fa-table"></i>
                    <span>Tables</span></a>
            </li> -->

            <!-- Divider -->
            <sec:authorize access="hasAnyAuthority('사장', '부장', '과장')">
            <hr class="sidebar-divider">
	            <!-- Nav Item - 관리자 -->
	
	            <li class="nav-item">
	                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseAdmin"
	                    aria-expanded="true" aria-controls="collapseAdmin">
	                    <i class="fas fa-fw fa-folder"></i>
	                    <span>관리자</span>
	                </a>
					
	                <div id="collapseAdmin" class="collapse" aria-labelledby="headingAdmin" data-parent="#accordionSidebar">
	                    <div class="bg-white py-2 collapse-inner rounded">
	                        <h6 class="collapse-header">관리자 List</h6>
	                        <a class="collapse-item" href="/user/admin/wait">인사 관리</a>
	                        <a class="collapse-item" href="#">시설물 관리</a>
	                    </div>
	                </div>
				</li>
			</sec:authorize>

            <hr class="sidebar-divider d-none d-md-block">
            <!-- <li class="nav-item">
                <a class="nav-link" href="/user/admin/wait">
                    <i class="fas fa-fw fa-table"></i>
                    <span>관리자</span></a>
            </li>  -->
            <!-- Divider -->

            <!-- Sidebar Toggler (Sidebar) -->
            <div class="text-center d-none d-md-inline">
                <button class="rounded-circle border-0" id="sidebarToggle"></button>
            </div>

</ul> 