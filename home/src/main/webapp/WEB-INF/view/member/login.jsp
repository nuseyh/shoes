<!DOCTYPE html>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ include file="/WEB-INF/view/template/header.jsp"%>
<script>
	function confirmSave(checkbox) {
		var isRemember;

		if (checkbox.checked) {
			isRemember = confirm("이 PC에 로그인 정보를 저장하시겠습니까? PC방등의 공공장소에서는 개인정보가 유출될 수 있으니 주의해주십시오.");

			if (!isRemember)
				checkbox.checked = false;
		}
	}

	function setsave(name, value, expiredays) {
		var today = new Date();
		today.setDate(today.getDate() + expiredays);
		document.cookie = name + "=" + escape(value) + "; path=/; expires="
				+ today.toGMTString() + ";"
	}

	function saveLogin(id) {
		if (id != "") {
			// userid 쿠키에 id 값을 7일간 저장
			setsave("userid", id, 7);
		} else {
			// userid 쿠키 삭제
			setsave("userid", id, -1);
		}
	}

	function sendit() {
		if (loginform.idcheck.checked)

			saveLogin(loginform.id.value);

		else

			saveLogin("");

	}

	function getLogin() {
		// userid 쿠키에서 id 값을 가져온다.
		var cook = document.cookie + ";";
		var idx = cook.indexOf(key, 0);
		var val = "";

		if (idx != -1) {
			cook = cook.substring(idx, cook.length);
			begin = cook.indexOf("=", 0) + 1;
			end = cook.indexOf(";", begin);
			val = unescape(cook.substring(begin, end));
		}

		// 가져온 쿠키값이 있으면
		if (val != "") {
			document.loginform.id.value = id;
			document.loginform.idcheck.checked = true;
		}
	}

	// 	출처: http://linuxism.tistory.com/1510 [linuxism]
</script>
<div class="page area-60 center">
	<div class="area-60 center">
			<div class="em pty-row"></div>
		<div>
			<strong>login</strong>
			<hr>
		</div>
		<form action="login" name="loginform" method="post" class="center"
			onSubmit="return checking();">
			<div class="row">
				<input type="text" class="login_id" name=id placeholder="아이디">
			</div>
			<div class="row">
				<input type="password" class="login_pw" name=pw placeholder="비밀번호">
			</div>
			<div class="row">
				<input type="submit" class="login_btn" onClick="sendit();"
					value="로그인">
			</div>

			<div>
				<input type="checkbox" name="idcheck" onClick="confirmSave(this)">
				아이디 저장
				<div class="empty-row"></div>

				<div class="search_id text-center">
					<hr>
					<a href="idsearch">아이디찾기</a> | <a href="pwsearch">비밀번호찾기</a> | <a
						href="join">회원가입</a>
					<hr>
				</div>
				<div class="empty-row"></div>
		</form>

	</div>

</div>
<%@ include file="/WEB-INF/view/template/footer.jsp"%>