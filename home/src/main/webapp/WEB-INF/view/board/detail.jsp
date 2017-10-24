<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/view/template/header.jsp"%>

<div class="empty-row"></div>
<div class="area-90 center">
	<div class="row text-center font-big">게시글 보기</div>
	<div class="row">
		<form action="detail">
			<table class="table">
				<tbody>
					<tr>
						<td>${board.getNo()}</td>
					</tr>
					<tr>
						<td class="font-medium">${board.getTitle()}</td>
					</tr>
					<tr>
						<td height="300" valign="top">${board.getWeb()}</td>
					</tr>
					<tr>
						<td>조회 수 ${board.getRead()} 작성 시간 ${board.getAuto()}</td>
					</tr>
				</tbody>
				<tfoot>
					<tr>
						<th colspan="2" align="right">
							<!--답글쓰기 시 admin인지 분별 후 admin 일떄만 활성화 , 답글쓰기 클릭시 admin이면 댓글창 생성후 답글작성 -->
							<%-- <input class="form-btn" type="button" value="답글쓰기 " onclick="location.href='write?title=${board.getTitle()}&gno=${board.getGno()}'"> --%> 
							<input class="form-btn" type="button" value="수정하기" onclick="location.href='edit?no=${board.getNo()}'"> 
							<input class="form-btn" type="button" value="삭제하기" onclick="location.href='delete?no=${board.getNo()}'"> 
							<input class="form-btn" type="button" value="목록으로" onclick="location.href='list'">
						</th>
					</tr>
				</tfoot>
			</table>
		</form>
	</div>
	
	
	<form action="replay" method="post">
    	<input type="hidden" name="writer" value="${userId}">
		<input type="hidden" name="parent" value="${bdto.no}">
        <div class="row">
	        <c:choose>
				<c:when test="${loginFlag}">
		            <textarea class="form-input" rows="3" placeholder="답변 내용 입력" name="detail" required></textarea>
				</c:when>
				<c:otherwise>
		            <textarea class="form-input" rows="3" placeholder="작성하시려면 로그인 해 주세요" name="detail" required disabled></textarea>
				</c:otherwise>
			</c:choose>
        </div>
        <div class="row inner-align-right">
        	<c:choose>
				<c:when test="${loginFlag}">
		            <input class="form-btn" type="submit" value="댓글 등록">
				</c:when>
				<c:otherwise>
		            <input class="form-btn" type="submit" value="댓글 등록" disabled>
				</c:otherwise>
			</c:choose>
        </div>
    </form>
    <c:choose>
    <c:when test="${empty list || list.size() == 0}">
    	<div class="row font-medium">
    		답변 대기중입니다.
    	</div>
    </c:when>
    <c:otherwise>
	    <div class="row">
	        <table class="table">
	            <tbody>
	                <c:forEach var="rdto" items="${list}">
	                	<tr>
		                    <th width="20%">${rdto.writer}</th>
		                    <td>
		                        <p>${rdto.detail}</p>
		                        <hr>
		                        <small>${rdto.reg}</small>
		                        <c:if test="${loginFlag && userId eq rdto.writer}">
								<a href="replydelete?no=${rdto.no}&parent=${rdto.parent}">삭제</a>
								</c:if>
		                    </td>
		                </tr>
	                </c:forEach>
	            </tbody>
	        </table>
	    </div>
    </c:otherwise>
    </c:choose>
    
    
</div>
<div class="empty-row"></div>
<div class="empty-row"></div>

<%@ include file="/WEB-INF/view/template/footer.jsp"%>
