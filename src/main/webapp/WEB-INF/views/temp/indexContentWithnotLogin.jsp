<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
						  <!-- Outer Row -->
			        <div class="row justify-content-center  ">
			
			            <div class="col-xl-10 col-lg-12 col-md-9">
			
			                <div class="card o-hidden border-0 shadow-lg">
			                    <div class="card-body p-0">
			                        <!-- Nested Row within Card Body -->
			                        <div class="row">
			                            <div class="col-lg-6 d-none d-lg-block bg-login-image bg-gradient-primary"></div>
			                            <div class="col-lg-6">
			                                <div class="p-5">
			                                    <div class="text-center">
			                                        <h1 class="h4 text-gray-900 mb-4">Welcome Goodee!</h1>
			                                    </div>
			                                    <form class="user" action="/user/login" method="post">
			                                        <div class="form-group">
			                                            <input type="text" class="form-control form-control-user"
			                                                id="exampleInputEmail" name="id" aria-describedby="emailHelp"
			                                                placeholder="아이디 입력하세요">
			                                        </div>
			                                        <div class="form-group">
			                                            <input type="password" name="pw" class="form-control form-control-user"
			                                                id="exampleInputPassword" placeholder="비밀번호 입력해주세요">
			                                        </div>
			                                        <div class="form-group">
			                                            <div class="custom-control custom-checkbox small">
			                                                <input type="checkbox" class="custom-control-input" id="customCheck">
			                                                <label class="custom-control-label" for="customCheck">Remember
			                                                    Me</label>
			                                            </div>
			                                        </div>
<!-- 			                                        <a href="index.html" class="btn btn-primary btn-user btn-block">
			                                            Login
			                                        </a> -->
			                                        <button type="submit" class="btn btn-primary btn-user btn-block">로그인</button>
			                                        <hr>

			                                        <button type="button" class="btn btn-google btn-user btn-block" data-bs-toggle="modal" data-bs-target="#findPwModal" data-bs-whatever="@mdo">비밀번호 찾기</button>
			                                        <a href="/user/join" class="btn btn-facebook btn-user btn-block" >회원 가입</a>
			                                    </form>
			                                    <hr>
			                         
			                                </div>
			                            </div>
			                        </div>
			                    </div>
			                </div>
			                <!-- Outer Row 끝 -->
	            </div>
	            <!-- End Page Content -->
				</div>	
			
			
			<!-- ------------------ modal ------------------ -->
	<div class="modal fade" id="findPwModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="exampleModalLabel">비밀번호 찾기</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <form action="/mail/findpw" method="post">
         <div class="mb-3">
             <label for="member-email" class="col-form-label"><strong>사원번호를 입력하세요</strong>:</label>
             <input type="text" class="form-control" id="member-email" name="id"></input>
          </div>
          <div class="mb-3">
             <label for="member-email" class="col-form-label"><strong>가입한 Email을 입력하세요</strong>:</label>
             <input type="email" class="form-control" id="member-email" name="email"></input>
          </div>
  
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
        <button type="submit" class="btn btn-primary">비밀번호 찾기</button>
      </div>
        </form>
      </div>
    </div>
  </div>
</div>
	<script
  defer
  src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"
  integrity="sha384-u1OknCvxWvY5kfmNBILK2hRnQC3Pr17a+RTT6rIHI7NnikvbZlHgTPOOmMi466C8"
  crossorigin="anonymous"
></script>


	<!-- Scroll Top, Logout Modal import -->
	<c:import url="./temp/layout_top_logoutModal.jsp"></c:import>
	<!-- ------------------ modal END ------------------ -->