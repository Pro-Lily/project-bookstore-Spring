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
	<section class="cart_area section_padding" style="padding-top: 5%">
		<div class="container">
			<div class="cart_inner">
				<div class="table-responsive">
					<table class="table">
						<thead>
							<tr>
								<th scope="col">원고 등록일</th>
								<td><fmt:formatDate value="${b.script_date}"/></td>
								<%-- <td>${b.script_date}</td> --%>
							</tr>
							<tr>
								<th scope="col">작성자</th>
								<td>${b.author}</td>
							</tr>
							<tr>
								<th scope="col">장르</th>
								<td>${b.category_no}</td>
							</tr>
							<tr>
								<th scope="col">원고 제목</th>
								<td>${b.script_title}</td>
							</tr>
							<tr>
								<th scope="col">원고 소개</th>
								<td>${b.script_contents}</td>
							</tr>
							<tr>
								<th scope="col">조회수</th>
								<td>${b.script_hit}</td>
							</tr>
							<tr>
								<th scope="col">원고 파일</th>
								<td><a href="<%=application.getContextPath()%>/script/fileDownload?fileName=${b.script_image}"><h5>${b.script_image}</h5></a></td>
							</tr>
						</thead>
					</table>
					<c:set var="memberId" value="${b.member_id}"/>
					<c:if test="${id == memberId}">
						<div class="checkout_btn_inner float-left">
							<form action="<%=application.getContextPath()%>/script/script_updateform/${b.script_no}/${pg}" method="post">
								<input class="btn_1" type="submit" value="수정하기">
							</form>
						</div>
						<div class="checkout_btn_inner float-right">
							<form action="<%=application.getContextPath()%>/script/script_delete" method="post">
								<input type="hidden" name="script_no" value="${b.script_no}">
								<input type="hidden" name="pg" value="${pg}">
								<input class="btn_1 checkout_btn_1" type="submit" value="삭제하기">
							</form>
						</div>
					</c:if>
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