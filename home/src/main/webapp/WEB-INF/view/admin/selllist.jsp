<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/view/template/header.jsp"%>
<script>

	
		$(document)
				.ready(
						function() {
							$(".search")
									.on(
											"submit",
											function() {
												event.preventDefault();

												var key = $(this).find(
														"input[name=key]")
														.val();
												if (key.length > 0) {
													location.href = "${pageContext.request.contextPath}/admin/selllist/"
															+ key;
						}
				});
		});
</script>
<div class="empty-row"></div>
<div class="user-list">
	<form class="search right" action="selllist">
		<input type="search" name="key" placeholder="Search here" required>
		<button type="submit">Search</button>
	</form>
	<form action="selllist" method="post">
		${list.size()}
		<table>
			<caption>Sell List</caption>
			<thead>
				<tr>
					<th scope="col">no</th>
					<th scope="col">아이디</th>
					<th scope="col">상품번호</th>
					<th scope="col">가격</th>
					<th scope="col">사이즈</th>
					<th scope="col">컬러</th>
					<th scope="col">주문수</th>
					<th scope="col">총금액</th>

				</tr>
			</thead>
			<tbody>
				<c:forEach var="adto" items="${selllist}">
					<tr>
						<td scope="row">${adto.pay_no}</td>
						<td scope="row">${adto.user_id}</td>
						<td scope="row">${adto.product_no}</td>
						<td scope="row">${adto.product_price}</td>
						<td scope="row">${adto.product_size}</td>
						<td scope="row">${adto.product_color}</td>
						<td scope="row">${adto.count}</td>
						<td scope="row">${adto.amount}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<div class="join-button">
			<input type="submit" value="삭제">
		</div>
	</form>
</div>

<%@ include file="/WEB-INF/view/template/footer.jsp"%>