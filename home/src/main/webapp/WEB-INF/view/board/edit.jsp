<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/view/template/header.jsp"%>

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/jquery-te-1.4.0.css">
<link rel="">
<style>
.common-table {
	border-collapse: collapse;
	border: 1px solid #d7d5d5;
	/* 	border-left: 0; */
	/* 	border-right: 0; */
	line-height: 1.5;
	width: 100%;
	font-size: 13px;
}

.common-table input {
	padding: 0 10px;
	border: 1px solid #e8e8e8;
	height: 28px;
}

.common-table th {
	border-right: 1px solid #d7d5d5;
	background-color: #fbfafa;
	border: 1px solid #dfdfdf;
	padding: 11px 0 10px 18px;
	border-left: 0;
	font-weight: normal;
	text-align: left;
}

.common-table td {
	border: 1px solid #dfdfdf;
/* 	border-right: 0; */
	padding: 8px 10px 7px;
}

.common-table input:hover {
	border: 1px solid #aaa;
}

.common-table input[name=addr2], .join-table input[name=addr3] {
	width: 280px;
	margin: 5px 0 0;
}

.common-button {
	margin: 20px 0 50px;
	text-align: center;
}

.text-right{
	text-align:right;
}
</style>
<<<<<<< HEAD
=======
<script type="text/javascript" src="${pageContext.request.contextPath }/S.E/js/service/HuskyEZCreator.js" charset="utf-8"></script>
>>>>>>> branch 'master' of https://github.com/nuseyh/shoes.git
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
        		 $("form").attr('action', '${pageContext.request.contextPath }/board/writ').submit()
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

<div class="empty-row"></div>
<div class="area-80 center">
	<div class="row text-center">게시글 수정</div>
	<div class="row">
		<form action="edit?no=${board.getNo()}" method="post">
			<table class="common-table">
				<tbody>
					<tr>
						<th width="20%">작성자</th>
						<td><input class="form-input" type="text" name="writer"
							required value="${board.getWriter()}" readonly></td>
					</tr>
					<tr>
						<th width="20%">제목</th>
						<td><input class="form-input" type="text" name="title"
							required value="${board.getTitle()}" readonly></td>
					</tr>
					<tr>
						<th width="20%">내용</th>
						<td><textarea id="editor" class="form-input" name="detail" rows="10"
								required>${board.getDetail()}</textarea></td>
					</tr>
					<tr>
						<th width="20%">비밀번호</th>
						<td><input class="form-input" type="password" name="pw"
							required maxlength="20"></td>
					</tr>
				</tbody>


			</table>
			<div class="join-button">
				<input id="save_btn" class="form-btn" type="submit" value="수정하기">
				<input id="cancle_btn" type="button" value="취소">
				<input class="form-btn" type="button" value="목록으로" onclick="location.href='list'">
			</div>
		</form>
	</div>
</div>
<div class="empty-row"></div>
<div class="empty-row"></div>

<%@ include file="/WEB-INF/view/template/footer.jsp"%>
