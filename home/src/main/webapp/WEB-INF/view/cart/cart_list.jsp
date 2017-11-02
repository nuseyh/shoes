<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/template/header.jsp"%>
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
<div class="empty-row"></div>
<div class="page area-90 center">
   <form action="#" method="post">
      <table class="common-table center">
         <thead>
         	<tr>
	            <th><input type="checkbox" value=""></th>
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
							<input type=checkbox data-num = "" name = sel><span></span>
						</th>
						<th>
							<p><img src="${pageContext.request.contextPath}/file/${cart.product_name}"></p>
						</th>
						<th>${cart.product_name}</th>
						<th>${cart.count} 개</th>
						<th>상품색상/사이즈</th>
						<th>${cart.pattern_price} 원</th>
						<th>${cart.pattern_amount} 원</th>	
					</tr>
				</c:forEach>
	         </tr>
         </tbody>
      </table>

      <div>
         <div>
         	배송비: <fmt:formatNumber value="${fee}" pattern="#,###.##"/>원,  
       	 	상품 합계: <fmt:formatNumber value="${total}" pattern="#,###.##"/>원,  
       	  	총 합계: <fmt:formatNumber value="${total+fee}" pattern="#,###.##"/> 원
         </div> 
         <div class="join-button">
            <input type="submit" value="주문하기">
         </div>
      </div> 
   </form>
</div>
<%@ include file="/WEB-INF/view/template/footer.jsp"%>