<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
<style type="text/css">
table.type09 {
	width: 100%;
	border-collapse: collapse;
	text-align: center;
	line-height: 1.5;
}

table.type09 thead th {
	padding: 10px;
	font-weight: bold;
	vertical-align: top;
	color: #369;
	border-bottom: 3px solid #036;
}

table.type09 tbody th {
	width: 150px;
	padding: 10px;
	font-weight: bold;
	vertical-align: top;
	border-bottom: 1px solid #ccc;
	background: #f3f6f7;
}

table.type09 td {
	width: 350px;
	padding: 10px;
	vertical-align: top;
	border-bottom: 1px solid #ccc;
}
</style>
</head>

<body>


	<header>
		<!-- Header Start -->
		<jsp:include page="/WEB-INF/views/include/menu.jsp" />
		<!-- Header End -->
	</header>

	<main>

		<!-- slider Area Start-->
		<div class="slider-area ">
			<!-- Mobile Menu -->
			<div class="single-slider slider-height2 d-flex align-items-center"
				data-background="<%=application.getContextPath()%>/resources/assets/img/hero/category.jpg">
				<div class="container">
					<div class="row">
						<div class="col-xl-12">
							<div class="hero-cap text-center">
								<h2>원고</h2>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- slider Area End-->

		<!-- Latest Products Start -->
		<section class="latest-product-area latest-padding">
			<div class="container">
				<div class="row product-btn d-flex justify-content-between">
					<div class="properties__button">
						<nav>
							<div class="nav nav-tabs" id="nav-tab" role="tablist">
								<!-- <a class="nav-item nav-link active" id="nav-home-tab"
									data-toggle="tab" href="#nav-home" role="tab"
									aria-controls="nav-home" aria-selected="true">All</a> <a
									class="nav-item nav-link" id="nav-profile-tab"
									data-toggle="tab" href="#nav-profile" role="tab"
									aria-controls="nav-profile" aria-selected="false">New</a> <a
									class="nav-item nav-link" id="nav-contact-tab"
									data-toggle="tab" href="#nav-contact" role="tab"
									aria-controls="nav-contact" aria-selected="false">Featured</a>
								<a class="nav-item nav-link" id="nav-last-tab" data-toggle="tab"
									href="#nav-last" role="tab" aria-controls="nav-contact"
									aria-selected="false">Offer</a> -->
							</div>
						</nav>
					</div>
				</div>

				<table class="type09">
					<thead>
						<tr>
							<th scope="cols">번호</th>
							<th scope="cols">원고 제목</th>
							<th scope="cols">조회수</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="b" items="${script_list}">
							<tr>
								<th style="width: 20%">${b.script_no}</th>
								<td>
									<c:if test="${b.member_id==sessionMid || sessionMid=='admin'}">
										<a href="<%=application.getContextPath()%>/script/script_detail/${b.script_no}/${pg}">
									</c:if>		
											<h5>${b.script_title}</h5>
										</a>
									
								</td>
								<th style="width: 20%">${b.script_hit}</th>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<br><br>
				<div style="text-align: center" >
					<c:if test="${pg <= pageSize}">
						[ <span style="color: silver">◀◀</span> ]
						[ <span style="color: silver">◀</span> ]
					</c:if>
					<c:if test="${pg > pageSize}">
						[ <a href="<%=application.getContextPath()%>/script/script_list/1">◀◀</a> ]
						[ <a href="<%=application.getContextPath()%>/script/script_list/${startPage-1}">◀</a> ]
					</c:if>
					<c:forEach var="i" begin="${startPage}" end="${endPage}">
						<c:if test="${pg == i}">
							[ ${i} ]
						</c:if>
						<c:if test="${pg != i}">
							[ <a href="<%=application.getContextPath()%>/script/script_list/${i}">${i}</a> ]
						</c:if>
					</c:forEach>
					<c:if test="${endPage >= totalPage}">
						[ <span style="color: silver">▶</span> ]
						[ <span style="color: silver">▶▶</span> ]
					</c:if>
					<c:if test="${endPage < totalPage}">
						[ <a href="<%=application.getContextPath()%>/script/script_list/${endPage+1}">▶</a> ]
						[ <a href="<%=application.getContextPath()%>/script/script_list/${totalPage}">▶▶</a> ]
					</c:if>
				</div>
				
				<br><br>
				
				<div class="checkout_btn_inner float-right">
					<a class="btn_1" href="<%=application.getContextPath()%>/script/script_write_form">원고쓰기</a>
				</div>
			</div>
		</section>
	</main>
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
