<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/template/header.jsp"%>

<form action="delete" method="post">
	<table cellspacing="1" cellpadding="1" border="1" align="center">
		<tr height="30">
			<td>비밀번호</td>
			<td><input type="text" name="pw"></td>
		</tr>
		
		<tr height="30">
			<td colspan="2" align="middle"><input type="button"
				value="메인으로.." onclick="javascript<x>:window.location = 'home'">
				<input type="submit" value="탈퇴"></td>
		</tr>
	</table>
</form>

<%@ include file="/WEB-INF/view/template/footer.jsp"%>