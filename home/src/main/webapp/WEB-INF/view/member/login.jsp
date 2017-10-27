<!DOCTYPE html>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ include file="/WEB-INF/view/template/header.jsp"%>
<script>

</script>
<div class="page area-60 center">
	<div class="area-60 center">
		<div>	
			<strong>login</strong>
			<hr>
		</div>
		<form action="login" name="loginform" method="post" class="center" onSubmit="return checking();">
			<div class="row">
				<input type="text" class="login_id" name=id placeholder="아이디">
			</div>
			<div class="row">
				<input type="password" class="login_pw" name=pw placeholder="비밀번호">
			</div>
			<div class="row">
				<input type="submit" class="login_btn" onClick="checking();" value="로그인">
			</div>

			<div>
				<input type="checkbox"> 아이디 저장 
			<div class="empty-row"></div>

			<div class="search_id text-center">
				<hr>
				<a href="idsearch">아이디찾기</a> | <a href="pwsearch">비밀번호찾기</a> | <a href="join">회원가입</a>
				<hr>
			</div>
		</form>

	</div>

</div>
<%@ include file="/WEB-INF/view/template/footer.jsp"%>