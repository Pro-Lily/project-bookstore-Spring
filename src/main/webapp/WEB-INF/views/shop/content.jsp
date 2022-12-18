<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
	<style>
		.ck-editor__editable {
			min-height: 800px;
		}
	</style>
</head>
<body onload="allPage()">

	<header>
		<!-- Header Start -->
		<jsp:include page="/WEB-INF/views/include/menu.jsp" />
		<!-- Header End -->
	</header>

	<main>	
		<div id="demo" class="carousel slide" data-ride="carousel" style="margin: 0; padding: 0">
		  <ul class="carousel-indicators">
		    <li data-target="#demo" data-slide-to="0" class="active"></li>
		    <li data-target="#demo" data-slide-to="1"></li>
		  </ul>
		  <div class="carousel-inner">
		    <div class="carousel-item active">
		      <img src="<%= application.getContextPath()%>/resources/assets/img/logo/1.jpg" >
		    </div>
		    <div class="carousel-item">
		      <img src="<%= application.getContextPath()%>/resources/assets/img/logo/2.png" >
		    </div>
		  </div>
		  <a class="carousel-control-prev" href="#demo" data-slide="prev">
		    <span class="carousel-control-prev-icon"></span>
		  </a>
		  <a class="carousel-control-next" href="#demo" data-slide="next">
		    <span class="carousel-control-next-icon"></span>
		  </a>
		</div>
		
		<!-- 관리자 활성화 버튼 -->
		<sec:authorize access="hasRole('ROLE_ADMIN')">
			<div style="text-align: center; margin-top: 5px; margin-bottom: 0">
				<a href="javascript:bookWritePage()" style="color: #BDBDBD; border: 1px solid #BDBDBD; padding: 2px;">POSTING</a>
			</div>
		</sec:authorize>
		
		<div class="container" >
			<div class="row" style="height: 150px; ">
				<!-- 카테고리 시작 -->
				<div class="category_list col-lg-12" style="margin-top: 10px; height: 150px;">
					<ul>
						<li><a href="<%= application.getContextPath() %>/shop/content">전체</a></li>
						<c:forEach var="i" items="${category_list}">
							<li><a href="javascript:bookList(${i.category_no})">${i.category_name}</a></li>
						</c:forEach>
					</ul>
				</div>
				<!-- 카테고리 끝 -->
			</div>
		</div>

		<div id="bookstore" class="container" style="margin-bottom: 10%;">
			<div id="book_result" class="row">
				
			</div>
		</div>
	</main>
		
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