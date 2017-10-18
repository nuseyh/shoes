<!DOCTYPE html>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ include file="/WEB-INF/view/template/header.jsp"%>

<div class="page area-60 center">
	<div class="area-60 center">
		<div>
			<div class="empty-row"></div>
			<!--                    로고-->
			<div class="text-center">
				<a href="#" class="left"><img
					src="http://via.placeholder.com/200x100"></a>
				<div class="empty-row"></div>

				<hr>
			</div>
		</div>
		<div class="empty-row"></div>
		<form action="login" method="post" class="center">
			<div class="row">
				<input type="text" class="login_id" name=id placeholder="아이디">
			</div>
			<div class="row">
				<input type="password" class="login_pw" name=pw placeholder="비밀번호">
			</div>
			<div class="row">
				<input type="submit" class="login_btn" value="로그인">
			</div>

			<div>
				<input type="checkbox"> 아이디 저장 <input type="checkbox">
				로그인상태 유지
			</div>
			<div class="empty-row"></div>

			<div class="search_id text-center">
				<hr>
				<a href="search-id">아이디찾기</a><a href="search-pw">비밀번호찾기</a> <a href="join">회원가입</a>
				<hr>
			</div>
		</form>

	</div>

</div>
<%@ include file="/WEB-INF/view/template/footer.jsp"%>