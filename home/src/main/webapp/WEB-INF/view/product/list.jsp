<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/template/header.jsp"%>
<style>

/* h1 { */
/* 	display: inline-block; */
/* 	background-color: #333; */
/* 	color: #fff; */
/* 	font-size: 20px; */
/* 	font-weight: normal; */
/* 	text-transform: uppercase; */
/* 	padding: 4px 20px; */
/* 	float: left; */
/* } */
</style>

<div class="center">
	<div class="center">

		<div class="clear"></div>
		<!-- items -->
		<div class="items">
			<c:forEach var="pdao" items="${plist}">
				<div class="item">
					<a href="detail?no=${pdao.i_num}"><img src="${pageContext.request.contextPath}/file/${pdao.savename}" width="275" height="200"></a>
					<h2>${pdao.i_name}</h2>
					<p>
						Price: <em>${pdao.i_price}원</em>
					</p>
				</div>
				<!-- item -->
			</c:forEach>
		</div>
		<!--/ items -->
	</div>
	<div class="clear"></div>
</div>

<%@ include file="/WEB-INF/view/template/footer.jsp"%>