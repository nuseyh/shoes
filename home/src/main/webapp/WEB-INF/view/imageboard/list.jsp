<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/view/template/header.jsp"%>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/main.css">
<script type="text/javascript"
	src="http://code.jquery.com/jquery-2.1.0.min.js"></script>
<script>
	window.onload = function() {
		var all = document.querySelector("#all");
		all.addEventListener("click", function() {
			//console.log(this.checked);
			var list = document
					.querySelectorAll("input[type=checkbox]:not(#all)");
			for (var i = 0; i < list.length; i++) {
				list[i].checked = this.checked;
			}
		});
	};
</script>
<style>
table {
	border: 1px solid black;
}

tr {
	border: 1px solid black;
}

td {
	border: 1px solid black;
}

img {
	width: 100px;
	height: auto;
}
</style>
</head>
<div class = "user-list">
<form action="list" method="post">

	<table>
	<caption>Item List</caption>
		<tr>
			<td scope="col"><input type=checkbox id=all></td>
			<td scope="col">상품 번호</td>
			<td scope="col">이미지</td>
			<td scope="col">아이템 이름</td>
			<td scope="col">아이템 가격</td>
			<td scope="col">설명</td>
			<td scope="col">아이템 유형</td>

		</tr>
		<c:forEach var="product" items="${list}">
			<tr>
				<td scope="row"><input name="check" type="checkbox"
					value="${product.i_name }"><span></span></td>
				<td scope="row">${product.i_num}</td>
				<td><img id="cb"
					src="${pageContext.request.contextPath}/file/${product.savename}">

				</td>
				<td>${product.i_name }</td>
				<td>${product.i_price }</td>
				<td>${product.i_detail}</td>
				<td>${product.i_type}</td>

			</tr>

		</c:forEach>
	</table>
	<div class = "join-button">
	<input type="button" value=등록 onclick="location.href='itemadd';">
	<input type="submit" value=삭제>
	</div>
</form>
</div>

<%@ include file="/WEB-INF/view/template/footer.jsp"%>