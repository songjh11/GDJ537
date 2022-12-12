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
            <link rel="stylesheet" type="text/css" href="/css/daterangepicker.css" />
            <script defer src="/js/user/un.js"></script>
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
                                <input type="text" id="regdate" name="regDate">
                            </div>
                            <div style="float: left;">
                                <label>이름</label><br>
                                <input type="text" id="getName" name="name">
                            </div>
                            <div id="dep" style="float: left;">
                                <label>사번생성</label><br>
                                <input type="text" id="getID" readonly>
                                <button id="idbtn">생성</button>
                            </div>
                            <br><br><br>
                            <div id=mailf>
                                <form action="../mail/mail" method="post">
                                    <table>
                                        <tr>
                                            <td>메일 주소</td>
                                            <td>
                                                <input type="text" name="address" placeholder="이메일 주소를 입력하세요">
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>제목</td>
                                            <td>
                                                <input type="text" name="title" placeholder="제목을 입력하세요">
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>내용</td>
                                            <td>
                                                <textarea name="contents" id="addContents" placeholder="보낼 내용을 입력하세요">
                                    </textarea>
                                            </td>
                                        </tr>
                                    </table>
                                    <button>발송</button>
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