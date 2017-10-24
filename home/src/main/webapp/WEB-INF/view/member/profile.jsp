<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/template/header.jsp"%>

<div class="empty-row"></div>
<div class="area-40 center">
	<div class="row text-center font-medium">MY PAGE</div>
	<hr>
	<div class="row">
		<table class="profile">
			<tbody>
				<tr>
					<th width="20%">아이디</th>
					<td>${mdto.id}</td>
				</tr>
				<tr>
					<th>이름</th>
					<td>${mdto.name}</td>
				</tr>

				<tr>
					<th>전화번호</th>
					<td>${mdto.phone}</td>
				</tr>
				<tr>
					<th>주소</th>
					<td>${mdto.addr1}</td>
				</tr>
<!-- 				<tr> -->
<!-- 					<th></th> -->
<%-- 					<td>${mdto.addr2} ${mdto.addr3}</td> --%>
<!-- 				</tr> -->
<!-- 				<tr> -->
<!-- 					<th></th> -->
<%-- 					<td>${mdto.addr3}</td> --%>
<!-- 				</tr> -->
				<tr>
					<th>적립금</th>
					<td>${mdto.money}</td>
				</tr>
				<tr>
					<th>가입일</th>
					<td>${mdto.reg}</td>
				</tr>
			</tbody>
		</table>

	</div>
	<div class="edit-button">
		<input type="button" id="edit" onclick="location.href='edit';"
			value="수정"> <input type="button" id="reset"
			onclick="location.href='delete';" value="탈퇴">
	</div>
</div>
<%@ include file="/WEB-INF/view/template/footer.jsp"%>