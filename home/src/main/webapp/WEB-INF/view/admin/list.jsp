<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
    <head>
        <title>이미지 게시판</title>
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/main.css">
       <script>
            window.onload = function(){
                var all = document.querySelector("#all");
                all.addEventListener("click", function(){
                    //console.log(this.checked);
                    var list = document.querySelectorAll("input[type=checkbox]:not(#all)");
                    for(var i=0; i<list.length; i++){
                        list[i].checked = this.checked;
                    }
                
                    var del = documnet.querySelector("#del");
                del.addEventListener("click", function(){
                    var chk = document.getElementsByName("#del");
                    var data = "";
                    var chk_check = false;
                    
                    for(i=0; i<chk.length; i++){
                    	if(chk[i].checked == true){
                    		data = data + "," + chk[i].value;
                    		if(chk[i].checked) chk_check = true;
                    	}
                    }
                    if(chk_check){
                    	if(confirm("삭제진짜로할까요?")){
                    		alert("넘어가는 값:" + data);
                    		
                    		document.formName.action = "itemremove"
                    	}else{
                    		alert("아무것도 선택 되지않았습니다");
                    	}
                    }
                })
                });
            };
        </script>
         <style>
         	table{
         		border:1px solid black;
         	}
         	tr{
         		border:1px solid black;
         	}
         	td{
         		border:1px solid black;
         		
         	}
         	img{
         		width:100px; height:auto;
         	}
         </style>
    </head>
    
    <body>
                <h1>상품</h1>
            <table>
            <tr>
            		<td>
            			<input type=checkbox id = all>
            		</td>
                    <td>
            			상품 번호
            		</td>
            		<td>
            			이미지
            		</td>
            		<td>
            			아이템 이름
            		</td>
            		<td>
            			아이템 가격
            		</td>
            		<td>
            			설명
            		</td>
            		<td>
            			아이템 유형
            		</td>
            	</tr>
            <c:forEach var="product" items="${plist}">
            	<tr>
            		<td>
            			<input type=checkbox data-num = "${product.i_num }" name = sel><span></span>
            		</td>
                    <td>
            			${product.i_num}
            		</td>
            		<td>
            			<img src="${pageContext.request.contextPath}/file/${product.savename}">
            		</td>
            		<td>
            			${product.i_name }
            		</td>
            		<td>
            			${product.i_price }
            		</td>
            		<td>
            			${product.i_detail}
            		</td>
            		<td>
            			${product.i_type}
            		</td>
            	</tr>
            	
            </c:forEach>
            </table>
    </body>
    <input type = "button" value = 등록 onclick= "location.href='itemadd';">
    <input type = "button" value = 수정 onclick= "location.href='itemedit';">
    <input type = "button" value = 삭제 onclick= "location.href='itemremove';">
</html>

<!-- 선택	이미지	상품명(상품색깔,사이즈)	판매가	적립금	수량>	배송구분	배송비	합계 -->
			