<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:forEach items="${list}" var="commentVO">
		<div class="d-flex justify-content-between">
			<div class="mb-3">
				<div style="display: flex;">
					<div style="width: 80px; height: 80px;">
						<!-- profile -->
						<img alt="" src="/file/profile/${commentVO.userVO.profile}">
					</div>
					<div style="margin-left: 10px; display: flex; flex-direction: column;">
						<div style="font-size: 20px;">${commentVO.userVO.name}</div>
						<div style="font-size: 20px; margin-left:10px;">${commentVO.contents}</div>
					</div>
					<div>${commentVO.regDate}</div>
					<div>${commentVO.updateDate}</div>
				</div>
			</div>
			<div>
				<button class="btn btn-primary update" data-commentnum="${commentVO.id}">수정</button>
				<button class="btn btn-danger delete" data-commentnum="${commentVO.id}">삭제</button>
			</div>
		</div>
	</c:forEach>
</body>
</html>