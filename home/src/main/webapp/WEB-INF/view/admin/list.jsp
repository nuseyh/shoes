<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/view/template/header.jsp"%>



<style>
table {
   border: 1px solid black;
}

tr {
   border: 1px solid black;
}

td {
   border: 1px solid black;
}

img {
   width: 100px;
   height: auto;
}
</style>
</head>
<div class="user-list">
   <form action="list" method="post">

      <table>
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
               <td><a href="itemedit?no=${product.i_num}"><img id="cb"
                  src="${pageContext.request.contextPath}/file/${product.savename}">
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