<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/template/header.jsp"%>

<style>
.galleryCategoryMenu {float;left;
	clear: both;
	width: 100%;
}

.galleryCategoryMenu ul {
	float: left;
	width: 100%;
	padding: 0 2%;
}

.galleryCategoryMenu ul li {
	background: #e4e4e4;
	background:
		url(data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIiA/Pgo8c3ZnIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyIgd2lkdGg9IjEwMCUiIGhlaWdodD0iMTAwJSIgdmlld0JveD0iMCAwIDEgMSIgcHJlc2VydmVBc3BlY3RSYXRpbz0ibm9uZSI+CiAgPGxpbmVhckdyYWRpZW50IGlkPSJncmFkLXVjZ2ctZ2VuZXJhdGVkIiBncmFkaWVudFVuaXRzPSJ1c2VyU3BhY2VPblVzZSIgeDE9IjAlIiB5MT0iMCUiIHgyPSIwJSIgeTI9IjEwMCUiPgogICAgPHN0b3Agb2Zmc2V0PSIwJSIgc3RvcC1jb2xvcj0iI2U0ZTRlNCIgc3RvcC1vcGFjaXR5PSIwLjIiLz4KICAgIDxzdG9wIG9mZnNldD0iMTAwJSIgc3RvcC1jb2xvcj0iI2U0ZTRlNCIgc3RvcC1vcGFjaXR5PSIxIi8+CiAgPC9saW5lYXJHcmFkaWVudD4KICA8cmVjdCB4PSIwIiB5PSIwIiB3aWR0aD0iMSIgaGVpZ2h0PSIxIiBmaWxsPSJ1cmwoI2dyYWQtdWNnZy1nZW5lcmF0ZWQpIiAvPgo8L3N2Zz4=);
	background: -moz-linear-gradient(top, rgba(228, 228, 228, 0.3) 0%,
		rgba(228, 228, 228, 1) 100%);
	background: -webkit-gradient(linear, left top, left bottom, color-stop(0%, rgba (
		228, 228, 228, 0.3)), color-stop(100%, rgba(228, 228, 228, 1)));
	background: -webkit-linear-gradient(top, rgba(228, 228, 228, 0.3) 0%,
		rgba(228, 228, 228, 1) 100%);
	background: -o-linear-gradient(top, rgba(228, 228, 228, 0.3) 0%,
		rgba(228, 228, 228, 1) 100%);
	background: -ms-linear-gradient(top, rgba(228, 228, 228, 0.3) 0%,
		rgba(228, 228, 228, 1) 100%);
	background: linear-gradient(to bottom, rgba(228, 228, 228, 0.3) 0%,
		rgba(228, 228, 228, 1) 100%);
	filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#33e4e4e4',
		endColorstr='#e4e4e4', GradientType=0);
	width: 290px;
	height: 80px;
	float: left;
	margin: 0 2% 10px 0;
	list-style-type: none;
	border-radius: 4px;
	-webkit-box-shadow: 0px 1px 3px 0px rgba(2, 2, 2, 0.3);
	-moz-box-shadow: 0px 1px 3px 0px rgba(2, 2, 2, 0.3);
	box-shadow: 0px 1px 3px 0px rgba(2, 2, 2, 0.3);
	position: relative;
	/*box-shadow: 0 1px 5px rgba(0,0,0,0.25), 0 0 50px rgba(0,0,0,0.1) inset;
border-radius: 1%     1%     1%     1% /     1%     1%     1%     1%;*/
	transition: all 0.8s ease;
}

.galleryCategoryMenu ul li:after {
	position: absolute;
	width: 94%;
	height: 20%;
	left: 3%;
	border-radius: 50%;
	z-index: -1;
	bottom: 0%;
	content: "";
	box-shadow: 0 2px 6px rgba(0, 0, 0, 0.2);
	transition: all 0.8s ease;
}

.galleryCategoryMenu ul li:hover:after {
	position: absolute;
	width: 94%;
	height: 20%;
	left: 3%;
	border-radius: 50%;
	z-index: -1;
	bottom: 0%;
	content: "";
	box-shadow: 0 2px 6px rgba(0, 0, 0, 0);
	transition: all 0.8s ease;
}

.galleryCategoryMenu ul li:hover {
	transition: all 0.8s ease;
	-webkit-box-shadow: 0px 1px 3px 0px rgba(2, 2, 2, 0.3);
	-moz-box-shadow: 0px 1px 3px 0px rgba(2, 2, 2, 0.3);
	box-shadow: 0px 1px 3px 0px rgba(2, 2, 2, 0.3);
	background:
		url(data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIiA/Pgo8c3ZnIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyIgd2lkdGg9IjEwMCUiIGhlaWdodD0iMTAwJSIgdmlld0JveD0iMCAwIDEgMSIgcHJlc2VydmVBc3BlY3RSYXRpbz0ibm9uZSI+CiAgPGxpbmVhckdyYWRpZW50IGlkPSJncmFkLXVjZ2ctZ2VuZXJhdGVkIiBncmFkaWVudFVuaXRzPSJ1c2VyU3BhY2VPblVzZSIgeDE9IjAlIiB5MT0iMCUiIHgyPSIwJSIgeTI9IjEwMCUiPgogICAgPHN0b3Agb2Zmc2V0PSIwJSIgc3RvcC1jb2xvcj0iI2U0ZTRlNCIgc3RvcC1vcGFjaXR5PSIwLjciLz4KICAgIDxzdG9wIG9mZnNldD0iMTAwJSIgc3RvcC1jb2xvcj0iI2U0ZTRlNCIgc3RvcC1vcGFjaXR5PSIxIi8+CiAgPC9saW5lYXJHcmFkaWVudD4KICA8cmVjdCB4PSIwIiB5PSIwIiB3aWR0aD0iMSIgaGVpZ2h0PSIxIiBmaWxsPSJ1cmwoI2dyYWQtdWNnZy1nZW5lcmF0ZWQpIiAvPgo8L3N2Zz4=);
	background: -moz-linear-gradient(top, rgba(228, 228, 228, 0.3) 0%,
		rgba(228, 228, 228, 1) 100%);
	background: -webkit-gradient(linear, left top, left bottom, color-stop(0%, rgba(228,
		228, 228, 0.3)), color-stop(100%, rgba(228, 228, 228, 1)));
	background: -webkit-linear-gradient(top, rgba(228, 228, 228, 0.3) 0%,
		rgba(228, 228, 228, 1) 100%);
	background: -o-linear-gradient(top, rgba(228, 228, 228, 0.3) 0%,
		rgba(228, 228, 228, 1) 100%);
	background: -ms-linear-gradient(top, rgba(228, 228, 228, 0.3) 0%,
		rgba(228, 228, 228, 1) 100%);
	background: linear-gradient(to bottom, rgba(228, 228, 228, 0.3) 0%,
		rgba(228, 228, 228, 1) 100%);
	filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#b3e4e4e4',
		endColorstr='#e4e4e4', GradientType=0);
}

