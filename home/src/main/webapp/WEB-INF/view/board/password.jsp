<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/view/template/header.jsp"%>
<style>
.form-input2{
	margin: 20px 0 50px;
	width:250px;
}

.form-input2[type=password]{
	padding:10px;
}
</style>


<div class="empty-row"></div>
<div class="empty-row"></div>
<div class="empty-row"></div>
<div class="area-20 center">
	<div class="row text-center font-small">비밀번호 입력</div>
	<form action="password?no=${no}" method="post">
		<%-- <input type="hidden" name="no" value="${no}"> --%>
		<div class="row inner-align-left">
			<div class="fill">
				<input class="form-input2" type="password" name="pw" placeholder="비밀번호" required maxlength="20">
			</div>
			<div class="join-button">
				<input type="submit" value="확인">
			</div>
		</div>
	</form>
</div>
<div class="empty-row"></div>
<div class="empty-row"></div>

<%@ include file="/WEB-INF/view/template/footer.jsp"%>
