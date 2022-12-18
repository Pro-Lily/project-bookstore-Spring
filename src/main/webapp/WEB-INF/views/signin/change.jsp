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
	<script>
	/* 	function pwdChange(){
			var id = $("#member_id").val();
			var name = $("#member_name").val();
			var email = $("member_email").val();
			
			$.ajax({
				url: "changePwd",
				method: "post",
				data: {id:id, name:name, email:email}
				success : function(data){
					if(data.result == "success"){
						location.href = "pwdinput";
					}else{
						$('#Msg').html('<p style="color:red">입력된 정보가 없습니다.</p>')
					}
				} 
				
			});
		
		} */
		
	</script>
<body>
 	<header>
        <!-- Header Start -->
        <jsp:include page="/WEB-INF/views/include/menu.jsp" />
        <!-- Header End -->
    </header>

	<main>
		<div class="container" >
			<div class="row">
				<div class="col-lg-6 col-sm-12" style="margin: 3% auto 8% auto;">	
					<form method="post" action="changePwd">
						<div class="input-group mb-10" style="width: 100%;">
							<input type="text" class="form-control" id="member_id" name="member_id" placeholder='  아이디를 입력하세요'>
						</div>
						
						<div class="input-group mb-10" style="width: 100%;">
							<input type="text" class="form-control" id="member_name" name="member_name" placeholder='  이름을 입력하세요'>
						</div>
						
						<div class="input-group mb-10" style="width: 100%;">
							<input type="text" class="form-control" id="member_email" name="member_email" placeholder='  이메일을 입력하세요'>
						</div>
						<div id="Msg"></div>
						<div class="button-group-area mt-40" style="font-size: 15px; margin-top: 10px;">
							<input type="submit" value="확인">
						</div>
					</form>
				</div>
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