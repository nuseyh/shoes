<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ include file="/WEB-INF/view/template/header.jsp"%>
<c:choose>
	<c:when test="${delete}">
		<script>
			alert("탈퇴완료");
			location.href = 'home';
		</script>
	</c:when>
	<c:otherwise>
		<script>
			alert("비밀번호가 일치하지 않습니다");
			location.href = 'delete';
		</script>

	</c:otherwise>
</c:choose>

<%@ include file="/WEB-INF/view/template/footer.jsp"%>