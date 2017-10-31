<!DOCTYPE html>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/view/template/header.jsp"%>



<div class="page center">
	<div class="empty-row"></div>
	<div class="empty-row"></div>

	<form action="edit" method="post" class="center">
		<table class="join-table">
			<tr>
				<th class="text-left">아이디</th>
				<td><input type="text" id="id" name="id" 
					onblur="idCheck();" value="${mdto.id}" readonly>
			</tr>
			<tr>
				<th class="text-left">비밀번호</th>
				<td><input type="password" id="pw" name="pw"
					onblur="pwCheck();" value="">
					<div class="pw-check"></div></td>
			</tr>
			<tr>
				<th class="text-left">비밀번호 확인</th>
				<td><input type="password" id="pw_check" name="pw2"
					onblur="pw2Check();" value="">
					<div class="pw-recheck"></div></td>
			</tr>
			<tr>
				<th class="text-left">이름</th>
				<td><input type="text" name="name" value="${mdto.name}" readonly></td>
			</tr>
			<tr>
				<th class="text-left">폰번호</th>
				<td><input type="text" value="${mdto.phone}" name="phone" onblur="phoneCheck();"></td>
			</tr>
			<tr>
				<th class="text-left">이메일</th>
				<td><input type="text" value="${mdto.email}" name="email" onblur="emailCheck();"></td>
			</tr>
			<tr>

				<th class="text-left">우편번호</th>
				<td><input type="text" id="addr1" name="addr1" value="${mdto.addr1}"> 
					<input type="button" onclick="Postcode()" value="우편번호 찾기" > <br>
					<input type="text" id="addr2" name="addr2" value="${mdto.addr2}"> 
					<br> 
					<input type="text" id="addr3" name="addr3" value="${mdto.addr3}">
				</td>
			</tr>
		</table>
		<div class="join-button">
			<input type="submit" value="수정"> 
			<input type="button" id=reset value="취소">
		</div>
	</form>
</div>

<%@ include file="/WEB-INF/view/template/footer.jsp"%>