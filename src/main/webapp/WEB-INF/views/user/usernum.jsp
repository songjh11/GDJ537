<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
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
            <script defer type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
            <script defer type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
            <script defer src="/js/user/daterangepicker.js"></script>
            <script defer src="/js/user/un.js"></script>
            <link rel="stylesheet" type="text/css" href="/css/daterangepicker.css" />
            <style type="text/css">
                .setUp_form {
            width: 50%;
            line-height: 1.5;
            border-radius: 2px;
            transition: all 0.3s;
            height: 43px;
            font-size: 16px;
            position: relative;
            outline: none;
            border: none;
            padding-left: 10px;
            box-shadow: rgba(0, 0, 0, 0.02) 0px 1px 3px 0px,
            rgba(27, 31, 35, 0.15) 0px 0px 0px 1px;
            }
            .btn2{
                box-shadow: rgba(99, 99, 99, 0.2) 0px 2px 8px 0px;
                border-radius: 10px;
                padding: 5px;
                margin-top: 34px; 
                border: none; 
                font-size: 16px;
                width: 50px;
                height: 40px;
            }
            .btn2:hover {
                font-weight: bold;
            }
            </style>
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
                            <div style="float: left;">
                                <label>입사 날짜</label><br>
                                <input class="setUp_form" style="width: 90%;" type="text" id="regdate" name="regDate">
                            </div>
                            <div style="float: left;">
                                <label>이름</label><br>
                                <input class="setUp_form" style="width: 90%;" type="text" id="getName" name="name">
                            </div>
                            <div id="dep" style="float: left;">
                                <label>사번생성</label><br>
                                <input class="setUp_form" style="width: 90%;" type="text" id="getID" readonly>
                            </div>
                            <button class="btn btn-primary btn2" style="float: left;" id="idbtn">생성</button>
                            <br><br><br>
                            <div id=mailf>
                                <form action="../mail/mail" method="post">
                                    <div class="pb-2 mt-4" style="font-size: 14.5px">메일 주소</div>
                                    <input class="setUp_form" type="text" name="address" placeholder="이메일 주소를 입력하세요">
                                    <div class="pb-2 mt-4" style="font-size: 14.5px">메일 제목</div>
                                    <input class="setUp_form" type="text" name="title" placeholder="제목을 입력하세요">
                                    <div class="pb-2 mt-4" style="font-size: 14.5px">메일 내용</div>
                                    <textarea class="setUp_form" style="height: 300px;" name="contents" id="addContents" placeholder="보낼 내용을 입력하세요"></textarea><br>
                                    <button class="btn btn-primary btn2">발송</button>
                                </form>
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

            <!-- Scroll Top, Logout Modal import -->
            <c:import url="../temp/layout_top_logoutModal.jsp"></c:import>
        </body>

        </html>