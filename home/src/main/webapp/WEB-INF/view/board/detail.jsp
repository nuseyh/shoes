<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/view/template/header.jsp"%>

<style>
	.border-table{
	border: 1px solid #ccc;
	border-collapse: collapse;
	width: 100%;
	}
		
	.border-table th, .border-table td{
    border: 1px solid #ccc;
    padding:10px;
}


</style>

<script>
	$(document).ready(function(){
		$("#admin")
		
	});
</script>




<div class="empty-row"></div>
<div class="area-30 center">
	<div class="row text-center font-big">게시글 보기</div>
	<div class="row">
		<form action="detail">
			<table class="board-table">
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
							<%-- <c:when test="${power}">
								<input class="form-btn" type="button" value="답글쓰기 " onclick="location.href='write?title=${board.getTitle()}&gno=${board.getGno()}'"> 
							</c:when> --%>
							<input class="form-btn" type="button" value="수정하기" onclick="location.href='edit?no=${board.getNo()}'"> 
							<input class="form-btn" type="button" value="삭제하기" onclick="location.href='delete?no=${board.getNo()}'"> 
							<input class="form-btn" type="button" value="목록으로" onclick="location.href='list'">
						</th>
					</tr>
				</tfoot>
			</table>
		</form>
	</div>
	
	
	<form id="admin" action="reply" method="post">
    	<%-- <input type="hidden" name="writer" value="${userId}"> --%>
		<input type="hidden" name="parent" value="${board.getNo()}">
		<c:choose>
			<c:when test="${power eq '관리자'}">
				<div class="row">
	        	<!-- 관리자만이 답글작성 가능 -->
					<textarea class="form-input" rows="3" placeholder="답변 내용 입력" name="detail" required></textarea>
	        	</div>
	        	<div class="row inner-align-right">
					<input class="form-btn" type="submit" value="댓글 등록">
				</div>
			</c:when>
			<c:otherwise>
				<div style="display:none;"></div>
			</c:otherwise>
		</c:choose>
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
		                		<!-- 어차피 작성자는 관리자 -->
			                    <%-- <th width="20%">${rdto.writer}</th> --%>
			                    <th width="20%">관리자</th>
			                    <td>
			                        <p>${rdto.detail}</p>
			                        <hr>
			                        <small>${rdto.reg}</small>
			                        <!-- 관리자만이 삭제가능 -->
			                        <c:if test="${power eq '관리자'}">
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
