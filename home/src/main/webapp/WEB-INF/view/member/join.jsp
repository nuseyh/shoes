<!DOCTYPE html>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<%@ include file="/WEB-INF/view/template/header.jsp"%>
<div class="clear"></div>
<div class="page center">
	<div class="empty-row"></div>
	<div class="row text-center font-medium">Join</div>
	<form action="join" method="post" class="center"
		onsubmit="sendCheck();">
		<table class="join-table">
			<tr>
				<th class="text-left">아이디</th>
				<td><input type="text" id="id" name="id" placeholder="아이디"
					onblur="idCheck();">
					<div class="id-check"></div></td>
			</tr>
			<tr>
				<th class="text-left">비밀번호</th>
				<td><input type="password" id="pw" name="pw"
					onblur="pwCheck();" placeholder="패스워드">
					<div class="pw-check"></div></td>
			</tr>
			<tr>
				<th class="text-left">비밀번호 확인</th>
				<td><input type="password" id="pw_check" name="pw2"
					onblur="pw2Check();" placeholder="패스워드">
					<div class="pw-recheck"></div></td>
			</tr>
			<tr>
				<th class="text-left">이름</th>
				<td><input type="text" name="name"></td>
			</tr>
			<tr>
				<th class="text-left">폰번호</th>
				<td><input type="text" name="phone" onblur="phoneCheck();">
					<div class="phone-check"></div></td>
			</tr>
			<tr>
				<th class="text-left">이메일</th>
				<td><input type="text" id="email" name="email" onblur="emailCheck();">
					<div class="email-check"></div></td>
			</tr>
			<tr>

				<th class="text-left">우편번호</th>
				<td><input type="text" id="addr1" name="addr1"
					placeholder="우편번호"> <input type="button"
					onclick="Postcode()" value="우편번호 찾기"> <br> <input
					type="text" id="addr2" name="addr2" placeholder="주소"> <br>

					<input type="text" id="addr3" name="addr3" placeholder="상세주소">
				</td>
			</tr>
		</table>
		<div class="join-button">
			<input type="submit" value="회원가입"> <input type="button"
				onclick="location.href='login';" value="취소">
		</div>
		<div class="empty-row"></div>
	</form>
</div>

<%@ include file="/WEB-INF/view/template/footer.jsp"%>