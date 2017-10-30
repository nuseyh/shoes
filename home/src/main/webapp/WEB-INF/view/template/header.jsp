<%-- <%@page import="home.model.MemberDAO"%> --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>

<head>
<meta charset="UTF-8">
<title>레이아웃</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/common.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/each.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/swiper.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/swiper.min.css">

<script src="https://code.jquery.com/jquery-latest.js"></script>
<script src="${pageContext.request.contextPath}/js/swiper.js"></script>
<style>
/* 이미지 슬라이더의 크기 설정 */
.swiper-container {
	width: 100%;
	height: 500px;
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
	width: 1250px;
}

.top-menu li {
	display: inline-block;
}

.logos {
	position: relative;
	display: inline-block;
	width: 1250px;
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

	function phoneCheck() {
		var phone = document.querySelector("input[name=phone]").value;
		var regex = /^(01[016789]{1}|02|0[3-9]{1}[0-9]{1})([0-9]{3,4})([0-9]{4})$/;

		if (!regex.test(phone)) {
			document.querySelector(".phone-check").innerHTML = "올바른 형식이아닙니다";
			return false;
		}else if(phone==""){
			document.querySelector(".phone-check").innerHTML = "폰번호를 입력하세요";
			return false;
		} 
		else {
			document.querySelector(".phone-check").innerHTML = "";
			return true;
		}
	}

	function emailCheck() {
		var email = document.querySelector("input[name=email]").value;
		var regex = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;

		if (!regex.test(email)) {
			document.querySelector(".email-check").innerHTML = "올바른 형식이아닙니다";
			return false;
		}else if(phone==""){
			document.querySelector(".email-check").innerHTML = "이메일을 입력하세요";
			return false;
		}  else {
			document.querySelector(".email-check").innerHTML = "";
			return true;
		}
	}

	function sendCheck() {
		//폼의 전송을 중지하고 검사한 뒤에 합격이면 전송한다

		//기본 이벤트를 중지시키는 명령
		event.preventDefault();

		//검사
		var result = pwCheck() & pw2Check() & phoneCheck() & emailCheck();
		if (!result)
			alert("제대로 입력하셈");

		//전송
		var form = document.querySelector("form");
		form.submit();
	}
	
	
</script>


</head>
<style>
.logo img {
	width: 270px;
	height: 100px;
}
</style>


<body>
	<div class="page area-80 center">
		<header>
			<div class=" text-right">
				<ul class="top-menu">
					<c:choose>
						<c:when test="${login}">
							<li><a
								href="${pageContext.request.contextPath }/member/logout">LOGOUT</a></li>
							<li><a
								href="${pageContext.request.contextPath }/member/cart">CART</a></li>
							<li><a
								href="${pageContext.request.contextPath }/member/mypage">MY
									PAGE</a></li>
							<li><a href="${pageContext.request.contextPath }/board/list">Q&amp;A</a></li>
							<%-- 							<c:if test="${admin}"> --%>
							<li><a href="${pageContext.request.contextPath }/admin/home">관리자</a></li>
							<%-- 							</c:if> --%>
						</c:when>
						<c:otherwise>
							<li><a
								href="${pageContext.request.contextPath }/member/login">LOGIN</a></li>
							<li><a
								href="${pageContext.request.contextPath }/member/join">JOIN</a></li>
							<li><a
								href="${pageContext.request.contextPath }/member/cart">CART</a></li>
							<li><a href="${pageContext.request.contextPath }/board/list">Q&amp;A</a></li>
						</c:otherwise>
					</c:choose>
				</ul>
			</div>
			<div class="logos center">

				<a href="${pageContext.request.contextPath }/home" class="logo">
				<img src="${pageContext.request.contextPath }/img/logo.jpg" />
				</a>

			</div>
			<!-- 			http://pyeonne.tistory.com/9 -->
		<nav>
			<ul class="menu">
				<li><a href="#">NEW</a></li>
				<li><a href="#">BEST</a></li>
				<li><a
					href="${pageContext.request.contextPath}/product/list?type=pumps">PUMPS</a></li>
				<li><a
					href="${pageContext.request.contextPath}/product/list?type=sneakers">SNEAKERS</a></li>
				<li><a
					href="${pageContext.request.contextPath}/product/list?type=sandal">SANDAL</a></li>
				<li><a
					href="${pageContext.request.contextPath}/product/list?type=flat/loafer">FLAT/LOAFER</a></li>
				<li><a
					href="${pageContext.request.contextPath}/product/list?type=boots">BOOTS</a></li>
				<li><a
					href="${pageContext.request.contextPath}/product/list?type=shoe">SHOE</a></li>
			</ul>
		</nav>
		</header>
		<!-- // 			http://autumnly.tistory.com/61 -->
		<main> <!-- 		http://blog.naver.com/hanhunh89/220403113901 -->