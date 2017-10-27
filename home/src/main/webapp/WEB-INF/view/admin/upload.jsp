<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!Doctype HTML>
<html>
    <head>
        <title>이미지 게시판</title>
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/main.css">
    </head>
    <body>
        <div class="empty-row"></div>
        <div class="empty-row"></div>
        <div class="area-50 center">
            <div class="row line-black" align="center">
                <h1>이미지 업로드</h1>
            </div>
            <div class="empty-row"></div>
            <form action="upload" method="post" enctype="multipart/form-data">
            <div class="row align-left">
                <label for="title" class="user-input area-30">파일 이름</label>
                <input type="text" id="i_name" name="i_name" required class="user-input fill">
            </div>
            <div class="row align-left">
                <label for="file" class="user-input area-30">업로드 이미지</label>
                <input type="file" id="file" name="file" required class="user-input fill">
            </div>
            <div class="row align-right">
                <input type="button" class="input-btn" value="홈으로" onclick="">
                <input type="submit" class="input-btn" value="업로드">
            </div>    
            </form>
        </div>
    </body>
</html>