<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/view/template/header.jsp"%>



<style>
.common-table {
	border-collapse: collapse;
	border: 1px solid #d7d5d5;
	/*    border-left: 0; */
	/*    border-right: 0; */
	line-height: 1.5;
	width: 80%;
	font-size: 13px;
}

.common-table input {
	padding: 0 10px;
	border: 1px solid #e8e8e8;
	height: 28px;
}

.common-table img{
	width:100%;
	height:100%;
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

.img-table{
	width:150px;
	height: 150px;
}
</style>

<script type="text/javascript"
	src="http://code.jquery.com/jquery-2.1.0.min.js"></script>
<script type="text/javascript">
	$(function() {
		$("#imgInp").on('change', function() {
			readURL(this);
		});
	});

	function readURL(input) {
		if (input.files && input.files[0]) {
			var reader = new FileReader();

			reader.onload = function(e) {
				$('#blah').attr('src', e.target.result);
			}

			reader.readAsDataURL(input.files[0]);
		}
	}
</script>

<div class="user-list">
   <form action="list" method="post">

      <table class="common-table">
         <caption>Item List</caption>
         <tr>
            <td scope="col"><input type=checkbox id=all></td>
            <td scope="col">상품 번호</td>
            <td scope="col">이미지</td>
            <td scope="col">아이템 이름</td>
            <td scope="col">아이템 가격</td>
            <td scope="col">설명</td>
            <td scope="col">아이템 유형</td>

         </tr>
         <c:forEach var="product" items="${plist}">
            <tr id="move">
               <td scope="row"><input name="check" type="checkbox"
                  value="${product.i_name }"><span></span></td>
                  
               <td scope="row"><a href="itemedit?no=${product.i_num}">${product.i_num}</a></td>
               <td class="img-table"><a href="itemedit?no=${product.i_num}"><img id="cb" src="${pageContext.request.contextPath}/file/${product.savename}">
               </a></td>
               <td>${product.i_name}</td>
               <td>${product.i_price }</td>
               <td>${product.i_detail}</td>
               <td>${product.i_type}</td>
            </tr>
         </c:forEach>
      </table>
      <div class="join-button">
         <input type="button" value=등록 onclick="location.href='itemadd';">
         <input type="submit" value=삭제>
      </div>
   </form>
</div>

<%@ include file="/WEB-INF/view/template/footer.jsp"%>