.galleryCategoryMenu ul li:nth-child(4n) {
	clear: both;
}

.galleryCategoryMenu ul li a {
	float: left;
	width: 100%;
	padding: 24px 0 24px 20px;
	text-transform: uppercase;
	color: #4c4c4c !important;
	font-size: 20px;
	text-align: left;
	transition: all 0.5s ease;
	background:
		url('https://www.seanhartphotography.co.nz/wp-content/uploads/2014/09/menu-sprites2.png');
}

.galleryCategoryMenu ul li a span {
	font-size: 12px !important;
	margin-top: -10px;
	float: left;
	font-weight: bold;
	background:
		url('https://www.seanhartphotography.co.nz/wp-content/uploads/2014/09/menu-sprites2.png');
}

.galleryCategoryMenu ul li a:hover {
	text-decoration: none !important;
	color: #DB2B1E !important;
	transition: all 0.8s ease;
}

.galleryCategoryMenu ul li.portraits a {
	background-position: 179px -7px;
	background-repeat: no-repeat;
	width: 270px;
	height: 32px;
}

.galleryCategoryMenu ul li.portraits a span {
	background-position: -20px -110px;
	background-repeat: no-repeat;
	width: 51px;
	height: 32px;
	position: relative;
	top: 9px;
	right: 40px;
	float: right;
	transition: all 0.5s ease;
	opacity: 0;
}

.galleryCategoryMenu ul li.sports a {
	background-position: -131px -7px;
	background-repeat: no-repeat;
	width: 270px;
	height: 32px;
}

.galleryCategoryMenu ul li.sports a span {
	background-position: -330px -102px;
	background-repeat: no-repeat;
	width: 52px;
	height: 52px;
	position: relative;
	top: 1px;
	right: 39px;
	float: right;
	transition: all 0.5s ease;
	opacity: 0;
}

.galleryCategoryMenu ul li.weddings a {
	background-position: -484px -7px;
	background-repeat: no-repeat;
	width: 270px;
	height: 32px;
}

.galleryCategoryMenu ul li.weddings a span {
	background-position: -685px -100px;
	background-repeat: no-repeat;
	width: 51px;
	height: 163px;
	position: relative;
	top: -1px;
	right: 38px;
	float: right;
	transition: all 0.5s ease;
	opacity: 0;
}

.galleryCategoryMenu ul li.celebrations a {
	background-position: 180px -193px;
	background-repeat: no-repeat;
	width: 270px;
	height: 32px;
}

.galleryCategoryMenu ul li.celebrations a span {
	background-position: -19px -283px;
	background-repeat: no-repeat;
	width: 51px;
	height: 61px;
	position: relative;
	top: -4px;
	right: 40px;
	float: right;
	transition: all 0.5s ease;
	opacity: 0;
}

.galleryCategoryMenu ul li.animals a {
	background-position: -145px -191px;
	background-repeat: no-repeat;
	width: 270px;
	height: 32px;
}

.galleryCategoryMenu ul li.animals a span {
	background-position: -298px -290px;
	background-repeat: no-repeat;
	width: 119px;
	height: 54px;
	position: relative;
	top: 5px;
	right: 19px;
	float: right;
	transition: all 0.5s ease;
	opacity: 0;
}

.galleryCategoryMenu ul li.personal a {
	background-position: -492px -196px;
	background-repeat: no-repeat;
	width: 270px;
	height: 32px;
}

.galleryCategoryMenu ul li.personal a span {
	background-position: -643px -289px;
	background-repeat: no-repeat;
	width: 129px;
	height: 53px;
	position: relative;
	top: -1px;
	right: 10px;
	float: right;
	transition: all 0.5s ease;
	opacity: 0;
}

.galleryCategoryMenu ul li a:hover span {
	transition: all 0.8s ease;
	opacity: 1;
}

@media all and (max-width: 941px) {
	.galleryCategoryMenu ul li:nth-child(4n) {
		clear: none;
	}
}
</style>

<div class="galleryCategoryMenu center">
	<ul>
		<li class="portraits"><a
			href="${pageContext.request.contextPath }/admin/memberlist">회원관리<span></span></a></li>
		<li class="sports"><a href="/sports">매출내역<span></span></a></li>
		<li class="weddings"><a href="/weddings"> <span></span></a></li>

	</ul>
</div>

<%@ include file="/WEB-INF/view/template/footer.jsp"%>