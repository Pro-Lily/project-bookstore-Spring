<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

<body>
    
   <header>
        <!-- Header Start -->
        <jsp:include page="/WEB-INF/views/include/menu.jsp" />
        <!-- Header End -->
   </header>

  <!-- slider Area Start-->
  <div class="slider-area ">
    <!-- Mobile Menu -->
    <div class="single-slider slider-height2 d-flex align-items-center" data-background="<%=application.getContextPath()%>/resources/assets/img/hero/category.jpg">
        <div class="container">
            <div class="row">
                <div class="col-xl-12">
                    <div class="hero-cap text-center">
                        <h2>About</h2>
                    </div>
                </div>
            </div>
        </div>
    </div>
  </div>
  <!-- slider Area End-->
    
    <!-- product list part start-->
    <section class="about_us padding_top">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-lg-8">
                    <div class="about_us_content">
                        <h5>Our Mission</h5>
                        <h3>Donec imperdiet congue orci consequat mattis. Donec rutrum porttitor sollicitudin. Pellentesque id dolor tempor sapien feugiat ultrices nec sed neque.</h3>
                        <div class="about_us_video">
                            <img src="<%=application.getContextPath()%>/resources/assets/img/about_us_video.png" alt="#" class="img-fluid">
                            <a class="about_video_icon popup-youtube" href="https://www.youtube.com/watch?v=DWHB6nTyKDI"></a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- product list part end-->

    <!-- feature part here -->
    <section class="feature_part section_padding">
        <div class="container">
            <div class="row justify-content-between">
                <div class="col-lg-6">
                    <div class="feature_part_tittle">
                        <h3>Credibly innovate granular
                        internal or organic sources
                        whereas standards.</h3>
                    </div>
                </div>
                <div class="col-lg-5">
                    <div class="feature_part_content">
                        <p>Seamlessly empower fully researched growth strategies and interoperable internal or “organic” sources. Credibly innovate granular internal or “organic” sources whereas high standards in web-readiness.</p>
                    </div>
                </div>
            </div>
            <div class="row justify-content-center">
                <div class="col-lg-3 col-sm-6">
                    <div class="single_feature_part">
                        <img src="<%=application.getContextPath()%>/resources/assets/img/icon/feature_icon_1.svg" alt="#">
                        <h4>Credit Card Support</h4>
                    </div>
                </div>
                <div class="col-lg-3 col-sm-6">
                    <div class="single_feature_part">
                        <img src="<%=application.getContextPath()%>/resources/assets/img/icon/feature_icon_2.svg" alt="#">
                        <h4>Online Order</h4>
                    </div>
                </div>
                <div class="col-lg-3 col-sm-6">
                    <div class="single_feature_part">
                        <img src="<%=application.getContextPath()%>/resources/assets/img/icon/feature_icon_3.svg" alt="#">
                        <h4>Free Delivery</h4>
                    </div>
                </div>
                <div class="col-lg-3 col-sm-6">
                    <div class="single_feature_part">
                        <img src="<%=application.getContextPath()%>/resources/assets/img/icon/feature_icon_4.svg" alt="#">
                        <h4>Product with Gift</h4>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- feature part end -->
    
    <!-- client review part here -->
    <section class="client_review">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-lg-8">
                    <div class="client_review_slider owl-carousel">
                        <div class="single_client_review">
                            <div class="client_img">
                                <img src="<%=application.getContextPath()%>/resources/assets/img/client.png" alt="#">
                            </div>
                            <p>"Working in conjunction with humanitarian aid agencies, we have supported programmes to help alleviate human suffering.</p>
                            <h5>- Micky Mouse</h5>
                        </div>
                        <div class="single_client_review">
                            <div class="client_img">
                                <img src="<%=application.getContextPath()%>/resources/assets/img/client_1.png" alt="#">
                            </div>
                            <p>"Working in conjunction with humanitarian aid agencies, we have supported programmes to help alleviate human suffering.</p>
                            <h5>- Micky Mouse</h5>
                        </div>
                        <div class="single_client_review">
                            <div class="client_img">
                                <img src="<%=application.getContextPath()%>/resources/assets/img/client_2.png" alt="#">
                            </div>
                            <p>"Working in conjunction with humanitarian aid agencies, we have supported programmes to help alleviate human suffering.</p>
                            <h5>- Micky Mouse</h5>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- client review part end -->

    <!-- subscribe part here -->
    <section class="subscribe_part section_padding">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-lg-8">
                    <div class="subscribe_part_content">
                        <h2>Get promotions & updates!</h2>
                        <p>Seamlessly empower fully researched growth strategies and interoperable internal or “organic” sources credibly innovate granular internal .</p>
                        <div class="subscribe_form">
                            <input type="email" placeholder="Enter your mail">
                            <a href="#" class="btn_1">Subscribe</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- subscribe part end -->

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