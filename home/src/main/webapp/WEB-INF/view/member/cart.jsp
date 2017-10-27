<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/template/header.jsp"%>

<style>
.cart_img_col img {
	width: 100%;
	max-width: 100%;
}

/* Mobile */
#store_cart {
	float: left;F
	width: 100%;
}

/* cart header */
.cart_head {
	float: left;
	width: 100%;
	display: table;
	color: black;
	border: 1px solid #e8e8e8;
}

.cart_head li {
	vertical-align: middle;
	padding: 12px;
	font-size: 18px;
	float: left;
}

/* cart header cells */
.cart_head_title {
	display: table-cell;
	width: 100%;
}

.cart_head_product {
	display: none;
}

.cart_head_options {
	display: none;
}

.cart_head_price {
	display: none;
}

/* cart header pseudo-class */
.cart_head li:focus {
	
}

.cart_head li:last-child {
	
}

/* cart item */
.cart_item {
	float: left;
	width: 100%;
	display: table;
	background: #fff;
	border: 1px solid #e8e8e8;
	border-top: none;
}

.cart_item li {
	vertical-align: middle;
	padding: 9px;
	font-size: 0.8em;
	float: left;
}

.cart_item li p {
	font-size: 1.3em;
}

.cart_item li span {
	font-size: 0.9em;
}

.cart_item li h2 {
	font-size: 1.1em;
}

/* cart item cells */
.cart_img_col {
	display: inline-block;
	width: 30%;
	text-align: center;
	background-image: url(https://i.imgur.com/3P8WF5D.jpg);
	background-size: 90%;
	background-position: center center;
	background-repeat: no-repeat;
	height: 100px;
}

.cart_img_col img {
	display: none;
}

.cart_product_col {
	display: inline-block;
	width: 70%;
	padding-bottom: 0 !important;
}

.cart_options_col {
	display: inline-block;
	width: 30%;
}

.cart_options_col input {
	width: 48px;
}

.cart_price_col {
	/* 	text-align: center; */
	display: inline-block;
	width: 20%;
}

.cart_del_col {
	display: inline-block;
	width: 20%;
	text-align: center;
}

.cart_del_col img {
	max-width: 25px;
	cursor: pointer;
}

.cart_del_col img:hover {
	opacity: 0.8;
}

/* cart item pseudo-class */
.cart_item:first-child {
	
}

.cart_item:last-child {
	
}

.cart_item li:first-child {
	
}

.cart_item li:last-child {
	
}

/* Tablet */
@media only screen and (min-width: 481px) {
	/* cart item */
	.cart_item {
		height: 100px;
	}
	.cart_head li {
		float: none;
		font-size: 1em;
	}
	.cart_item li {
		float: none;
	}
	.cart_item li p {
		font-size: 1.2em;
	}
	.cart_item li span {
		font-size: 1em;
	}
	.cart_item li h2 {
		font-size: 1em;
	}

	/* cart header cells */
	.cart_head_title {
		display: none;
	}
	.cart_head_product {
		display: table-cell;
		width: 45%;
	}
	.cart_head_options {
		display: table-cell;
		width: 18.5%;
	}
	.cart_head_price {
		display: table-cell;
		width: 21.625%;
	}

	/* cart item cells */
	.cart_img_col {
		width: 15%;
		display: table-cell;
		background-image: none;
	}
	.cart_img_col img {
		max-width: 60px;
		display: inline-block;
		height: auto;
	}
	.cart_product_col {
		display: table-cell;
		width: 30%;
		padding-bottom: 12px !important;
	}
	.cart_options_col {
		display: table-cell;
		width: 18.5%;
	}
	.cart_price_col {
		display: table-cell;
		width: 11.625%;
	}
	.cart_del_col {
		display: table-cell;
		width: 9%;
	}
	.cart_item li:nth-child(even) {
		/*    background: rgba(0,0,0, 0.1);*/
		
	}
	.cart_head li:nth-child(odd) {
		/*  background: rgba(255, 255, 255, 0.1);*/
		
	}
}

/* Desktop */
@media only screen and (min-width: 769px) {
	/* cart item */
	.cart_head li:nth-child(even) {
		/*  background: rgba(255, 255, 255, 0.1);*/
		
	}
	.cart_head li:nth-child(odd) {
		/*  background: none;*/
		
	}
	.cart_item {
		height: 10px;
	}
	.cart_head li {
		font-size: 0.8em;
	}
	.cart_item li p {
		font-size: 1.4em;
		font-weight: 700;
	}
	.cart_item li span {
		font-size: 1em;
	}
	.cart_item li h2 {
		font-size: 1.4em;
	}

	/* cart header cells */
	.cart_head_title {
		display: table-cell;
		width: 15%;
	}
	.cart_head_product {
		width: 45%;
	}
	.cart_head_options {
		width: 19.5%;
	}
	.cart_head_price {
		width: 18.5%;
	}

	/* cart item cells */
	.cart_img_col {
		
	}
	.cart_img_col img {
		max-width: 75px;
	}
	.cart_product_col {
		width: 45%;
	}
	.cart_price_col {
		width: 11.625%;
	}
	.cart_options_col {
		width: 19.5%;
	}
	.cart_del_col {
		width: 6.875%;
	}
}
</style>

<div class="page area-80 center">
	<form action="" method="post">
		<div id="store_cart center">
			<ul class="cart_head">
				<li class="cart_head_title">이미지</li>
				<li class="cart_head_product">상품정보</li>
				<li class="cart_head_options">수량</li>
				<li class="cart_head_price">판매가</li>
			</ul>

			<ul class="cart_item">

				<li class="cart_img_col"><img
					src="https://i.imgur.com/6SFageC.jpg"></li>

				<li class="cart_product_col">
					<p>Off-Road</p> <span><strong>Size: </strong>XL</span>
				</li>

				<li class="cart_options_col"><span></span> <input type="number"
					min="1" value="1"></li>

				<li class="cart_price_col">
					<h2>399</h2>
				</li>
				<li class="cart_del_col"><img
					src="https://i.imgur.com/bI4oD5C.png"></li>
			</ul>
		</div>

		<div>전체 합계:</div>
		<div class="join-button">
			<input type="submit" value="주문하기">
		</div>
	</form>
</div>
<%@ include file="/WEB-INF/view/template/footer.jsp"%>