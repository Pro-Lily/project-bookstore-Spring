<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String id = (String) session.getAttribute("sessionMid");
%>
<c:set var="id" value="<%=id%>"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Triple BookStore</title>
<link rel="shortcut icon" type="image/x-icon" href="<%=application.getContextPath() %>/resources/assets/img/open-book.ico">
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
	
	<form action="script_write" method="post" id="script_writeform" enctype="multipart/form-data">
		<div>
			<div>
				<h3 style="color: #2d2d2d; text-align: center;">원고 등록</h3>
				<hr style="margin-top:20px;">
				
				<div class="select box" id="default-select" style="display: inline-block; margin-top: 3%; margin-left: 20%; margin-right: 20%;">
					<select id="category_no" name="category_no">
						<c:forEach var="i" items="${category_list}">
							<option value="${i.category_no}">${i.category_name}</option>
						</c:forEach>
					</select>
				</div>
				
				<div style="margin-top: 3%; margin-left: 20%; margin-right: 20%;">
					<input class="form-control" type="text" id="author" name="author" placeholder='이름' style="height: 45px; font-size: 16px;"> 
				</div>
								
				<div style="margin-top: 3%; margin-left: 20%; margin-right: 20%;">
					<input class="form-control" type="text" id="script_title" name="script_title" placeholder='원고 제목' style="height: 45px; font-size: 16px;"> 
				</div>
				
				<div style="margin-top: 3%; margin-left: 20%; margin-right: 20%;">
					<textarea id="script_contents" name="script_contents" placeholder='원고 소개' style="width: 100%; height: 300px;"></textarea> 
				</div>
				
				<div style="margin-top: 3%; margin-left: 20%; margin-right: 20%;">
					 <input type="file" name="uploadFile"/>
				</div>
				
				<input type="hidden" id="member_id" name="member_id" value="${id}">
				
				<div class="checkout_btn_inner float-right" style="margin-right: 20%;">
					<input class="btn_1" type="submit" value="원고 등록">
				</div>
			</div>
		</div>
	</form>
</body>
</html>