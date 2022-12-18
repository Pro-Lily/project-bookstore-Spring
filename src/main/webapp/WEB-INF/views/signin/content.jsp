<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!doctype html> 
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Triple BookStore</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="shortcut icon" type="image/x-icon" href="<%=application.getContextPath() %>/resources/assets/img/open-book.ico">

    <!-- CSS here -->
    <link rel="stylesheet" href="<%= application.getContextPath() %>/resources/assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="<%= application.getContextPath() %>/resources/assets/css/owl.carousel.min.css">
    <link rel="stylesheet" href="<%= application.getContextPath() %>/resources/assets/css/flaticon.css">
    <link rel="stylesheet" href="<%= application.getContextPath() %>/resources/assets/css/slicknav.css">
    <link rel="stylesheet" href="<%= application.getContextPath() %>/resources/assets/css/animate.min.css">
    <link rel="stylesheet" href="<%= application.getContextPath() %>/resources/assets/css/magnific-popup.css">
    <link rel="stylesheet" href="<%= application.getContextPath() %>/resources/assets/css/fontawesome-all.min.css">
    <link rel="stylesheet" href="<%= application.getContextPath() %>/resources/assets/css/themify-icons.css">
    <link rel="stylesheet" href="<%= application.getContextPath() %>/resources/assets/css/slick.css">
    <link rel="stylesheet" href="<%= application.getContextPath() %>/resources/assets/css/nice-select.css">
    <link rel="stylesheet" href="<%= application.getContextPath() %>/resources/assets/css/style.css">
</head>
<style>
.join {
	text-align: center; 
	border: 1px solid #d1d5da; 
	border-radius: 5px; 
	width: 90%; 
	margin: 10px auto 0 auto; 
	font-size: 13px; 
	padding: 15px 0;
}

p {
	color: black;
}

.loginDiv {
	background-color: #FCFCFC; 
	padding: 30px 20px; 
	border-radius: 5px;
}

.loginDiv span {
	font-size: 13px;
	font-weight: 300;
	color: #5A5A5A;
	margin-bottom: 0;
}
</style>
<body>
	   
   <header>
        <!-- Header Start -->
        <jsp:include page="/WEB-INF/views/include/menu.jsp" />
        <!-- Header End -->
    </header>
    
	<main>
		
		<div style="width: 30%; margin: 3% auto 8% auto;">	
			<div style="text-align: center;">
				<img src="<%= application.getContextPath() %>/resources/assets/img/logo/account.png" width="48" height="48">
			</div>
			<p style="text-align: center; font-size: 20px; font-weight: 300; color: #5A5A5A; ">Sign in to Triple</p>
			<form method="post" action="<%=application.getContextPath()%>/SIGNIN">								
				<!-- 아이디 & 비밀번호 입력 -->
				<div class="loginDiv">
					<span>ID</span>
					<div class="input-group mb-10" style="width: 100%;">
						<input type="text" class="form-control" name="member_id" placeholder='  아이디를 입력하세요'>
					</div>
					<span>Password</span>
					<div class="input-group mt-10" style="margin-top: 0">
						<input type="password" class="form-control" name="member_pwd" placeholder='  비밀번호를 입력하세요'>
					</div>
					<div style="text-align: right;">
						<a href="<%= application.getContextPath() %>/signin/change" style="color: #0366d9; font-size: 12px;">Forgot password?</a>
					</div>
					<div class="button-group-area mt-40" style="font-size: 15px; margin-top: 10px;">
						<input class="genric-btn primary circle" type="submit" name="submit" value="SIGN IN" style="width: 100%; border-radius: 5px; background-color:#1b75fd;">
					</div>
				</div>		
			</form>
			<div class="join">
					New to Triple? <a href="<%=application.getContextPath()%>/signup/signup" style="color:#0366d9; font-size: 13px; padding: 4px 3px;">Create an account.</a>
			</div>		
		</div>
	</main>
	
	<footer>
        <!-- Footer Start-->
        <jsp:include page="/WEB-INF/views/include/footer.jsp" />
        <!-- Footer End-->
    </footer>


	<!-- JS here -->

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
