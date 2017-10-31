<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/template/header.jsp"%>

<style>
.common-table {
	border-collapse: collapse;
	border: 1px solid #d7d5d5;
	border-left: 0;
/* 	border-right: 0; */
	line-height: 1.5;
	width: 27%;
	font-size: 13px;
}

.common-table input {
	padding: 0 10px;
	border: 1px solid #e8e8e8;
	height: 28px;
}

.common-table th {
	border-right: 1px solid #d7d5d5;
	background-color: #fbfafa;
	border: 1px solid #dfdfdf;
	padding: 11px 0 10px 18px;
	border-left: 0;
	font-weight: normal;
	text-align: left;
}

.common-table td {
	border: 1px solid #dfdfdf;
	border-right: 0;
	padding: 8px 10px 7px;
}

.common-table input:hover {
	border: 1px solid #aaa;
}

.common-table input[name=addr2], .join-table input[name=addr3] {
	width: 280px;
	margin: 5px 0 0;
}

.common-button {
	margin: 20px 0 50px;
	text-align: center;
}
</style>

<form action="delete" method="post">
	<table class="common-table center">
		<tr height="30">
			<td>비밀번호</td>
			<td><input type="text" name="pw"></td>
		</tr>

	</table>
	<div class="join-button">
		<input type="button" value="메인으로"
			onclick="javascript<x>:window.location = 'home'"> <input
			type="submit" value="탈퇴">
	</div>
</form>

<%@ include file="/WEB-INF/view/template/footer.jsp"%>