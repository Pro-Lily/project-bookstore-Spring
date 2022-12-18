<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script>
	var loadFile = function(event){
		var output = document.getElementById('id_view');
		output.src = URL.createObjectURL(event.target.files[0]);
	};
</script>

<form id="bookUpdateForm" action="bookUpload" enctype="multipart/form-data">
	<div style="width: 80%; margin: 10% auto;">
		<input type="hidden" id="no" name="no" value="${book.book_no}" />
		<div class="single-post"> 
			<div>
				<p style="color: #2d2d2d;">상품 수정</p>
				<hr style="margin-top: 12px;">
				
				<div class="select box" id="default-select" style="display: inline-block; padding-bottom: 2%;">
					<select id="category_no" name="category_no">
						<c:forEach var="i" items="${category_list}">
							<option value="${i.category_no}">${i.category_name}</option>
						</c:forEach>
					</select>
				</div> 
				<div class="mb-3" style="border: solid 0.1px #F6F6F6; width: 153px; height: 153px; ">
					<img id="id_view" width="150" height="150" src="photodownload?fileName=${book.book_image}"/>
				</div>
				<div class="input-group mb-3" style="height: 30px;">
					<div class="input-group-prepend" >
						<span class="input-group-text">도서 사진을 선택해주세요</span>
					</div>
					<input style="height: 45px;" type="file" id="attach" name="attach" class="form-control" onchange="loadFile(event)">
				</div>
				<div class="input-group mb-3" style="margin-top: 5%;">
					<input id="book_title" type="text" name="book_title" class="form-control" 
							placeholder='  도서 제목' style="height: 45px; font-size: 16px;" value="${book.book_title}"> 
					<span id="titleError" class="error"></span>
				</div>
				<div class="input-group mb-3">
					<input id="author" type="text" name="author" class="form-control"
							placeholder='  저자' style="height: 45px; font-size: 16px;" value="${book.author}">
					<span id="authorError" class="error"></span>
				</div>
				<div class="input-group mb-3">
					<input id="publisher" type="text" name="publisher" class="form-control"
							placeholder='  출판사' style="height: 45px; font-size: 16px;" value="${book.publisher}">
					<span id="publisherError" class="error"></span>
				</div>
				<div class="input-group mb-3">
					<input id="price" type="text" name="price" class="form-control"
							placeholder='  가격' style="height: 45px; font-size: 16px;" value="${book.price}">
					<span id="priceError" class="error"></span>
				</div>
				
				<hr />
	
				<h5 style="color: #2d2d2d;">책 소개</h5>
				<textarea id="book_contents" name="book_contents" style="width: 100%; height: 800px;">${book.book_contents}</textarea>
				<span id="contentError" class="error"></span>
			</div>
		</div>
		<div style="margin: 5% 0; text-align: center;">
			<a href="javascript:bookUpdate()" class="genric-btn primary smal">확인</a>
			<a href="<%=application.getContextPath()%>/shop/content" class="genric-btn primary smal">취소</a>
		</div>
	</div>
</form>
<script src="${pageContext.request.contextPath}/resources/js/ckeditor.js"></script>
    