<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String id = (String) session.getAttribute("sessionMid");
%>
<c:set var="id" value="<%=id%>"/>
<div class="header-area">
	<div class="main-header ">
		<div class="header-bottom  header-sticky">
			<div class="container-fluid">
				<div class="row align-items-center">
					<!-- Logo -->
					<div class="col-xl-1 col-lg-1 col-md-1 col-sm-3">
						<div class="logo">
							<a href="<%=application.getContextPath()%>/">
								<img src="<%=application.getContextPath()%>/resources/assets/img/logo/triple.png" alt="">
							</a>
						</div>
					</div>
					<div class="col-xl-6 col-lg-8 col-md-7 col-sm-5">
						<!-- Main-menu -->
						<div class="main-menu f-right d-none d-lg-block">
							<nav>
								<ul id="navigation">
									<li>
										<a href="<%=application.getContextPath()%>/">HOME</a>
									</li>
									<li>
										<a href="<%=application.getContextPath()%>/intro/intro_detail">INTRO</a>
									</li>
									<li>
										<a href="<%=application.getContextPath()%>/shop/content">BOOKSTORE</a>
									</li>
									<li>
										<a href="<%=application.getContextPath()%>/script/script_list">SCRIPT</a>
									</li>
									<!-- 로그인 상태에서 보이는 메뉴 -->
									<%
										if(id != null) {
									%>
									<li>
										<a href="<%=application.getContextPath()%>/mypage/myInfo/${id}">MY PAGE</a>
										<ul class="submenu">
											<li>
												<a href="<%=application.getContextPath()%>/cart/cart_detail/${id}">장바구니</a>
											</li>
											<li>
												<a href="<%=application.getContextPath()%>/mypage/myInfo/${id}">개인정보</a>
											</li>
											<li>
												<a href="<%=application.getContextPath()%>/orders/myOrders/${id}">주문 내역</a>
											</li>
											<li>
												<a href="<%=application.getContextPath()%>/mypage/myScript/${id}">원고 내역</a>
											</li>
										</ul>
									</li>
									<%
										}
									%>
								</ul>
							</nav>
						</div>
					</div>
					<div class="col-xl-5 col-lg-3 col-md-3 col-sm-3 fix-card">
						<ul class="header-right f-right d-none d-lg-block d-flex justify-content-between">
							<%
								if(id != null) {
							%>
							<li>
								<div class="shopping-card">
									<a href="<%=application.getContextPath()%>/cart/cart_detail/${id}">
										<i class="fas fa-shopping-cart"></i>
									</a>
								</div>
							</li>
							<%
								}
							%>
							<li class="d-none d-lg-block">
								<!-- isAnonymous() 로그인 -->
								<sec:authorize access="isAnonymous()">
									<a href="<%=application.getContextPath()%>/signin/content" class="btn header-btn">Sign in</a>
								</sec:authorize>
								<!-- isAuthenticated() 로그아웃 -->
								<sec:authorize access="isAuthenticated()">
									<form method="post" action="<%=application.getContextPath()%>/SIGNOUT">
										<input style="color: #fff; border-radius: 30px;" class="btn" type="submit" value='SIGN OUT'/>
									</form>
								</sec:authorize>
							</li>
						</ul>
					</div>
					<!-- Mobile Menu -->
					<div class="col-12">
						<div class="mobile_menu d-block d-lg-none"></div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- <script>
		function go_logout() {
			localStorage.clear();
			location.href = "signin/signinform";
		}
	</script> -->
</div>