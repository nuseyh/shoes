<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/view/template/header.jsp"%>
<style>
img {
	width: 100%;
	height: 100%;
}

.detail_img {
	width: 300px;
	height: 300px;
}

.detail {
	display: flex;
}

.detail_table {
	width: 400px;
	height: 300px;
	border-top: 2px solid #333;
	padding: 15px;
}

.detail_table th {
	text-align: left;
	font-size: 15px;
}

.detail_table td {
	font-size: 14px;
	text-align: right;
}

.detail input[type=button] {
	width: 180px;
	height: 40px;
}
</style>

<script>
	$(document).ready(function(){
	    $("#cart").on("click",function(){
	        //ajax 요청을 특정 대상에게 보내며 입력값을 같이 첨부
	        var product_su = $("#amount").val();
	        $.ajax({
	            url: "${pageContext.request.contextPath}/cart/cart_add",
	            type:"get",
	            data:{
	                //이름:값, ...
	                amount:product_su,
	                user_id:${id},
	                product_no:${no}
	            },
	            success:function(res){
	                console.log("성공");
	            },
	            error:function(err){
	                console.log("오류 발생!");
	            }
	        });
	    });
	)};
/* $(document).ready(function(){
	$("#cart").click(function(){
		
	});
}); */
</script>

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
						<!-- 상품 재고 수량에 따라 주문 가능한 최대 수량이 달라진다 -->
						<td><input id="amount" type="number" value="1"></td>
						
					</tr>
					<tr>
						<td><input onclick="location.href='${pageContext.request.contextPath}/cart/cart_list'" type="button" value="구매하기"></td>
						<%-- <td>
							<input onclick="location.href='${pageContext.request.contextPath}/cart/cart_add?product_no=${product.i_num}&user_id=${id}" type="button" value="장바구니">
						</td> --%>
						<td>
							<input id="cart" type="button" value="장바구니">
						</td>
					<tr>
				</tbody>
			</table>
		</div>
	</div>
	<div>${product.i_detail}</div>
</div>
<%@ include file="/WEB-INF/view/template/footer.jsp"%>
