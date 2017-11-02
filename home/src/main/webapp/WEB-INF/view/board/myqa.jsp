<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/template/header.jsp"%>

<div class="empty-row"></div>
<div class="page area-80 center">
	<table class="board-font join-table">
		<thead>
			<tr>
				<th>번호</th>
				<th>답변유무</th>
				<th width="40%">제목</th>
				<th>작성자</th>
				<th>작성일</th>
				<th>조회수</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="bdao" items="${list}">
				<tr align="center">
					<td>${bdao.getNo()}</td>
					<!-- 답변유무 등록 -->
					<td>${bdao.getState()}</td>
					<c:choose>
						<c:when test="${power eq '관리자'}">
							<td align="left"><a href="detail?no=${bdao.getNo()}">${bdao.getTitle()}</a></td>
						</c:when>
						<c:otherwise>
							<c:choose>
								<c:when test="${login}">
									<td align="left"><a href="password?no=${bdao.getNo()}">${bdao.getTitle()}</a></td>
								</c:when>
								<c:otherwise>
									<td align=left><a href="boardalert">${bdao.getTitle()}</a></td>
								</c:otherwise>
							</c:choose>
						</c:otherwise>
					</c:choose>
					<td>${bdao.getWriter()}</td>
					<td>${bdao.getAuto()}</td>
					<td>${bdao.getRead()}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>
<div class="empty-row"></div>
<%@ include file="/WEB-INF/view/template/footer.jsp"%>