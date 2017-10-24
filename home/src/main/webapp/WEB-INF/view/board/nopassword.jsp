<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/view/template/header.jsp"%>

<div class="empty-row"></div>
<div class="empty-row"></div>
<div class="empty-row"></div>
<div class="area-20 center">
	<div class="row text-center font-big">비밀번호가 맞지 않습니다</div>
		<div class="row inner-align-left">
			<div class="fill">
				<input class="form-btn" type="button" value="목록" onclick="location.href='list'">
			</div>
			<div>
				<input class="form-btn" type="button" value="다시입력" onclick="location.href='password'">
			</div>
		</div>
</div>

<%@ include file="/WEB-INF/view/template/footer.jsp"%>







