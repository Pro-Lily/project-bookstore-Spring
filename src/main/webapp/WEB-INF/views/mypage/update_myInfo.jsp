<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
String id = (String) session.getAttribute("sessionMid");
%>
<c:set var="id" value="<%=id%>" />
<!DOCTYPE html>
<head>
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>Triple BookStore</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="<%= application.getContextPath() %>/resources/js/myInfo.js"></script>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="manifest" href="site.webmanifest">
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
	<!--================INFO Area =================-->
	<section class="cart_area section_padding">
		<div class="container">
			<div class="cart_inner">
				<div class="table-responsive">
					<form action="<%=application.getContextPath()%>/mypage/update"
						method="post" id="update_form">
						<table class="table">
							<thead>
								<tr>
									<th scope="col">ID</th>
									<td>
									<input type="hidden" name="member_id" value="${readMyInfo.member_id}">
									${readMyInfo.member_id}
									</td>
								</tr>
								<tr>
									<th scope="col">NAME</th>
									<td><input type="text" name="member_name"
										value="${readMyInfo.member_name}"></td>
								</tr>
								<tr>
									<th scope="col">EMAIL</th>
									<td><input type="text" name="member_email"
										value="${readMyInfo.member_email}"></td>
								</tr>
								<tr>
									<th scope="col">POSTNO</th>
									<td><input type="text" name="member_postno"
										value="${readMyInfo.member_postno}"></td>
								</tr>
								<tr>
									<th scope="col">ADDRESS</th>
									<td><input type="text" name="member_address"
										value="${readMyInfo.member_address}"></td>
								</tr>
								<tr>
									<th scope="col">TEL</th>
									<td><input type="text" name="member_tel"
										value="${readMyInfo.member_tel}"></td>
								</tr>
								<tr>
									<th scope="col">PASSWORD</th>
									<td><input type="password" name="member_pwd"></td>
								</tr>
							</thead>
							<tr>
								<td colspan="2">
									<div class="checkout_btn_inner float-right">
										<input class="btn_1" type="submit" value="수정">
										<input class="btn_1" type="reset" value="취소">
									</div>
								</td>
							</tr>
						</table>
					</form>
				</div>
			</div>
		</div>
	</section>
	<!--================End MyInfo Area =================-->

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