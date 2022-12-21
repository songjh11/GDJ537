<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- meta tag 추가 -->
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Insert title here</title>
<!-- 공통 css, js -->
<c:import url="../temp/layout_header.jsp"></c:import>
<link
  href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css"
  rel="stylesheet"
  integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT"
  crossorigin="anonymous"
/>
<script
  defer
  src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"
  integrity="sha384-u1OknCvxWvY5kfmNBILK2hRnQC3Pr17a+RTT6rIHI7NnikvbZlHgTPOOmMi466C8"
  crossorigin="anonymous"
></script>
<style type="text/css">
   .setUp_form {
     width: 100%;
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
   .setUp_form:hover {
     cursor: not-allowed;
   }
   .setPw_form {
     width: 500px;
     line-height: 1.5;
     border-radius: 2px;
     transition: all 0.3s;
     height: 43px;
     font-size: 16px;
     position: relative;
     outline: none;
     border: none;
     padding-left: 12px;
     box-shadow: rgba(0, 0, 0, 0.02) 0px 1px 3px 0px,
       rgba(27, 31, 35, 0.15) 0px 0px 0px 1px;
   }
   
   .phoneSet_btn {
     position: absolute;
     right: 0px;
     border: none;
     padding: 10px 20px;
     background-color: blue;
     color: white;
     font-weight: bold;
   }
   .phoneSet_btn:hover {
     background-color: skyblue;
   }
   
   .emailSet_btn {
     position: absolute;
     right: 0px;
     border: none;
     padding: 10px 20px;
     background-color: blue;
     color: white;
     font-weight: bold;
   }
   .emailSet_btn:hover {
     background-color: skyblue;
   }
   
   .btnPw_change {
     right: 0px;
     border: none;
     padding: 10px 20px;
     background-color: blue;
     border-radius: 3px;
     color: white;
     font-weight: bold;
     width: 200px;
   }
   .btnPw_change:hover {
     background-color: skyblue;
   }
   /* 프로필 사진변경 */
   #profile_change:hover{
      cursor: pointer;
   }
   
   .profile_btn{
      border: none;
      background-color: transparent;
      color: grey;
   }
   
   /* 변경 모달 */
   .setUp_modal {
     width: 100%;
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
               <div class="container-fluid ps-4 pt-2">
   
                  <!-- Page Heading -->
                  <h1 class="h3 mb-2 text-gray-800">내 정보</h1>
                  
                  <div class="d-flex" style="margin-bottom: 60px">
                  <div class="mt-4" style="width: 500px">
                    <div class="flex-column">
                    <form action="./setting" method="post" enctype="multipart/form-data">
                    <div id="image_container"></div>
                    <c:choose>
                    	<c:when test="${userVO.profile eq null}">
                    		<img id="profile_image" src="/img/user/user.webp" class="rounded" alt="..." style="width: 180px; height:180px; margin-right: 1.3em">
                    	</c:when>
                    	<c:otherwise>
		                    <img id="profile_image" src="/file/user/${userVO.profile}" class="rounded" alt="..." style="width: 180px; height:180px; margin-right: 1.3em">            	
                    	</c:otherwise>
                    </c:choose>
                       <div class="d-flex pt-3">
                          <label for="file" class="profile_btn me-2" id="profile_change" style="padding: 7px 5px 0px 5px">변경</label>
                         <input type="file" name="file" id="file" style="display: none" onchange="setThumbnail(event)"/>
                         <button type="button" class="profile_btn ms-1 me-2" id="profile_delete">삭제</button>
                         <button class="profile_btn ms-1" id="profile_save">완료</button>
                       </div>
                    <input type="text" id="sessionId" name="id" value="${userVO.id}" style="display: none"/>
                    <input type="file" id="profile_file" name="file" style="display: none;">
                    </form>
                      <div class="pb-2 mt-4" style="font-size: 14.5px">사원번호</div>
                      <input class="setUp_form" type="text" value="${userVO.id}" disabled />
                      <div class="pb-2 mt-4" style="font-size: 14.5px">이름</div>
                      <input class="setUp_form" type="text" value="${userVO.name}" disabled />
                      <div style="position: relative">
                        <div class="pb-2 mt-4" style="font-size: 14.5px">
                          입사일
                        </div>
                        <input
                          class="setUp_form"
                          type="text"
                          value="${userVO.entDate}"
                          disabled
                        />
                      </div>
                      <div style="position: relative">
                        <div class="pb-2 mt-4" style="font-size: 14.5px">
                          휴대폰번호
                        </div>
                        <input
                          class="setUp_form"
                          type="text"
                          value="${userVO.phone}"
                          disabled
                        />
                        <button
                          class="phoneSet_btn"
                          type="button"
                          data-bs-toggle="modal"
                          data-bs-target="#exampleModal_setP"
                        >
                          전화번호 변경
                        </button>
                      </div>
                      <div class="pb-2 mt-4" style="font-size: 14.5px">이메일</div>
                      <div style="position: relative">
                        <input
                          class="setUp_form"
                          type="text"
                          value="${userVO.email}"
                          disabled
                        />
                        <button
                          class="emailSet_btn"
                          type="button"
                          data-bs-toggle="modal"
                          data-bs-target="#exampleModal_setE"
                        >
                          이메일 변경
                        </button>
                      </div>
                    </div>
                  </div>
                  
                  <!-- 비밀번호 변경 -->
                <div class="mt-4" style="width: 580px; padding-top: 235px; padding-left: 80px">
                    <div class="flex-column">
                    <div class="pb-2 mt-4" style="font-size: 14.5px">비밀번호</div>
                    <div style="height: 92px">
                      <div class="pb-2" style="font-size: 14.5px">
                        <span style="color: red">＊</span>현재 비밀번호
                      </div>
                      <input
                        id="cur_pw"
                        class="setPw_form"
                        type="password"
                        placeholder="현재 비밀번호를 입력"
                      />
                      <div style="display: none" id="pwText_1"></div>
                      </div>
                      <div style="height: 92px">
                      <div class="pb-2 mt-2" style="font-size: 14.5px">
                        <span style="color: red">＊</span>새 비밀번호
                      </div>
                      <input
                        id="new_pw"
                        class="setPw_form"
                        type="password"
                        placeholder="8~20자리의 비밀번호"
                      />
                      <div style="display: none" id="pwText_2"></div>
                      </div>
                      
                      <div class="pb-2 mt-2" style="font-size: 14.5px">
                        <span style="color: red">＊</span>새 비밀번호 확인
                      </div>
                      <div class="d-flex">
                        <input
                          id="new_pwCheck"
                          class="setPw_form"
                          type="password"
                          placeholder="새 비밀번호와 동일하게 입력"
                        />
                        <button class="btnPw_change">비밀번호 변경</button>
                      </div>
                      <div style="display: none" id="pwText_3">비밀번호 틀렸어요</div>
                    </div>
                  </div>
                  
                  <button id="setPw_modal" data-bs-toggle="modal" data-bs-target="#exampleModal_setPw_input2" style="display: none"></button>
                  <!-- 비밀번호 재입력안내 -->
                <div
                  class="modal fade"
                  id="exampleModal_setPw_input2"
                  tabindex="-1"
                  aria-labelledby="exampleModalLabel"
                  aria-hidden="true"
                >
                  <div class="modal-dialog modal-dialog-centered">
                    <div class="modal-content">
                      <div class="modal-body">
                        <div class="d-flex pt-4">
                          <div class="ps-4 pe-3" style="font-size: 28px; color: red">
                            <i class="fa-solid fa-triangle-exclamation"></i>
                          </div>
                          <div
                            class="pt-2"
                            style="color: red; font-size: 17px; line-height: 28px"
                          >
                            <b id="pwCheck_setText2">비밀번호가 일치하지 않습니다.</b>
                          </div>
                        </div>
                      </div>
                      <div class="d-flex justify-content-end pb-4 ps-4 pe-4">
                        <button
                          type="button"
                          class="btn btn-primary"
                          style="border-radius: 18px; padding: 6px 18px"
                          data-bs-dismiss="modal"
                        >
                          확인
                        </button>
                      </div>
                    </div>
                  </div>
                </div>
                  
                  <button id="setPw_change" data-bs-toggle="modal" data-bs-target="#exampleModal_setPw_input3" style="display: none"></button>
                  <!-- 비밀번호 변경 실패 및 성공 확인 -->
                <div
                  class="modal fade"
                  id="exampleModal_setPw_input3"
                  tabindex="-1"
                  aria-labelledby="exampleModalLabel"
                  data-bs-backdrop="static"
                  aria-hidden="true"
                >
                  <div class="modal-dialog modal-dialog-centered">
                    <div class="modal-content">
                      <div class="modal-body">
                        <div class="d-flex pt-4">
                          <div class="ps-4 pe-3" style="font-size: 28px;">
                            <i id="pwCheck_icon" class="fa-solid fa-triangle-exclamation"></i>
                          </div>
                          <div
                            class="pt-2"
                            style="font-size: 17px; line-height: 28px"
                          >
                            <b id="pwCheck_setText3">비밀번호가 일치하지 않습니다.</b>
                          </div>
                        </div>
                      </div>
                      <div class="d-flex justify-content-end pb-4 ps-4 pe-4">
                        <button
                          type="button"
                          class="btn btn-primary"
                          style="border-radius: 18px; padding: 6px 18px"
                          data-bs-dismiss="modal"
                          onclick="location.href='/user/setting'"
                        >
                          확인
                        </button>
                      </div>
                    </div>
                  </div>
                </div>
               
               </div>
               </div>
               <!-- End Page Content -->
               
          <!-- 이메일 변경 Modal -->
            <div
              class="modal fade"
              id="exampleModal_setE"
              tabindex="-1"
              aria-labelledby="exampleModalLabel"
              aria-hidden="true"
            >
              <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                  <div
                    class="modal-header"
                    style="
                      background-color: blue;
                      color: white;
                      padding: 8px 20px;
                    "
                  >
                    <h3 class="modal-title fs-5" id="exampleModalLabel">
                      이메일 변경
                    </h3>
                    <button
                      type="button"
                      class="btn-close"
                      data-bs-dismiss="modal"
                      aria-label="Close"
                    ></button>
                  </div>
                  <div class="modal-body">
                    <!-- 이메일 입력 -->
                    <div class="me-2 ms-2">
                      <label class="mt-2 mb-3" style="font-size: 14px"
                        ><span style="color: red">＊</span
                        ><b>변경할 이메일 주소</b></label
                      >
                      <div class="d-flex mb-3">
                        <input
                          path="e"
                          placeholder="이메일을 입력해주세요."
                          class="setUp_modal"
                          id="email_e"
                        />
                        <span
                          class="ps-1 pe-1"
                          style="line-height: 40px; font-size: 17px"
                          >@</span
                        >
                        <select
                          path="mailOption"
                          class="form-select setUp_modal"
                          id="email_option"
                        >
                          <option selected hidden>선택</option>
                          <option value="naver.com">naver.com</option>
                          <option value="hanmail.net">hanmail.net</option>
                          <option value="nate.com">nate.com</option>
                          <option value="gmail.com">gmail.com</option>
                        </select>
                      </div>
                      <div id="emailUpdate_Check" style="display:none">
                          <i class="fa-solid fa-circle-exclamation"></i> <b id="emailUpdate_b">정확한
                          정보를 입력해주세요.</b>
                       </div>
                    </div>
                  </div>
                  <div class="modal-footer">
                    <button
                      type="button pe-4 ps-4"
                      class="btn btn-outline-secondary"
                      data-bs-dismiss="modal"
                      style="border-radius: 24px"
                    >
                      취소
                    </button>
                    <button
                      type="button"
                      class="btn btn-outline-info pe-3 ps-3"
                      style="border-radius: 24px"
                      id="emailUpdate_btn"
                    >
                      이메일 변경
                    </button>
                  </div>
                </div>
              </div>
            </div>

            <!-- 번호변경 Modal -->
            <div
              class="modal fade"
              id="exampleModal_setP"
              tabindex="-1"
              aria-labelledby="exampleModalLabel"
              aria-hidden="true"
            >
              <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                  <div
                    class="modal-header"
                    style="
                      background-color: blue;
                      color: white;
                      padding: 8px 20px;
                    "
                  >
                    <h3 class="modal-title fs-5" id="exampleModalLabel">
                      전화번호 변경
                    </h3>
                    <button
                      type="button"
                      class="btn-close"
                      data-bs-dismiss="modal"
                      aria-label="Close"
                    ></button>
                  </div>
                  <div class="modal-body mb-1">
                    <div class="me-2 ms-2">
                      <label class="mt-2 mb-3" style="font-size: 14px"
                        ><span style="color: red">＊</span
                        ><b>변경할 번호</b></label
                      >
                      <div>
                        <input
                          path="phone"
                          placeholder="-제외 휴대폰 번호를 입력해주세요."
                          class="setUp_modal mb-2"
                          id="phoneUpdate_input"
                        />
                        <div style="display: none" id="phoneUpdate_Check">
                          <i class="fa-solid fa-circle-exclamation"></i> <b id="phoneUpdate_b">정확한
                          정보를 입력해주세요.</b>
                        </div>
                      </div>
                    </div>
                  </div>
                  <div class="modal-footer">
                    <button
                      type="button pe-4 ps-4"
                      class="btn btn-outline-secondary"
                      data-bs-dismiss="modal"
                      style="border-radius: 24px"
                    >
                      취소
                    </button>
                    <button
                      id="phoneUpdate_btn"
                      type="button"
                      class="btn btn-outline-info pe-3 ps-3"
                      style="border-radius: 24px"
                    >
                      번호 변경
                    </button>
                  </div>
                </div>
              </div>
            </div>
               
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
   <script>
      function setThumbnail(event) {
        let reader = new FileReader();

        reader.onload = function(event) {
          let img = document.createElement("img");
          img.setAttribute("src", event.target.result);
          img.setAttribute("style", "width: 180px; height: 180px; margin-right: 1.3em; border-radius: 4px");
          document.querySelector("div#image_container").appendChild(img);
          document.querySelector("#profile_image").setAttribute("style","display:none");
          document.querySelector("#profile_change").setAttribute("style","background-color: #dcdcdc;cursor: not-allowed;"); 
          document.querySelector("#profile_change").setAttribute("style","display:none"); 
          document.querySelector("#profile_save").innerText = "적용"; 
          document.querySelector("#profile_delete").setAttribute("style","display:none");
        };
        reader.readAsDataURL(event.target.files[0]);

      }
    </script>
    <!-- jquery -->
    <script
     type="text/javascript"
     src="//code.jquery.com/jquery-3.6.0.min.js"
   ></script> 
    <script src="/js/user/set.js"></script>
</body>
</html>