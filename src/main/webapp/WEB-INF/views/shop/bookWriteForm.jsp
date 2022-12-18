<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page contentType="text/html; charset=UTF-8"%>

<form id="bookWriteForm" action="bookUpload" enctype="multipart/form-data">
	<div class="single-post" style="width: 80%; margin: 0 auto;"> 
		<div>
			<p style="color: #2d2d2d;">상품등록</p>
			<hr style="margin-top: 12px;">
			
			<!-- 카테고리 선택 시작 -->
			<div class="select box" id="default-select" style="display: inline-block; padding-bottom: 2%;">
				<select id="category_no" name="category_no">
					<c:forEach var="i" items="${category_list}">
						<option value="${i.category_no}">${i.category_name}</option>
					</c:forEach>
				</select>
			</div> 
			<!-- 카테고리 선택 끝 -->
			
			<!-- 도서 사진 등록 시작 -->
			<div class="input-group mb-3" style="height: 30px;">
				<div class="input-group-prepend" >
					<span class="input-group-text">도서 사진을 선택해주세요</span>
				</div>
				<input style="height: 45px;" type="file" id="attach" name="attach" class="form-control">
			</div>
			<!-- 도서 사진 등록 끝 -->
			
			<!-- 제목 -->
			<div class="input-group mb-3" style="margin-top: 5%;">
				<input id="book_title" type="text" name="book_title" class="form-control" 
						placeholder='  도서 제목' style="height: 45px; font-size: 16px;"> 
				<span id="titleError" class="error"></span>
			</div>
			<!-- 제목 -->

			<!-- 저자 -->
			<div class="input-group mb-3">
				<input id="author" type="text" name="author" class="form-control"
						placeholder='  저자' style="height: 45px; font-size: 16px;">
				<span id="authorError" class="error"></span>
			</div>
			<!-- 저자 -->
			
			<!-- 출판사 -->
			<div class="input-group mb-3">
				<input id="publisher" type="text" name="publisher" class="form-control"
						placeholder='  출판사' style="height: 45px; font-size: 16px;">
				<span id="publisherError" class="error"></span>
			</div>
			<!-- 출판사 -->
			
			<!-- 책 가격 -->
			<div class="input-group mb-3">
				<input id="price" type="text" name="price" class="form-control"
						placeholder='  가격' style="height: 45px; font-size: 16px;">
				<span id="priceError" class="error"></span>
			</div>
			<!-- 책 가격 -->
			
			<hr />

			<!-- 내용 -->
			<h5 style="color: #2d2d2d;">책 소개</h5>
			<textarea id="book_contents" name="book_contents" style="width: 100%; height: 800px;"></textarea>
			<span id="contentError" class="error"></span>
			<!-- 내용 -->
		</div>
	</div>

	<div style="margin: 5% 0; text-align: center;">
		<a href="javascript:bookWrite()" class="genric-btn primary smal">확인</a>
		<a href="<%=application.getContextPath()%>/shop/content" class="genric-btn primary smal">취소</a>
	</div>
</form>
<script src="${pageContext.request.contextPath}/resources/js/ckeditor.js"></script>