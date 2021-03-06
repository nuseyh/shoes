<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/view/template/header.jsp"%>
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

.board-font td a {
	font-size: 13px;
}

select {
	height: 42px;
}

.num img{
	height:10px;
	width:15px;
}

.num a{
	font-size:14px;
}

.search-btn {
	text-align: center;
}

.search-all input[type=search] {
	height: 42px;
}

.search-btn input[type=submit] {
	background-color: #333;
	color: #fff !important;
	border: 1px solid #222;
	padding: 11px;
}

.writer a {
	font-size: 14px;
	font-weight: 400;
}
</style>

<script>
	function logincheck(){
		alert("로그인 후 이용가능합니다.");
		
	}
</script>


<div class="empty-row"></div>
<div class="page area-80 center">
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
						<c:choose>
							<c:when test="${power eq '관리자'}">
								<td align="left"><a href="detail?no=${board.getNo()}">${board.getTitle()}</a></td>
							</c:when>
							<c:otherwise>
								<c:choose>
									<c:when test="${login}">
										<td align="left"><a href="password?no=${board.getNo()}">${board.getTitle()}</a></td>
									</c:when>
									<c:otherwise>
										<td align=left><a href="boardalert" >${board.getTitle()}</a></td>
									</c:otherwise>
								</c:choose>
							</c:otherwise>
						</c:choose>
						<td>${board.getWriter()}</td>
						<td>${board.getAuto()}</td>
						<td>${board.getRead()}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<div class="row">
		<div class="writer text-right">
			<c:choose>
				<c:when test="${!login}">
					<a  onclick="logincheck()" href="${pageContext.request.contextPath }/member/login">글쓰기</a>
				</c:when>
				<c:otherwise>
					<a href="write">글쓰기</a>
				</c:otherwise>
			</c:choose>
		</div>
	</div>

	<div class="row center">
		<div class="text-center num">
			<c:if test="${blockstart > 1}">
				<a href="list?page=${blockstart-1}${searchParam}"><img src="${pageContext.request.contextPath }/img/back.png"/></a>
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
				<a href="list?page=${blockend+1}${searchParam}"><img src="${pageContext.request.contextPath }/img/next.png"/></a>
			</c:if>
		</div>
	</div>
	<div class="search-all row">
		<form action="list">
			<div class="inner-align-right">
				<div class="search-btn">
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