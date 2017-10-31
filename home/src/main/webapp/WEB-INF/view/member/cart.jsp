<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/template/header.jsp"%>

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
	border-right: 0;
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
</style>

<script>
	window.onload = function() {
		var all = document.querySelector("#all");
		all.addEventListener("click", function() {
			//console.log(this.checked);
			var list = document
					.querySelectorAll("input[type=checkbox]:not(#all)");
			for (var i = 0; i < list.length; i++) {
				list[i].checked = this.checked;
			}

			var del = documnet.querySelector("#del");
			del.addEventListener("click", function() {
				var chk = document.getElementsByName("#del");
				var data = "";
				var chk_check = false;

				for (i = 0; i < chk.length; i++) {
					if (chk[i].checked == true) {
						data = data + "," + chk[i].value;
						if (chk[i].checked)
							chk_check = true;
					}
				}
				if (chk_check) {
					if (confirm("삭제진짜로할까요?")) {
						alert("넘어가는 값:" + data);

						document.formName.action = "itemremove"
					} else {
						alert("아무것도 선택 되지않았습니다");
					}
				}
			})
		});
	};
</script>

<div class="page area-90 center">
	<form action="" method="post">
		<div class="empty-row"></div>
		<table class="common-table center">
			<tr>
				<th><input type="checkbox" id="all"></th>
				<th width="30%">이미지</th>
				<th>상품정보</th>
				<th>수량</th>
				<th>판매가</th>
			</tr>
			<tr>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
			</tr>
		</table>

		<div>
			<div>전체 합계:</div>
			<div class="join-button">
				<input type="submit" value="주문하기">
			</div>
		</div>
		<div class="empty-row"></div>
	</form>
</div>
<%@ include file="/WEB-INF/view/template/footer.jsp"%>