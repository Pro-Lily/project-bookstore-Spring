<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
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
	<link rel="stylesheet" href="<%=application.getContextPath()%>/resources/assets/css/bootstrap.min.css">
	<link rel="stylesheet" href="<%=application.getContextPath()%>/resources/assets/css/owl.carousel.min.css">
	<link rel="stylesheet" href="<%=application.getContextPath()%>/resources/assets/css/flaticon.css">
	<link rel="stylesheet" href="<%=application.getContextPath()%>/resources/assets/css/slicknav.css">
	<link rel="stylesheet" href="<%=application.getContextPath()%>/resources/assets/css/animate.min.css">
	<link rel="stylesheet" href="<%=application.getContextPath()%>/resources/assets/css/magnific-popup.css">
	<link rel="stylesheet" href="<%=application.getContextPath()%>/resources/assets/css/fontawesome-all.min.css">
	<link rel="stylesheet" href="<%=application.getContextPath()%>/resources/assets/css/themify-icons.css">
	<link rel="stylesheet" href="<%=application.getContextPath()%>/resources/assets/css/slick.css">
	<link rel="stylesheet" href="<%=application.getContextPath()%>/resources/assets/css/nice-select.css">
	<link rel="stylesheet" href="<%=application.getContextPath()%>/resources/assets/css/style.css">
	<link rel="stylesheet" href="<%=application.getContextPath()%>/resources/css/shop-style.css">
	<script src="https://cdn.ckeditor.com/ckeditor5/23.1.0/classic/ckeditor.js"></script>
	<style type="text/css">
		.ck-editor__editable {
			min-height: 800px;
		}
		
		.content img {
			width: 100%;
		}
	</style>
</head>
<body>

	<header>
		<!-- Header Start -->
		<jsp:include page="/WEB-INF/views/include/menu.jsp" />
		<!-- Header End -->
	</header>

	<div id="bookDetail" class="container">
		<div class="row">
			<div class="item">
				<div class="photo">
					<img src="photodownload?fileName=${book.book_image}" width="300"
						class="middle">
				</div>
				<div class="item_info_box" style="padding-left: 4%;">
					<form action="<%=application.getContextPath()%>/shop/updateAndCart/${id}" method="post">
						<div class="item_detail">
							<h3>${book.book_title}</h3>
							<div class="item_list">
								<dl>
									<dt>????????????</dt>
									<dd>${book.category_no}</dd>
								</dl>
								<dl>
									<dt>??????</dt>
									<dd>${book.author}</dd>
								</dl>
								<dl>
									<dt>?????????</dt>
									<dd>${book.publisher}</dd>
								</dl>
								<dl class="price">
									<dt>?????????</dt>
									<dd>
										<strong><strong>${book.price}</strong></strong>???
									</dd>
								</dl>
								<dl class="count">
									<dt>??????</dt>
									<dd>
										<input type="text" id="book_count" name="book_count"
											value="${book.book_count}">
									</dd>
								</dl>
								<input type="hidden" id="price" name="price"
									value="${book.price}">
								<input type="hidden" id="book_id" name="book_no"
									value="${book.book_no}">
								<input type="hidden" id="member_id" name="member_id"
									value="${id}">
							</div>
							<div class="btn_box">
								<div>
									<input type="submit" class="btn_cart" value="????????????">
								</div>
							</div>
						</div>
					</form>
				</div>
			</div>

			<div style="margin: 5% 0 5% 0; width: 100%;">
				<h5>?????????</h5>
				<div style="margin: 1% 2.5% 0 0; width: 95%; border-top: 1px solid #EAEAEA;">
					<div class="content" style="padding: 20px;">${book.book_contents}</div>
				</div>
			</div>
		</div>
		<sec:authorize access="hasRole('ROLE_ADMIN')">
			<div style="width: 100%; margin: 0 auto 5% auto; text-align: center;">
				<div>
					<a href="javascript:bookContentUpdate(${book.book_no})" class="genric-btn primary smal">??????</a>
					<a href="javascript:bookDelete(${book.book_no})" class="genric-btn primary smal">??????</a>
				</div>
			</div>
		</sec:authorize>
	</div>

	<script>
		function count(type) {
			// ????????? ????????? element
			const resultElement = document.getElementById('result');

			// ?????? ????????? ????????? ???
			let number = resultElement.innerText;

			// ?????????/??????
			if (type === 'plus') {
				number = parseInt(number) + 1;
			} else if (type === 'minus') {
				number = parseInt(number) - 1;
			}

			// ?????? ??????
			resultElement.innerText = number;
		}
	</script>

	<footer>
		<!-- Footer Start-->
		<jsp:include page="/WEB-INF/views/include/footer.jsp" />
		<!-- Footer End-->
	</footer>

	<!-- JS here -->
	<script src="<%=application.getContextPath()%>/resources/js/shop.js"></script>
	<!-- All JS Custom Plugins Link Here here -->
	<script src="<%=application.getContextPath()%>/resources/assets/js/vendor/modernizr-3.5.0.min.js"></script>

	<!-- Jquery, Popper, Bootstrap -->
	<script src="<%=application.getContextPath()%>/resources/assets/js/vendor/jquery-1.12.4.min.js"></script>
	<script src="<%=application.getContextPath()%>/resources/assets/js/popper.min.js"></script>
	<script src="<%=application.getContextPath()%>/resources/assets/js/bootstrap.min.js"></script>
	<!-- Jquery Mobile Menu -->
	<script src="<%=application.getContextPath()%>/resources/assets/js/jquery.slicknav.min.js"></script>

	<!-- Jquery Slick , Owl-Carousel Plugins -->
	<script src="<%=application.getContextPath()%>/resources/assets/js/owl.carousel.min.js"></script>
	<script src="<%=application.getContextPath()%>/resources/assets/js/slick.min.js"></script>

	<!-- One Page, Animated-HeadLin -->
	<script src="<%=application.getContextPath()%>/resources/assets/js/wow.min.js"></script>
	<script src="<%=application.getContextPath()%>/resources/assets/js/animated.headline.js"></script>

	<!-- Scrollup, nice-select, sticky -->
	<script src="<%=application.getContextPath()%>/resources/assets/js/jquery.scrollUp.min.js"></script>
	<script src="<%=application.getContextPath()%>/resources/assets/js/jquery.nice-select.min.js"></script>
	<script src="<%=application.getContextPath()%>/resources/assets/js/jquery.sticky.js"></script>
	<script src="<%=application.getContextPath()%>/resources/assets/js/jquery.magnific-popup.js"></script>

	<!-- contact js -->
	<script src="<%=application.getContextPath()%>/resources/assets/js/contact.js"></script>
	<script src="<%=application.getContextPath()%>/resources/assets/js/jquery.form.js"></script>
	<script src="<%=application.getContextPath()%>/resources/assets/js/jquery.validate.min.js"></script>
	<script src="<%=application.getContextPath()%>/resources/assets/js/mail-script.js"></script>
	<script src="<%=application.getContextPath()%>/resources/assets/js/jquery.ajaxchimp.min.js"></script>

	<!-- Jquery Plugins, main Jquery -->
	<script src="<%=application.getContextPath()%>/resources/assets/js/plugins.js"></script>
	<script src="<%=application.getContextPath()%>/resources/assets/js/main.js"></script>
</body>
</html>