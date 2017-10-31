<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/template/header.jsp"%>

<form action="pwsearch" class="center text-center" method="post">
	<div class="empty-row"></div>
	<div class="center area-70">
		<div class="center area-40">
			<div class="searchId  center">
				<div class="center">
					<strong>아이디</strong>
				</div>
				<div class="center area-50">
					<input type="text" name="id">
				</div>
			</div>
			<div class="searchId">

				<div class="center">
					<strong>이메일</strong>
				</div>
				<div class="center area-50">
					<input type="text" name="email" size="20">
				</div>
			</div>
			<hr>
			<div class="search_btn">
				<input type="submit" value="확인">
			</div>
		</div>
	</div>
	<div class="empty-row"></div>
</form>

<%@ include file="/WEB-INF/view/template/footer.jsp"%>