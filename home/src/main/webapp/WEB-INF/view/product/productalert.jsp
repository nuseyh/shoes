<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<%@ include file="/WEB-INF/view/template/header.jsp"%>
		<script>
				alert("로그인 후 이용할 수 있습니다!");
				location.href='${pageContext.request.contextPath}/member/login';
		</script>
<%@ include file="/WEB-INF/view/template/footer.jsp"%>