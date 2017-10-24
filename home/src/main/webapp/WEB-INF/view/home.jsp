<!DOCTYPE html>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/view/template/header.jsp"%>
<script>

</script>

<div class="area-100 center">
	<div class="row text-center">
		<div class="swiper-container">
			<div class="swiper-wrapper">
				<!-- 1장의 이미지 영역 -->
				<div class="swiper-slide">
					<img src="img/shoe1.png" width="100%" height="100%">
				</div>
				<div class="swiper-slide">
					<img src="img/shoe2.jpg" width="100%" height="100%">
				</div>

			</div>
			<!-- swiper-wrapper 끝 -->

			<!-- 네비게이터 추가-->
			<div class="swiper-pagination"></div>

			<!-- 이전 / 다음 추가 -->
			<div class="swiper-button-next"></div>
			<div class="swiper-button-prev"></div>
		</div>
	</div>
</div>

<%@ include file="/WEB-INF/view/template/footer.jsp"%>