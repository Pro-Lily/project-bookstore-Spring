<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String id = (String) session.getAttribute("sessionMid");
%>
<c:set var="id" value="<%=id%>" />
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>Triple BookStore</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="shortcut icon" type="image/x-icon" href="<%=application.getContextPath() %>/resources/assets/img/open-book.ico">

<!-- CSS here -->
<link rel="stylesheet"
	href="<%=application.getContextPath()%>/resources/assets/css/bootstrap.min.css">
<link rel="stylesheet"
	href="<%=application.getContextPath()%>/resources/assets/css/owl.carousel.min.css">
<link rel="stylesheet"
	href="<%=application.getContextPath()%>/resources/assets/css/flaticon.css">
<link rel="stylesheet"
	href="<%=application.getContextPath()%>/resources/assets/css/slicknav.css">
<link rel="stylesheet"
	href="<%=application.getContextPath()%>/resources/assets/css/animate.min.css">
<link rel="stylesheet"
	href="<%=application.getContextPath()%>/resources/assets/css/magnific-popup.css">
<link rel="stylesheet"
	href="<%=application.getContextPath()%>/resources/assets/css/fontawesome-all.min.css">
<link rel="stylesheet"
	href="<%=application.getContextPath()%>/resources/assets/css/themify-icons.css">
<link rel="stylesheet"
	href="<%=application.getContextPath()%>/resources/assets/css/slick.css">
<link rel="stylesheet"
	href="<%=application.getContextPath()%>/resources/assets/css/nice-select.css">
<link rel="stylesheet"
	href="<%=application.getContextPath()%>/resources/assets/css/style.css">

</head>

<body>

	<header>
		<jsp:include page="/WEB-INF/views/include/menu.jsp" />
	</header>

	<!-- slider Area Start-->
	<div class="slider-area ">
		<!-- Mobile Menu -->
		<div class="single-slider slider-height2 d-flex align-items-center"
			data-background="<%=application.getContextPath()%>/resources/assets/img/hero/category.jpg">
			<div class="container">
				<div class="row">
					<div class="col-xl-12">
						<div class="hero-cap text-center">
							<h2>장바구니</h2>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- slider Area End-->

	<!--================Cart Area =================-->
	<section class="cart_area section_padding">
		<div class="container">
			<div class="cart_inner">
				<div class="table-responsive">
					<form action="<%=application.getContextPath()%>/orders/insertOrders/${id}" method="post" id="insertOrders">
						<table class="table">
							<thead>
								<tr>
									<th scope="col">상품정보</th>
									<th scope="col">가격</th>
									<th scope="col">수량</th>
									<th scope="col">합계</th>
									<th scope="col">삭제</th>
								</tr>
							</thead>
	
							<c:forEach var="cd" items="${cardRead}">
								<c:if test="${cd.cart_no != null}">
									<tbody>
										<tr>
											<td>
												<div class="media">
													<div class="d-flex">
														<img src="photodownload?fileName=${cd.book_image}" />
													</div>
													<div class="media-body">
														<p>${cd.book_title}</p>
													</div>
												</div>
											</td>
											<td>
												<h5>${cd.price}</h5>
											</td>
											<td>
												<h5>${cd.book_count}</h5>
											</td>
											<td>
												<h5 class="sum">${cd.total_price}</h5>
											</td>
											<td><a class="btn_1"
												href="<%=application.getContextPath()%>/cart/cart_delete/${id}/${cd.cart_no}">삭제</a>
											</td>
										</tr>
									</tbody>
								</c:if>
							</c:forEach>
							<tr>
								<td></td>
								<td></td>
								<td>
									<h5>최종 결제금액</h5>
								</td>
								<td>
									<h5>${total_price}</h5>
								</td>
								<td></td>
							</tr>
							<tr>
								<td></td>
								<td></td>
								<td>
									<h5>결제방법</h5>
								</td>	
								<td>
									<select id="order_type" name="order_type">
											<option value="카드결제" selected="selected">카드결제</option>
											<option value="계좌이체">계좌이체</option>
											<option value="PAYCO">PAYCO</option>
									</select>
								</td>
								<td></td>
							</tr>
						</table>
						<input type="hidden" id="member_id" name="member_id" value="${id}">
						<input type="hidden" id="price" name="price" value="${total_price}">
						<div class="checkout_btn_inner float-right">
							<a class="btn_1" href="<%=application.getContextPath()%>/shop/content">쇼핑계속하기</a>
							<input class="btn_1 checkout_btn_1" type="submit" value="주문하기">
						</div>
					</form>
				</div>
			</div>
		</div>
	</section>
	<!--================End Cart Area =================-->

	<footer>
		<jsp:include page="/WEB-INF/views/include/footer.jsp" />
	</footer>

	<!-- JS here -->

	<!-- All JS Custom Plugins Link Here here -->
	<script
		src="<%=application.getContextPath()%>/resources/assets/js/vendor/modernizr-3.5.0.min.js"></script>

	<!-- Jquery, Popper, Bootstrap -->
	<script
		src="<%=application.getContextPath()%>/resources/assets/js/vendor/jquery-1.12.4.min.js"></script>
	<script
		src="<%=application.getContextPath()%>/resources/assets/js/popper.min.js"></script>
	<script
		src="<%=application.getContextPath()%>/resources/assets/js/bootstrap.min.js"></script>
	<!-- Jquery Mobile Menu -->
	<script
		src="<%=application.getContextPath()%>/resources/assets/js/jquery.slicknav.min.js"></script>

	<!-- Jquery Slick , Owl-Carousel Plugins -->
	<script
		src="<%=application.getContextPath()%>/resources/assets/js/owl.carousel.min.js"></script>
	<script
		src="<%=application.getContextPath()%>/resources/assets/js/slick.min.js"></script>

	<!-- One Page, Animated-HeadLin -->
	<script
		src="<%=application.getContextPath()%>/resources/assets/js/wow.min.js"></script>
	<script
		src="<%=application.getContextPath()%>/resources/assets/js/animated.headline.js"></script>

	<!-- Scrollup, nice-select, sticky -->
	<script
		src="<%=application.getContextPath()%>/resources/assets/js/jquery.scrollUp.min.js"></script>
	<script
		src="<%=application.getContextPath()%>/resources/assets/js/jquery.nice-select.min.js"></script>
	<script
		src="<%=application.getContextPath()%>/resources/assets/js/jquery.sticky.js"></script>
	<script
		src="<%=application.getContextPath()%>/resources/assets/js/jquery.magnific-popup.js"></script>

	<!-- contact js -->
	<script
		src="<%=application.getContextPath()%>/resources/assets/js/contact.js"></script>
	<script
		src="<%=application.getContextPath()%>/resources/assets/js/jquery.form.js"></script>
	<script
		src="<%=application.getContextPath()%>/resources/assets/js/jquery.validate.min.js"></script>
	<script
		src="<%=application.getContextPath()%>/resources/assets/js/mail-script.js"></script>
	<script
		src="<%=application.getContextPath()%>/resources/assets/js/jquery.ajaxchimp.min.js"></script>

	<!-- Jquery Plugins, main Jquery -->
	<script
		src="<%=application.getContextPath()%>/resources/assets/js/plugins.js"></script>
	<script
		src="<%=application.getContextPath()%>/resources/assets/js/main.js"></script>
</body>
</html>