<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<form action="remove" method="post">
	<table>
		<tr height="30">
			<td>비밀번호</td>
			<td><input type="text" name="pw"></td>
		</tr>
		
		<tr height="30">
			<td><input type="button"
				value="메인으로.." onclick="javascript<x>:window.location = 'list'">
				<input type="submit" value="탈퇴">
			</td>
		</tr>
	</table>
</form>
