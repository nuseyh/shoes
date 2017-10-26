<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/view/template/header.jsp"%>
<link rel="stylesheet" type="text/css"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<style>
.board-table {
	border: 1px solid #ccc;
	border-collapse: collapse;
	width: 100%;
}

.board-table th, .board-table td {
	border: 1px solid #ccc;
	padding: 10px;
}

.fa {
	font-size: 1.2em;
}

.board-font td a{
	font-size:13px;
}

</style>

<div class="empty-row"></div>
<div class="area-80 center">
	<div class="row text-center font-small">문의 게시판</div>
	<div class="row">
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
				<c:forEach var="board" items="${list}">
					<tr align="center">
						<td>${board.getNo()}</td>
						<!-- 답변유무 등록 -->
						<td>${board.getState()}</td>
						<td align="left"><a href="password?no=${board.getNo()}">${board.getTitle()}</a>
						</td>
						<td>${board.getWriter()}</td>
						<td>${board.getAuto()}</td>
						<td>${board.getRead()}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<div class="row">
		<div class=" text-right">
			<a href="write">글쓰기</a>
		</div>
	</div>

	<%-- <!-- Paging 처리, Bootstrap -->
	<nav>
		<ul class="pagination">
			<li>
				<c:if test="${startBlock>1}">
					<a href="list?page=${blockstart-1}${searchParam}" aria-label="Previous">
						<span aria-hidden="true">&laquo;</span>
					</a>
				</c:if>
			</li>
			<c:forEach var="i" begin="${startBlock}" end="${endBlock}" step="1">
				<c:choose>
					<c:when test="${pageNo==n}">
						<li class="active">
							<a href="list?page=${n}" class="active">${n}</a>
						</li>
					</c:when>
					<c:otherwise>
						<li>
							<a href="list?page=${n}${searchParam}">${n}</a>
						</li>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			<c:if test="${blockend < blocktotal}">
				<li>
					<a href="list?page=${blockend+1}${searchParam}" aria-label="Next">
						<span aria-hidden="true">&raquo;</span>
					</a>
				</li>
			</c:if>
		</ul>
	</nav> --%>


	<div class="row center">
		<div class="text-center">
			<c:if test="${blockstart > 1}">
				<a href="list?page=${blockstart-1}${searchParam}"><i
					class="fa fa-angle-left" aria-hidden="true"></i></a>
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
				<a href="list?page=${blockend+1}${searchParam}"><i
					class="fa fa-angle-right" aria-hidden="true"></i></a>
			</c:if>
		</div>
	</div>
	<div class="row">
		<form action="list">
			<div class="inner-align-right">
				<div>
					<input type="submit" value="검색">
				</div>
				<div>
					<input type="search" name="key" placeholder="검색어" value="${key}"
						required>
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