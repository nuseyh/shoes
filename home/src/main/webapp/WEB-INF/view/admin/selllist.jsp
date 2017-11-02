<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/view/template/header.jsp"%>
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
		});

		$(document)
				.ready(
						function() {
							$(".search")
									.on(
											"submit",
											function() {
												event.preventDefault();

												var key = $(this).find(
														"input[name=key]")
														.val();
												if (key.length > 0) {
													location.href = "${pageContext.request.contextPath}/admin/memberlist/"
															+ key;
						}
				});
		});
	}
</script>
<div class="empty-row"></div>
<div class="user-list">
	<form class="search right" action="post">
		<input type="search" name="key" placeholder="Search here" required>
		<button type="submit">Search</button>
	</form>
	<form action="selllist" method="post">
	${list.size()}
		<table>
			<caption>Sell List</caption>
			<thead>
				<tr>
					<th scope="col" width="3%;"><input type="checkbox" id="all"></th>
					<th scope="col"></th>
					<th scope="col"></th>
					<th scope="col"></th>
					<th scope="col"></th>
					<th scope="col"></th>
					<th scope="col"></th>
					<th scope="col"></th>
					<th scope="col"></th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="adto" items="${list}">
					<tr>
						<td scope="row"><input type="checkbox" name="check" value=""></td>
						<td scope="row">${adto.id}</td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<div class="join-button">
			<input type="submit" value="삭제">
		</div>
	</form>
</div>
<div class="empty-row"></div>
<%@ include file="/WEB-INF/view/template/footer.jsp"%>