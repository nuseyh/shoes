<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!Doctype HTML>
<html>
<head>
<title>이미지 게시판</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/main.css">
</head>
<main>
<form action="itemadd" method="post">
	<body>
		<div class="empty-row"></div>
		<div class="empty-row"></div>
		<div class="area-50 center">
			<div class="row line-black" align="center">
				<h1>게시판 홈</h1>
			</div>
			<div class="empty-row"></div>
			<div class="row" align="center">
				<h2>
					<a href="imageboard/itemadd">상품 등록</a>
				</h2>
			</div>
			<div class="empty-row"></div>
			<div class="row" align="center">
				<h2>
					<a href="imageboard/list">상품 목록</a>
				</h2>
			</div>
		</div>
	</body>
</form>
</main>
</html>