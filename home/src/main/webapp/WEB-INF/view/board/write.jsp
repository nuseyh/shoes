<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/view/template/header.jsp"%>

<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/jquery-te-1.4.0.css">
<script src="${pageContext.request.contextPath}/js/jquery-te-1.4.0.js"></script>

<script type="text/javascript"
	src="${pageContext.request.contextPath }/S.E/js/service/HuskyEZCreator.js"
	charset="utf-8"></script>
<script>
	 $(document).ready(function(){
         var oEditors = [];
         nhn.husky.EZCreator.createInIFrame({
             oAppRef: oEditors,
             elPlaceHolder: "editor",
             sSkinURI: "${pageContext.request.contextPath}/S.E/SmartEditor2Skin.html",
             fCreator: "createSEditor2"
         });
         $("#save_btn").click(function(){
        	 if(validation()){
        		 oEditors[0].exec("UPDATE_CONTENTS_FIELD", [])
        		 $("form").attr('action', '${pageContext.request.contextPath }/board/write').submit()
        	 }
        	 function validation() {
            	 var contents = $.trim(oEditors[0].getContents())
            	 if(contents === '<p>&nbsp<p>' || contents === '') {
            		 alert("내용을 입력하세요")
            		 $("#editor").focus()
            		 return false
            	 }
            	 return true
             }
         })
         $("#cancle_btn").click(function(){
        	 history.back()
         })
     })
	
</script>




<script type="text/javascript">
	function showSub(obj) {
		f = document.forms.select_notice;

		if (obj == "문의") {
			f.title1.style.display = "";
			f.title2.style.display = "none";
			f.title3.style.display = "none";

		} else if (obj == "후기") {
			f.title1.style.display = "none";
			f.title2.style.display = "";
			f.title3.style.display = "none";

		} else if (obj == "공지") {
			f.title1.style.display = "none";
			f.title2.style.display = "none";
			f.title3.style.display = "";
		}
	}
</script>



<style>
.writer table {
	width: 70%;
	border: 1px solid black;
}

.writer th {
	text-align: left;
	padding: 10px 0 10px 20px;
}

.write td {
	
}

.write select {
	width: 100%;
}

.join-table {
	border-right: 1;
}
</style>

<div class="page center">
	<div class="empty-row"></div>
	<div class="empty-row"></div>
	<strong>QnA</strong>
	<form action="write" method="post" class="center" name="select_notice">
		<c:if test="${not empty title}">
			<input type="hidden" name="gno" value="${gno}">
			<input type="hidden" name="parent" value="${parent}">
			<input type="hidden" name="depth" value="${depth}">
		</c:if>
		<table class="join-table">
			<tr>
				<th class="text-left">작성자</th>
				<td><input type="text" name="writer" value="${id}" required
					readonly></td>
			</tr>
			<tr>
				<th class="text-left">제목</th>
				<td><select name="notice" class="form-select" onChange="showSub(this.options[this.selectedIndex].text);">
						<option value="Q" selected>문의</option>
						<option value="review">후기</option>
						<c:if test="${power eq '관리자'}">
							<option value="notice">공지</option>
						</c:if>
					</select>
				</select> 
				<select id="title1" name="title" class="form-select">
						<option value="일반문의입니다!">일반문의입니다!</option>
						<option value="주문문의입니다!">주문문의입니다!</option>
						<option value="배송문의입니다!">배송문의입니다!</option>
				</select>
				<select id="title2" name="title" class="form-select" style="display: none;">
						<option value="후기입니다!">후기입니다!</option>
				</select> 
				<select id="title3" name="title" class="form-select" style="display: none;">
						<option value="공지입니다!">공지입니다!</option>
				</select>
				</td>
			</tr>
			<tr>
				<td colspan="2"><textarea id="editor" class="form-input" style="width: 100%; height: 200px;" name="detail" rows="10" required></textarea></td>
			</tr>
			<tr>
				<th class="text-left">비밀번호</th>
				<td><input type="password" name="pw" required maxlength="20"></td>
			</tr>
		</table>
		<div class="join-button">
			<input id="save_btn" class="form-btn" type="submit" value="등록하기">
			<input id="cancle_btn" type="button" value="취소"> 
			<input onclick="location.href='list';" class="form-btn" type="button" value="목록으로">
		</div>
	</form>
</div>

<%@ include file="/WEB-INF/view/template/footer.jsp"%>
