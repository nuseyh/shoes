<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<%@ include file="/WEB-INF/view/template/header.jsp"%>
	<c:choose>
		<c:when test="${empty searchid}">
			<script>alert("존재하지 않는 아이디입니다");</script>
		</c:when>
		<c:otherwise>
			<h1>아이디는 ${searchid}입니다</h1>
		</c:otherwise>
	</c:choose>

<%@ include file="/WEB-INF/view/template/footer.jsp"%>