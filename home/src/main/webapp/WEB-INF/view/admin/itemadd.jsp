<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<h1>상품 등록하시오</h1>
<html>


<head>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/each.css">
<script type="text/javascript"
	src="http://code.jquery.com/jquery-2.1.0.min.js"></script>
<script type="text/javascript">
	$(function() {
		$("#imgInp").on('change', function() {
			readURL(this);
		});
	});

	function readURL(input) {
		if (input.files && input.files[0]) {
			var reader = new FileReader();

			reader.onload = function(e) {
				$('#blah').attr('src', e.target.result);
			}

			reader.readAsDataURL(input.files[0]);
		}
	}
</script>

</head>

<main>

<body>
	<form action="upload" method="post" enctype="multipart/form-data">
		<table>
			<tr>
				<td>이미지 올리기</td>
				<!-- <td><input type="file" value="파일선택" multiple></td> -->
				<td>
					<input type="file"	id="imgInp" name="file"  multiple/>
					<input type = "text" id = "imgInp" name = "savename">
				</td>
			</tr>
			<tr>
				<td colspan="2">
				<img id = "blah" src="${ pageContext.request.contextPath}/upload/${product.savename }" alt="사진을 등록하십시오">
<%-- 					<a href="${pageContext.request.contextPath}/upload/${product.savename}"></a> --%>
<%-- 				<img id = "blah" src="${ pageContext.request.contextPath}/file/${product.savename }" alt="${ pageContext.request.contextPath}/upload/${product.savename }"> --%>
<%-- 					<a href="${pageContext.request.contextPath}/file/${product.savename}"></a> --%>
				</td>
			</tr>

			<tr>
				<td>상품유형</td>
				<td><select name="i_type">
						<option value="shoe">shoe</option>
						<option value="sneakers">sneakers</option>
						<option value="sandal">sandal</option>
						<option value="flat/loafer">flat/loafer</option>
						<option value="boots">boots</option>
						<option value="pumps">pumps</option>
				</select></td>
			</tr>
			<tr>
				<td>상품이름</td>
				<td><input type="text" name="i_name"></td>
			</tr>
			<tr>
				<td>내용</td>

				<td><input type="text" name="i_detail"></td>
			</tr>
			<tr>
				<td>가격</td>
				<td><input type="text" name="i_price"></td>
			</tr>
			<tr>
				<td>재고</td>
				<td><input type="text" name="i_leftnum"></td>
			</tr>
			<tr>
				<td>색상</td>
				<td><input type="text" name="i_color"></td>
			</tr>
			<tr>
				<td>사이즈</td>
				<td><select name="i_size">
						<option value="210">210</option>
						<option value="220">220</option>
						<option value="230">230</option>
						<option value="240">240</option>
						<option value="250">250</option>
						<option value="260">260</option>
						<option value="270">270</option>
						<option value="etc">etc</option>
				</select></td>
			</tr>
<!-- 			<tr> -->
<!-- 				<td>파일유형</td> -->
<!-- 				<td><input type="file" name="filetype"></td> -->
<!-- 			</tr> -->
<!-- 			<tr> -->
<!-- 				<td>파일이름</td> -->
<!-- 				<td><input type="text" name="filename"></td> -->
<!-- 			</tr> -->
<!-- 			<tr> -->
<!-- 				<td>파일길이</td> -->
<!-- 				<td><input type="text" name="filelen"></td> -->
<!-- 			</tr> -->
<!-- 			<tr> -->
<!-- 				<td>저장이름</td> -->
<!-- 				<td><input type="text" name="savename"></td> -->
<!-- 			</tr> -->
		</table>
		<input type="submit" value="완료">
	</form>
</body>
</main>

</html>