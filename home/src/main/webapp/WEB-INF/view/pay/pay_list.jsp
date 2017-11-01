<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/view/template/header.jsp"%>
<script>
	function pay(){
		window.open('paynow','','toolbar=no,menubar=no,location=no,height=600,width=900');
	}  


</script>
<div class="page center">
	<div class="empty-row"></div>
	<div class="empty-row"></div>

	<form action="order" method="post" class="center">
		<table class="join-table">
			<tr>
				<th class="text-left">이름</th>
				<td><input type="text" name="name" value="${mdto.name}"
					readonly></td>
			</tr>
			<tr>

				<th class="text-left">우편번호</th>
				<td><input type="text" id="addr1" name="addr1"
					value="${mdto.addr1}"> <input type="button"
					onclick="Postcode()" value="우편번호 찾기"> <br> <input
					type="text" id="addr2" name="addr2" value="${mdto.addr2}">
					<br> <input type="text" id="addr3" name="addr3"
					value="${mdto.addr3}"></td>
			</tr>
			<tr>
				<th class="text-left">폰번호</th>
				<td><input type="text" value="${mdto.phone}" name="phone"
					onblur="phoneCheck();"></td>
			</tr>
			<tr>
				<th class="text-left">이메일</th>
				<td><input type="text" value="${mdto.email}" name="email"
					onblur="emailCheck();"></td>
			</tr>
		</table>
		<div class="join-button">
			<input type="button" value="결제하기" onclick="pay();"> 
			<input type="button" id=reset value="취소">
		</div>
	</form>
</div>
<%@ include file="/WEB-INF/view/template/footer.jsp"%>
