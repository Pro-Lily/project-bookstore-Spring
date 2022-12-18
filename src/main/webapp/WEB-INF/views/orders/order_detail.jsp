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
  <link rel="manifest" href="site.webmanifest">
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
      <div class="single-slider slider-height2 d-flex align-items-center" data-background="assets/img/hero/category.jpg">
          <div class="container">
              <div class="row">
                  <div class="col-xl-12">
                      <div class="hero-cap text-center">
                          <h2>주문서</h2>
                      </div>
                  </div>
              </div>
          </div>
      </div>
  </div>
  <!-- slider Area End-->
  <!--================ confirmation part start =================--> 
  <section class="confirmation_part section_padding">
    <div class="container">
      <div class="row">
        <div class="col-lg-12">
          <div class="confirmation_tittle">
            <span>감사합니다. 주문이 접수되었습니다.</span>
          </div>
        </div>
        <div class="col-lg-6 col-lx-4">
          <div class="single_confirmation_details">
            <h4>주문 정보</h4>
            <ul>
              <li>
                <p>주문 번호</p><span>:  ${order.order_no}</span>
              </li>
              <li>
                <p>주문 날짜</p><span>:  <fmt:formatDate value="${order.order_date}"/></span>
              </li>
              <li>
                <p>결제 금액</p><span>:  ${order.price}원</span>
              </li>
              <li>
                <p>결제 방법</p><span>:  ${order.order_type}</span>
              </li>
            </ul>
          </div>
        </div>
        <div class="col-lg-6 col-lx-4">
          <div class="single_confirmation_details">
            <h4>배송 주소</h4>
            <ul>
              <li>
                <p>우편번호</p><span>:${readMyInfo.member_postno}</span>
              </li>
              <li>
                <p>주소</p><span>: ${readMyInfo.member_address}</span>
              </li>
              <li>
                <p>상세 주소</p><span>: ${readMyInfo.member_detail_address}</span>
              </li>
            </ul>
          </div>
        </div>
      </div>
      <div class="row">
        <div class="col-lg-12">
          <div class="order_details_iner">
            <h3>주문 상품</h3>
            <table class="table table-borderless">
              <thead>
                <tr>
                  <th scope="col" colspan="2">상품명</th>
                  <th scope="col">수량</th>
                  <th scope="col">가격</th>
                </tr>
              </thead>
              <tbody>
              	<c:forEach var="cd" items="${cardRead}">
					<tr>
                  		<th colspan="2"><span>${cd.book_title}</span></th>
                  		<th>${cd.book_count}</th>
                  		<th><span>${cd.total_price}원</span></th>
                	</tr>
              	</c:forEach>
              </tbody>
              <tfoot>
                <tr>
                  <th scope="col" colspan="3">결제 금액</th>
                  <th scope="col">${order.price}원</th>
                </tr>
              </tfoot>
            </table>
          </div>
        </div>
      </div>
    </div>
  </section>
  <!--================ confirmation part end =================-->
     <footer>
       <jsp:include page="/WEB-INF/views/include/footer.jsp" />
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
