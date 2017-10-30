<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/view/template/header.jsp"%>
<style>
img {
	width: 100%;
	height: 100%;
}

<div class="area-60 center align-center">

	<table class="table">
		<tbody>
			<tr>
				<th rowspan="10" width="60%"><img src="img/56456.jpg"></th>
				<td>상품명</td>
				<td>${product.i_name}</td>
			</tr>
			<tr>
				<td>판매가</td>
				<td>${product.i_price}</td>
			</tr>
			<tr>
				<td>컬러</td>
				<td>${product.i_color}</td>
			</tr>
			<tr>
				<td>사이즈</td>
				<td><select name="i_size">
						<option>-[필수]사이즈를 선택해 주세요-</option>
						<option value="210">210</option>
						<option value="220">220</option>
						<option value="230">230</option>
						<option value="240">240</option>
						<option value="250">250</option>
						<option value="260">260</option>
				</select></td>
			</tr>
			<tr>
				<td>수량</td>
				<td><input type="number" value="1"></td>
			</tr>
			<tr class="">
				<td colspan="2" rowspan="5">
					<button>구매하기</button>
					<button>장바구니</button>
				</td>
			</tr>
		</tbody>
	</table>
</div>
<div>${product.i_detail}</div>

.detail_img {
	width: 300px;
	height: 300px;
}

.detail {
	display: flex;
}

.detail_table {
	width: 300px;
	height: 300px;
	border-top: 2px solid #333;
	padding: 15px;
}

.detail_table th {
	font-size: 13px;
}

.detail_table td {
	font-size: 12px;
	text-align: right;
}
</style>

<div class="area-80 center">
	<div class="detail">
		<div class="detail_img">
			<img src="img/아이린.gif">
		</div>
		<div class="">

			<table class="detail_table">
				<tbody>
					<tr>
						<th>상품명</th>
						<td>${product.i_name}</td>
					</tr>
					<tr>
						<th>판매가</th>
						<td>${product.i_price}</td>
					</tr>
					<tr>
						<th>컬러</th>
						<td>${product.i_color}</td>
					</tr>
					<tr>
						<th>사이즈</th>
						<td><select name="i_size">
								<option>-[필수]사이즈를 선택해 주세요-</option>
								<option value="210">210</option>
								<option value="220">220</option>
								<option value="230">230</option>
								<option value="240">240</option>
								<option value="250">250</option>
								<option value="260">260</option>
						</select></td>
					</tr>
					<tr>
						<th>수량</th>
						<td><input type="number" value="1"></td>
					</tr>
					<tr class="">
						<td colspan="2"><input type="button" value="구매하기"></td>
					</tr>
					<tr class="">
						<td colspan="2"><input type="button" value="장바구니"></td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
	<div>
		<!--        ${product.i_detail}-->
	</div>
</div>

<%@ include file="/WEB-INF/view/template/footer.jsp"%>
