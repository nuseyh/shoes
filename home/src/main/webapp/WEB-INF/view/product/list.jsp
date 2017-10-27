<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/template/header.jsp"%>
<style>

.list{
    width: 100%;
    display:flex;
    flex-direction: row;
    flex-wrap:wrap;
}
.list .image{
    padding:20px;
    width:16%;
    /*flex-grow:1;*/
    
}
.list .image img{
    width:180px;
    height: 150px;
}


</style>

<div class="area-80 center">

	<div class="list">
		<c:forEach var="pdao" items="${plist}">
			<div class="image">
				<a href="detail?no=${pdao.i_num}"><img src="${pageContext.request.contextPath}/file/${pdao.savename}">
				<div class="text-center">
					<h4>${pdao.i_name}</h4>
					<h5>${pdao.i_price}원</h5>
					</div>
					</a>
			</div>
		</c:forEach>
	</div>
	
</div>
<%@ include file="/WEB-INF/view/template/footer.jsp"%>