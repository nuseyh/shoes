<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/view/template/header.jsp"%>

<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/jquery-te-1.4.0.css">
<link rel="">
<script src="${pageContext.request.contextPath}/js/jquery-te-1.4.0.js"></script>
<script>
	$(document).ready(function() {
		//에디터로 변경
		$("#editor").jqte({
			b : false
		});
	});
</script>
<style>
.writer table {
	width: 70%;
	border: 1px solid black;
}

.writer th {
	text-align:left;
	padding: 10px 0 10px 20px;
}

.write td {
	
}

.write select{
	width:100%;
}
</style>

<div class="empty-row"></div>
<div class="area-100 center">
	<div class="row text-center font-small">상품 문의</div>
	<div class="row">

		<div class="writer center">
			<form action="write" method="post">
				<c:if test="${not empty title}">
					<input type="hidden" name="gno" value="${gno}">
					<input type="hidden" name="parent" value="${parent}">
					<input type="hidden" name="depth" value="${depth}">
				</c:if>
				<table class="center">
					<tbody>
						<tr>
							<th width="15%">작성자</th>
							<td colspan="2"><input class="form-input" type="text"
								name="writer" placeholder="${id}" required></td>
						</tr>
						<tr>
							<th>제목</th>
							<td><select name="notice" class="form-select">
									<option value="Q">문의입니다</option>
									<option value="후기">후기입니다</option>
									<option value="공지">공지입니다!</option>
							</select></td>
						</tr>
						<tr>
							<td colspan="3"><textarea id="editor" class="form-input"
									name="detail" rows="10" required></textarea></td>
						</tr>
						<tr>
							<th>비밀번호</th>
							<td><input class="form-input" type="password" name="pw"
								required maxlength="20"></td>
						</tr>
					</tbody>
				</table>
				<div class="join-button">
					<input class="form-btn" type="submit" value="등록하기"> <input
						onclick="location.href='list';" class="form-btn" type="button"
						value="목록으로">
				</div>
			</form>
		</div>
	</div>
</div>
<div class="empty-row"></div>
<div class="empty-row"></div>

<%@ include file="/WEB-INF/view/template/footer.jsp"%>
