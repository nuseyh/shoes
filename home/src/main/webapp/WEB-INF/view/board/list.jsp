<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/view/template/header.jsp"%>

<div class="empty-row"></div>
<div class="area-80 center">
	<div class="row text-center font-big">문의 게시판</div>
	<div class="row">
		<table class="table">
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
				<c:forEach var="board" items="${list}">
					<tr align="center">
						<td>${board.getNo()}</td>
						<!-- 답변유무 등록 -->
						<td>${board.getState()}</td>
						<td align="left">
							<a href="password?no=${board.getNo()}">${board.getTitle()}</a>
	                    </td>
						<td>${board.getWriter()}</td>
						<td>${board.getAuto()}</td>
						<td>${board.getRead()}</td>
					</tr>
				</c:forEach>
					<tr>
						<th colspan="8" align="right"><a href="write">글쓰기</a></th>
					</tr>
			</tbody>
		</table>
	</div>
	<div class="row text-center center">
		<table>
			<tr>
				<th colspan="9" align="right">
					<c:if test="${blockstart > 1}">
						<a href="list?page=${blockstart-1}${searchParam}">[이전]</a>
					</c:if> 
					<c:forEach var="n" begin="${blockstart}" end="${blockend}">
						<c:choose>
							<c:when test="${pageNo==n}">
								<a href="list?page=${n}" class="active">${n}</a>
							</c:when>
							<c:otherwise>
								<a href="list?page=${n}${searchParam}">${n}</a>
							</c:otherwise>
						</c:choose>
					</c:forEach> 
					<c:if test="${blockend < blocktotal}">
						<a href="list?page=${blockend+1}${searchParam}">[다음]</a>
					</c:if>
				</th>
			</tr>
		</table>
	</div>
	<div class="row">
		<form action="list">
			<div class="inner-align-right">
				<div>
					<input type="submit" value="검색">
				</div>
				<div>
					<input type="search" name="key" placeholder="검색어" value="${key}" required>
				</div>
				<div>
					<select name="type">
						<c:choose>
							<c:when test="${type == 'writer'}">
								<option value="title">제목</option>
								<option value="writer" selected>작성자</option>
							</c:when>
							<c:otherwise>
								<option value="title">제목</option>
								<option value="writer">작성자</option>
							</c:otherwise>
						</c:choose>
					</select>
				</div>
			</div>
		</form>
	</div>
</div>
<div class="empty-row"></div>
<div class="empty-row"></div>

<%@ include file="/WEB-INF/view/template/footer.jsp"%>