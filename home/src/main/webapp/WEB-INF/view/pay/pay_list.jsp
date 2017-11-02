<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/view/template/header.jsp"%>
<script>
	function pay() {
		window.open('paynow', '',
				'toolbar=no,menubar=no,location=no,height=600,width=900');
	}
</script>
<style>
.common-table {
	border-collapse: collapse;
	border: 1px solid #d7d5d5;
	/*    border-left: 0; */
	/*    border-right: 0; */
	line-height: 1.5;
	width: 100%;
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
<div class="page center">
	<div class="empty-row"></div>
	<table class="common-table center">
		<thead>
			<tr>
				<th>이미지</th>
				<th>상품이름</th>
				<th>상품색상/사이즈</th>
				<th>수량</th>
				<th>상품가격</th>
				<th>합계</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<c:forEach var="cart" items="${clist}">
					<tr align="center">
						<th>
							<p>
								<img
									src="${pageContext.request.contextPath}/file/${cart.product_name}">
							</p>
						</th>
						<th>${cart.product_name}</th>
						<th>${cart.count}개</th>
						<th>${cart.product_color}/${cart.product_size}</th>
						<th>${cart.pattern_price}원</th>
						<th>${cart.pattern_amount}원</th>
					</tr>
				</c:forEach>
			</tr>
		</tbody>
	</table>
	<div class="empty-row"></div>
	<div>
		<div>
			배송비:
			<fmt:formatNumber value="${fee}" pattern="#,###.##" />
			원, 상품 합계:
			<fmt:formatNumber value="${total}" pattern="#,###.##" />
			원, 총 합계:
			<fmt:formatNumber value="${total+fee}" pattern="#,###.##" />
			원
		</div>
	</div>
	<div class="empty-row"></div>
	<div class="empty-row"></div>

	<table class="join-table">
		<tr>
			<th class="text-left">이름</th>
			<td><input type="text" name="name" value="${mdto.name}" readonly></td>
		</tr>
		<tr>

			<th class="text-left">우편번호</th>
			<td><input type="text" id="addr1" name="addr1"
				value="${mdto.addr1}"> <input type="button"
				onclick="Postcode()" value="우편번호 찾기"> <br> <input
				type="text" id="addr2" name="addr2" value="${mdto.addr2}"><br>
				<input type="text" id="addr3" name="addr3" value="${mdto.addr3}"></td>
		</tr>
		<tr>
			<th class="text-left">폰번호</th>
			<td><input type="text" value="${mdto.phone}" name="phone"></td>
		</tr>
		<tr>
			<th class="text-left">이메일</th>
			<td><input type="text" value="${mdto.email}" name="email"></td>
		</tr>
	</table>
	<div class="join-button">
		<input type="button" value="결제하기" onclick="pay();"> <input
			type="button" id=reset value="취소">
	</div>
</div>
<%@ include file="/WEB-INF/view/template/footer.jsp"%>
