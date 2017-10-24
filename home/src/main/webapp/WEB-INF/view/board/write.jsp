<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/view/template/header.jsp"%>

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/jquery-te-1.4.0.css">
<link rel="">
<script src="${pageContext.request.contextPath}/js/jquery-te-1.4.0.js"></script>
<script>
	$(document).ready(function(){
		//에디터로 변경
		$("#editor").jqte({
			b:false
			});
        });
</script>

<div class="empty-row"></div>
<div class="area-90 center">
	<div class="row text-center font-big">게시글 쓰기</div>
	<div class="row">
		<form action="write" method="post">
			<c:if test="${not empty title}">
				<input type="hidden" name="gno" value="${gno}">
				<input type="hidden" name="parent" value="${parent}">
				<input type="hidden" name="depth" value="${depth}">
			</c:if>
			<table class="table-noborder">
				<tbody>
					<tr>
						<th width="20%">작성자</th>
						<td colspan="2"><input class="form-input" type="text"
							name="writer" placeholder="${userId}" required></td>
					</tr>
					<tr>
						<th width="20%">제목</th>
						<td width="30%"><select name="notice" class="form-select">
								<option value="Q">문의입니다</option>
								<option value="후기">후기입니다</option>
								<option value="공지">공지입니다!</option>
						</select></td>
						<td><input class="form-input" type="text" name="title"
							required></td>
					</tr>
					<tr>
						<th width="20%">내용</th>
						<td colspan="2">
							<textarea id="editor" class="form-input" name="detail" rows="10" required></textarea>
						</td>
					</tr>
					<tr>
						<th width="20%">비밀번호</th>
						<td><input class="form-input" type="password" name="pw"
							required maxlength="20"></td>
					</tr>
				</tbody>
				<tfoot>
					<tr>
						<th colspan="2" align="right">
							<input onclick="location.href='list';" class="form-btn" type="button" value="목록으로">
							<input class="form-btn" type="submit" value="등록하기">
						</th>
					</tr>
				</tfoot>
			</table>
		</form>
	</div>
</div>
<div class="empty-row"></div>
<div class="empty-row"></div>

<%@ include file="/WEB-INF/view/template/footer.jsp"%>
