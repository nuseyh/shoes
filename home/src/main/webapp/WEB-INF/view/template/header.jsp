<%-- <%@page import="home.model.MemberDAO"%> --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>

<head>
<meta charset="UTF-8">
<title>레이아웃</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/common.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/each.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/swiper.css">

<script src="https://code.jquery.com/jquery-latest.js"></script>
<script src="js/swiper.js"></script>
<style>
/* 이미지 슬라이더의 크기 설정 */
.swiper-container {
	width: 100%;
	height: 350px;
	margin: 20px auto;
}

.menu {
	list-style: none;
	/*                background-color: black;*/
}

.menu li {
	display: inline-block;
	color: white;
	/*                width: 80px;*/
	padding: 5px;
	margin: 0px;
	text-align: center;
	cursor: pointer;
}

.menu li>a {
	color: black;
	text-decoration: none;
}

.menu li>a:hover {
	color: crimson;
}

.top-menu {
	list-style: none;
}

.top-menu li {
	display: inline-block;
}
</style>

<!-- jQuery를 사용하기 위한 CDN 설정 -->
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
	//daum 주소창 
	function Postcode() {
		new daum.Postcode(
				{
					oncomplete : function(data) {
						var fullAddr = ''; // 최종 주소 변수
						var extraAddr = ''; // 조합형 주소 변수
						if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
							fullAddr = data.roadAddress;
						} else { // 사용자가 지번 주소를 선택했을 경우(J)
							fullAddr = data.jibunAddress;
						}
						if (data.userSelectedType === 'R') {
							if (data.bname !== '') {
								extraAddr += data.bname;
							}
							if (data.buildingName !== '') {
								extraAddr += (extraAddr !== '' ? ', '
										+ data.buildingName : data.buildingName);
							}
							fullAddr += (extraAddr !== '' ? ' (' + extraAddr
									+ ')' : '');
						}
						document.getElementById('addr1').value = data.zonecode; //5자리 새우편번호 사용
						document.getElementById('addr2').value = fullAddr;
						document.getElementById('addr3').focus();
					}
				}).open();
	}

	//로그인
	function checking() {
		if (document.querySelector("input[name=id]").value == "") {
			alert("ID를 입력하세요");
			return false;
		} else if (document.querySelector("input[name=pw]").value == "") {
			alert("비밀번호를 입력하세요");
			return false;
		}
	}

	//회원가입 유효성 검사
	function idCheck() {
		var input = document.querySelector("input[name=id]").value;
		var regex = /^[\w]{6,15}$/g;
// 		if (regex.test(input)) {
// 			$
// 					.ajax({
// 						url : "join",
// 						type : "post",
// 						data : $("#id").val(),
// 						success : function(data) {
// 							if (data.length > 0) {
// 								document.getElementById(".id-check").value = "이미 해당 아이디로 가입된 회원가 있습니다.";
// 							} else {
// 								if ($("#id").val().length < 5) {
// 									document.getElementById(".id-check").value = "아이디를 5자 이상 입력해주세요.";
// 								} else {
// 									document.getElementById(".id-check").value = "사용 가능한 아이디입니다.";
// 								}
// 							}
// 						},
// 						error : function(error) {
// 							alert(error.statusText);
// 						}
// 					});

// 			return false;
// 		}
	}

	function pwCheck() {
		var input = document.querySelector("input[name=pw]").value;
		var regex = /^[\w]{6,15}$/g;
		if (input.length < 1) {
			document.querySelector(".pw-check").innerHTML = "비밀번호를 입력하세요";
			return false;
		} else if (!regex.test(input)) {
			document.querySelector(".pw-check").innerHTML = "6자이상 15자이하";
			return false;
		} else {
			document.querySelector(".pw-check").innerHTML = " ";
			return true;
		}
	}

	function pw2Check() {
		var pw = document.querySelector("input[name=pw]");
		var pw2 = document.querySelector("input[name=pw2]");

		if (pw.value.length < 1) {
			document.querySelector(".pw-recheck").innerHTML = "";
			return false;
		} else if (pw.value == pw2.value) {
			document.querySelector(".pw-recheck").innerHTML = "일치";
			return true;
		} else {
			document.querySelector(".pw-recheck").innerHTML = "불일치";
			return false;
		}
	}

	function sendCheck() {
		//폼의 전송을 중지하고 검사한 뒤에 합격이면 전송한다

		//기본 이벤트를 중지시키는 명령
		event.preventDefault();

		//검사
		var result = pwCheck() & pw2Check();
		if (!result)
			return;

		//전송
		var form = document.querySelector("form");
		form.submit();
	}
</script>

<!-- <script type="text/javascript"> -->
<%-- // 	var message = '${msg}'; --%>
<!-- // 	alert(message); -->
<!-- </script> -->

</head>
<style>
</style>


<body>
	<div class="page area-90 center">
		<header>
			<div class="right">
				<ul class="top-menu text-right">
					<c:choose>
						<c:when test="${login}">
							<li><a href="${pageContext.request.contextPath }/member/logout">LOGOUT</a></li>
							<li><a href="${pageContext.request.contextPath }/member/cart">CART</a></li>
							<li><a href="${pageContext.request.contextPath }/member/mypage">MY PAGE</a></li>
							<li><a href="${pageContext.request.contextPath }/board/qna">Q&amp;A</a></li>
							<%-- 							<c:if test="${admin}"> --%>
							<li><a href="${pageContext.request.contextPath }/admin/home">관리자</a></li>
							<%-- 							</c:if> --%>
						</c:when>
						<c:otherwise>
							<li><a href="${pageContext.request.contextPath }/member/login">LOGIN</a></li>
							<li><a href="${pageContext.request.contextPath }/member/join">JOIN</a></li>
							<li><a href="${pageContext.request.contextPath }/member/cart">CART</a></li>
							<li><a href="${pageContext.request.contextPath }/member/qna">Q&amp;A</a></li>
						</c:otherwise>
					</c:choose>
				</ul>
			</div>
			<div class="center">
				<div>
					<a href="${pageContext.request.contextPath }/home" class="logo"><img src="${pageContext.request.contextPath }/img/moomin.jpg"/></a>
				</div>
			</div>
			<!-- 			http://pyeonne.tistory.com/9 -->
		</header>
		<nav>
			<ul class="menu">
				<li><a href="#">NEW</a></li>
				<li><a href="#">BEST</a></li>
				<li><a href="#">PUMPS</a></li>
				<li><a href="#">BOOTS/ANKLE</a></li>
				<li><a href="#">SNEAKERS</a></li>
				<li><a href="#">FLAT/LOAFER</a></li>
				<li><a href="#">LUXURY</a></li>
				<li><a href="#">SALE</a></li>
			</ul>
		</nav>
		<!-- // 			http://autumnly.tistory.com/61 -->
		<main> <!-- 		http://blog.naver.com/hanhunh89/220403113901 -->