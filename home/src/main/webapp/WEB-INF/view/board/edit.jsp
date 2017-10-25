<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/view/template/header.jsp"%>

<div class="empty-row"></div>
<div class="area-80 center">
	<div class="row text-center font-big">게시글 수정</div>
	<div class="row">
		<form action="edit?no=${board.getNo()}" method="post">
			<table class="table-noborder">
				<tbody>
					<tr>
						<th width="20%">작성자</th>
						<td><input class="form-input" type="text" name="writer"
							required value="${board.getWriter()}" readonly></td>
					</tr>
					<tr>
						<th width="20%">제목</th>
						<td><input class="form-input" type="text" name="title"
							required value="${board.getTitle()}" readonly></td>
					</tr>
					<tr>
						<th width="20%">내용</th>
						<td><textarea class="form-input" name="detail" rows="10"
								required>${board.getDetail()}</textarea></td>
					</tr>
					<tr>
						<th width="20%">비밀번호</th>
						<td><input class="form-input" type="password" name="pw"
							required maxlength="20"></td>
					</tr>
				</tbody>


			</table>
			<div class="join-button">
				<input class="form-btn" type="submit" value="수정하기">
				<input class="form-btn" type="button" value="목록으로" onclick="location.href='list'">
			</div>
		</form>
	</div>
</div>
<div class="empty-row"></div>
<div class="empty-row"></div>

<%@ include file="/WEB-INF/view/template/footer.jsp"%>
