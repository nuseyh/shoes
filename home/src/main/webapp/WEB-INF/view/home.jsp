<!DOCTYPE html>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/view/template/header.jsp"%>
<script>
	$(document).ready(function() {
		//.swiper-container에 swiper를 적용
		var slider = new Swiper(".swiper-container", {
			pagination : ".swiper-pagination",//페이징 표시대상
			paginationClickable : true,//페이지 이동을 클릭으로 가능하게 설정
			loop : true,//반복설정
			// 			nextButton : ".swiper-button-next", //다음버튼
			// 			prevButton : ".swiper-button-prev", //이전버튼
			autoplay : 4000,//자동재생 3000밀리초마다
// 			direction : "vertical",//이동방향
			grabCursor : true
		//커서 모양을 움켜쥐는 것으로 교체
		});
	});
</script>

<div class="area-100 center">
	<div class="row text-center">
		<div class="swiper-container">
			<div class="swiper-wrapper">
				<!-- 1장의 이미지 영역 -->
				<div class="swiper-slide">
					<img src="${pageContext.request.contextPath}/img/shoes.jpg"
						width="100%" height="100%">
				</div>
				<div class="swiper-slide">
					<img src="${pageContext.request.contextPath}/img/shoes2.jpg"
						width="100%" height="100%">
				</div>

			</div>
			<!-- swiper-wrapper 끝 -->

			<!-- 네비게이터 추가-->
			<div class="swiper-pagination"></div>

			<!-- 이전 / 다음 추가 -->
			<!-- 			<div class="swiper-button-next"></div> -->
			<!-- 			<div class="swiper-button-prev"></div> -->
		</div>
	</div>
</div>

<%@ include file="/WEB-INF/view/template/footer.jsp"%>