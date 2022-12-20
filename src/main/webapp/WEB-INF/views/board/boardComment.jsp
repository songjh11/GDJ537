<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:forEach items="${list}" var="commentVO">
		<div class="d-flex justify-content-between">
			<div class="mb-2 mt-3">
				<div style="display: flex;">
					<div style="width: 80px; height: 80px;">
						<!-- profile -->
						<c:if test="${commentVO.sort eq '익명'}">
							<img alt="" src="/img/anonymous.png">
						</c:if>
						<img alt="" src="/file/profile/${commentVO.userVO.profile}">
					</div>
					<div style="margin-left: 10px; display: flex; flex-direction: column;">
						<c:if test="${commentVO.sort eq '익명'}">
							<div style="font-size: 20px;">익명</div>
						</c:if>
						<c:if test="${commentVO.sort ne '익명'}">
							<div style="font-size: 20px;">${commentVO.userVO.name}</div>
						</c:if>
						<div style="font-size: 20px; margin-left:10px;">${commentVO.contents}</div>
					</div>
					<c:if test="${not empty commentVO.updateDate}">
						<div><fmt:formatDate value="${commentVO.updateDate}" pattern="yyyy-MM-dd HH:mm:ss"/> (수정됨)</div>
					</c:if>
					<c:if test="${empty commentVO.updateDate}">
						<div><fmt:formatDate value="${commentVO.regDate}" pattern="yyyy-MM-dd HH:mm:ss"/></div>
					</c:if>
				</div>
			</div>
			<div>
				<button class="btn btn-primary update" data-commentnum="${commentVO.id}">수정</button>
				<button class="btn btn-danger delete" data-commentnum="${commentVO.id}">삭제</button>
			</div>
		</div>
		<hr style="width: 95%">
	</c:forEach>
</body>
</html>