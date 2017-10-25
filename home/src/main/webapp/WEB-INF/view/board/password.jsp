<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/view/template/header.jsp"%>

<div class="empty-row"></div>
<div class="empty-row"></div>
<div class="empty-row"></div>
<div class="area-20 center">
	<div class="row text-center font-big">비밀번호 입력</div>
	<form action="password?no=${no}" method="post">
		<%-- <input type="hidden" name="no" value="${no}"> --%>
		<div class="row inner-align-left">
			<div class="fill">
				<input class="form-input" type="password" name="pw" placeholder="비밀번호" required maxlength="20">
			</div>
			<div>
				<input class="form-btn" type="submit" value="확인">
			</div>
		</div>
	</form>
</div>
<div class="empty-row"></div>
<div class="empty-row"></div>

<%@ include file="/WEB-INF/view/template/footer.jsp"%>
