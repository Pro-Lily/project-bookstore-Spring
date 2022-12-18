<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Triple BookStore</title>
 
<link rel="shortcut icon" type="image/x-icon" href="<%=application.getContextPath()%>/resources/assets/img/open-book.ico">
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
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
function execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var addr = ''; // 주소 변수
            var extraAddr = ''; // 참고항목 변수

            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                addr = data.roadAddress;
            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                addr = data.jibunAddress;
            }

            // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
            if(data.userSelectedType === 'R'){
                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraAddr !== ''){
                    extraAddr = ' (' + extraAddr + ')';
                }
                // 조합된 참고항목을 해당 필드에 넣는다.
                document.getElementById("member_address").value = extraAddr;
            
            } else {
                document.getElementById("member_address").value = '';
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('member_postno').value = data.zonecode;
            document.getElementById("member_address").value = addr;
            // 커서를 상세주소 필드로 이동한다.
            document.getElementById("member_detail_address").focus();
        }
    }).open();
}

function tocheckpw(){
	var pw = document.getElementById('member_pwd').value;
	var pwck = document.getElementById('member_pwd_ck').value;
	
	if(pw != pwck){
		document.getElementById('pwck').innerHTML = '비밀번호가 일치하지 않습니다. 다시 입력해 주세요';
		return false;
	}
}
</script>

<style>
input {
	font-size: 16px;
}

.intro {
	text-align: center;
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
		<div class="container" >
			<div class="row">
				<div class="col-md-6 col-sm-12" style="margin: 5% auto 10% auto;">
					<div style="text-align: center;">
						<img src="<%= application.getContextPath() %>/resources/assets/img/logo/member.png" width="48" height="48">
					</div>
					<p class="intro">Create your account</p>
					<form method="post" action="signupform" onsubmit="return tocheckpw()">
						<!-- 이메일 입력 & 비밀번호 입력 시작 -->
						<div style="background-color: #FCFCFC; padding: 10%;">
							
							<div id="checkMsg" style="font-size: 10px; margin: 0; color: red;"></div>
							<div class="input-group mb-3" style="margin: 0">
								<input type="text" id="member_id" name="member_id" class="form-control" placeholder='  아이디'>
								&nbsp;
								<input type="button" onclick="idCk()" value="중복확인">
								<script>
									function idCk() {
										var id = $("#member_id").val();
										
										$.ajax({
											url: "idCheck",
											data: {id:id},
											method: "get",
											success: function (data) {
												if(data.str == "YES"){
													if(id != ''){
														$('#checkMsg').html('사용가능한 ID 입니다.');
													}
												}else{
													if($(id != '')){
														$('#checkMsg').html('이미 사용중인 ID 입니다. 다른 ID를 입력하세요.');
														$('#member_id').val('');
														$('#member_id').focus();
													}
												}
											}
										});
									}
								</script>
							</div>
							
							<div class="input-group mb-3">
								<input type="text" name="member_name" class="form-control" placeholder='  이름'>
							</div>
			
							<div class="input-group mb-3">
								<input type="text" name="member_email" class="form-control" placeholder='  이메일'>
							</div>
							
							<div class="input-group mb-3">
								<input type="text" name="member_tel" class="form-control" placeholder='  전화번호'>
							</div>
							
							<div class="input-group mb-3">
								<input class="form-control" type="text" id="member_postno" name="member_postno" placeholder="  우편번호">
								&nbsp;<input type="button" onclick="execDaumPostcode()" value="우편번호 찾기">
							</div>
							
							<div class="input-group mb-3">
								<input class="form-control" type="text" id="member_address" name="member_address" placeholder="  주소"> 
							</div>
							
							<div class="input-group mb-3">
								<input class="form-control" type="text" id="member_detail_address" name="member_detail_address" placeholder="  상세주소">
							</div>
							
							<div id="pwck" style="color: red; font-size: 10px; margin: 0"></div>
							
							<div class="input-group mb-3">
								<input type="password" id="member_pwd" name="member_pwd" class="form-control" placeholder='  비밀번호'>
							</div>
							
							<div class="input-group mb-3">
								<input type="password" id="member_pwd_ck" name="member_pwd_ck" class="form-control" placeholder='  비밀번호 확인'>	
							</div>
							
							<div class="button-group-area mt-40" style="font-size: 17px;">
								<input class="genric-btn primary" type="submit" value="SIGN UP" style="width: 100%; border-radius: 5px; background-color: black;">
							</div>
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