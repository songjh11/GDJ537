<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

<div style="width: 50%">
   <!-- Approach -->
     <div class="card shadow mb-4" style=" height: 230px">
         <div class="card-body">
            <div class="d-flex">
	        <c:choose>
		    	<c:when test="${userVO.profile eq null}">
		    		<img src="/img/user/user.webp" class="rounded" alt="..." style="width: 180px; margin-right: 1.3em">
		    	</c:when>
		    	<c:otherwise>
		            <img src="/file/profile/${userVO.profile}" class="rounded" alt="..." style="width: 180px; margin-right: 1.3em">
		    	</c:otherwise>
	 		</c:choose>
            <div style="margin-top: 10px">
               <h4 style="color: black; margin-bottom: 10px">${userVO.name}</h4>
               <span>사원번호 : ${userVO.id}</span><br/>
               <span>직급 : ${userVO.roleVO.roleName}</span><br/>
               <span>부서명 : ${userVO.departmentVO.depName}</span><br/>
               <span>이메일 : ${userVO.email}</span><br/>
               <span>전화번호 : ${userVO.phone}</span>
            </div>
            </div>
         </div>
     </div>
     
     <!-- Approach -->
      <div class="card shadow mb-4" style="height: 161px">
          <div class="card-header py-3">
              <h6 class="m-0 font-weight-bold text-primary">today's schedule</h6>
          </div>
          <div class="card-body">
              <p class="mb-0"></p>
          </div>
      </div>
  </div>
                    
