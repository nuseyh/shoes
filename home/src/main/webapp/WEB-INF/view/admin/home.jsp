<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/template/header.jsp"%>
	<div align="center">
    <table border="1" class="mypage">
        <tr>
            <td><a href="${pageContext.request.contextPath }/admin/memberlist">회원목록</a></td>
         	<td><a href="${pageContext.request.contextPath }/imageboard/itemmain">상품목록</a></td>
        </tr>
    
    </table>
            </div>
<%@ include file="/WEB-INF/view/template/footer.jsp"%>