<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/view/template/header.jsp"%>
<style>
img {
   width: 100%;
   height: 100%;
}

.detail_img {
   width: 400px;
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
   margin-left:10px;
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
       $("#review").on("click", function(){
           if($("#writeform").css("display") == "none"){   
               jQuery('#writeform').show();  
           } else {  
               jQuery('#writeform').hide();  
           }  
       });
   });  

   $(document ).ready(function(){
		$("#cart").on("click", function(){
			$("#frm").submit();
			
		});
		
	});
</script>


<div class="area-80 center">
<div class="empty-row"></div>
   <div class="detail center">
      <div class="detail_img">
        <a href="itemedit?no=${product.i_num}">
        <img id="cb" src="${pageContext.request.contextPath}/file/${product.savename}">
        </a>
      </div>
      <div>
         <table class="detail_table center">
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
                  <td>
                  	<select name="i_size">
                        <option>-[필수]사이즈를 선택해 주세요-</option>
                        <option value="210">210</option>
                        <option value="220">220</option>
                        <option value="230">230</option>
                        <option value="240">240</option>
                        <option value="250">250</option>
                        <option value="260">260</option>
                  	</select>
                  </td>
               </tr>
               <tr>
                  <th>수량</th>
                 <!--  <td><input id="amount" type="text" onkeydown='return onlyNumber(event)' onkeyup='removeChar(event)'></td> -->
               	<td>
                 	 <form id="frm" method="post" action="${pageContext.request.contextPath}/cart/cart_add">
                       		<input type="hidden" name="product_no" value="${product.i_num}">
                       		<input type="hidden" name="user_id" value="${id}">
                       		<input type="hidden" name="product_name" value="${product.i_name}">
                       		<input type="hidden" name="product_price" value="${product.i_price}">
                    		<select name="count">
                     			<c:forEach begin="1" end="${product.i_leftnum}" var="i">
                    				<option value="${i}">${i}</option>
                     			</c:forEach>
                     		</select>
                     </form>
                 </td>
                 
               </tr>
               <tr>
                  <td><input onclick="location.href='${pageContext.request.contextPath}/cart/cart_list'" type="button" value="구매하기"></td>
                  <td><input id="cart" type="button" value="장바구니에 담기"></td>
               <tr>
            </tbody>
         </table>
      </div>
   </div>
   <div>${product.i_detail}</div>
</div>
<div class="area-60 center align-center"><img src="img/56456.jpg"></div>
<div>
   <strong>review 작성</strong>
   <button id="review">리뷰작성하기</button>
   </div>
   <div id="writeform" style="display: none;">
   <form id="frm" action="board/write" method="post" class="center" name="select_notice">
      <c:if test="${not empty title}">
         <input type="hidden" name="gno" value="${gno}">
         <input type="hidden" name="parent" value="${parent}">
         <input type="hidden" name="depth" value="${depth}">
      </c:if>
      <table class="join-table">
         <tr>
            <th class="text-left">작성자</th>
            <td><input type="text" name="writer" value="${id}" required readonly></td>
         </tr>
         <tr>
            <th class="text-left">제목</th>
            <td>
               <input type="text" name="title" required>
            </td>
         </tr>
         <tr>
            <td colspan="2"><textarea id="editor" class="form-input" name="detail" rows="4" placeholder="리뷰를 작성해주세요"required></textarea></td>
         </tr>
         <tr>
            <th class="text-left">비밀번호</th>
            <td><input type="password" name="pw" required maxlength="20"></td>
         </tr>
      </table>
      <div class="join-button">
         <input id="save" class="form-btn" type="submit" value="등록하기"> 
      </div>
   </form>
</div>
<hr>
<div>
   <strong>review</strong>
<table class="board-font join-table">
             <tr>
                 <td>작성자</td>
                 <td colspan="4"></td>
                 <td>작성일</td>
             </tr>
             <tr>
                 <td colspan="5">내용</td>
             </tr>
             <tr><td colspan="6"><button>삭제</button></td></tr>
      </table>
</div>

<%@ include file="/WEB-INF/view/template/footer.jsp"%>