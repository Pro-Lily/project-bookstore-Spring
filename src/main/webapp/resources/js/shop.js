function bookContentUpdate(no) {
	$.ajax({
		url : "bookUpdate",
		data : {
			no : no
		},
		success : function(data) {
			$("#bookDetail").html(data);
		}
	});
}

function bookDelete(no) {
	if (confirm("정말 삭제하시겠습니까?") == true) {

	} else {
		return false;
	}

	$.ajax({
		url : "bookDelete",
		data : {
			no : no
		},
		method : "post",
		success : function(data) {
			if (data.result == "success") {
				location.href = "content";
			}
		}
	});
}

function bookWritePage() {
	$.ajax({
		url : "bookWrite",
		success : function(data) {
			$("#bookstore").html(data);
		}
	});
}

function bookList(no) {
	$.ajax({
		url: "bookList",
		data: {no:no},
		success : function(data) {
			$("#book_result").html(data);
		}
	});
}

function PageCategoryList(no, pageNo) {
	if(!pageNo){
		pageNo = 1;
	}
	$.ajax({
		url: "bookList",
		data: {no:no, pageNo:pageNo},
		success : function(data) {
			$("#book_result").html(data);
		}
	});
}

function bookWrite() {
	var category_no = $("#category_no").val();

	var title = $("#book_title").val().trim();
	if (title == "") {
		$("#titleError").text("제목은 필수로 입력해주세요");
	} else if(title.length >= 50){
		$("#titleError").text("제목은 50자 이하로 작성해주세요");
	} else {
		$("#titleError").text("");
	}

	var author = $("#author").val().trim();
	if (author == "") {
		$("#authorError").text("저자는 필수로 입력해주세요");
	} else if(author.length >= 40){
		$("#authorError").text("저자는 40자 이하로 작성해주세요");
	} else {
		$("#authorError").text("");
	}
	
	var publisher = $("#publisher").val().trim();
	if (publisher == "") {
		$("#publisherError").text("출판사는 필수로 입력해주세요");
	} else if(publisher.length >= 25){
		$("#publisherError").text("출판사는 10자 이하로 작성해주세요");
	} else {
		$("#publisherError").text("");
	}
	
	var price = $("#price").val();
	if (price == "") {
		$("#priceError").text("가격은 필수로 입력해주세요");
	} else {
		$("#priceError").text("");
	}

	
	var content = myEditor.getData();  
	if (content == "") {
		$("#contentError").text("내용은 필수로 입력해주세요");
	} else {
		$("#contentError").text("");
	}

	if (title == "" || content == "") {
		return;
	}

	var file = document.querySelector("#attach");
	var multipart = new FormData();
	
	multipart.append("category_no", category_no);
	multipart.append("book_title", title);
	multipart.append("author", author);
	multipart.append("publisher", publisher);
	multipart.append("price", price);
	multipart.append("book_contents", content);
	
	if(file.files.length != 0) {
		multipart.append("attach", file.files[0]);
	}else {
		alert('도서 사진은 필수로 등록해주세요.');
	}

	$.ajax({
		url : "bookWrite",
		method : "post",
		data : multipart,
		cache: false, 
		processData: false, 
		contentType: false, 
		success : function(data) {
			if (data.result == "success") {
				location.href = "content";
			}
		}
	});
}

function bookUpdate() {
	var no = $("#no").val();
	var category_no = $("#category_no").val();

	var title = $("#book_title").val().trim();
	if (title == "") {
		$("#titleError").text("제목은 필수로 입력해주세요");
	} else if(title.length >= 50){
		$("#titleError").text("제목은 50자 이하로 작성해주세요");
	} else {
		$("#titleError").text("");
	}

	var author = $("#author").val().trim();
	if (author == "") {
		$("#authorError").text("저자는 필수로 입력해주세요");
	} else if(author.length >= 40){
		$("#authorError").text("저자는 40자 이하로 작성해주세요");
	} else {
		$("#authorError").text("");
	}
	
	var publisher = $("#publisher").val().trim();
	if (publisher == "") {
		$("#publisherError").text("출판사는 필수로 입력해주세요");
	} else if(publisher.length >= 25){
		$("#publisherError").text("출판사는 10자 이하로 작성해주세요");
	} else {
		$("#publisherError").text("");
	}
	
	var price = $("#price").val();
	if (price == "") {
		$("#priceError").text("가격은 필수로 입력해주세요");
	} else {
		$("#priceError").text("");
	}

	
	var content = myEditor.getData();   
	if (content == "") {
		$("#contentError").text("내용은 필수로 입력해주세요");
	} else {
		$("#contentError").text("");
	}

	if (title == "" || content == "") {
		return;
	}

	var file = document.querySelector("#attach");
	var multipart = new FormData();
	
	multipart.append("book_no", no);
	multipart.append("category_no", category_no);
	multipart.append("book_title", title);
	multipart.append("author", author);
	multipart.append("publisher", publisher);
	multipart.append("price", price);
	multipart.append("book_contents", content);
	
	if(file.files.length != 0) {
		multipart.append("attach", file.files[0]);
	}

	$.ajax({
		url : "bookUpdate",
		method : "post",
		data : multipart,
		cache: false, 
		processData: false, 
		contentType: false, 
		success : function(data) {
			if (data.result == "success") {
				location.href = "content";
			}
		}
	});
}


function bookDetail(no){    
	location.href="book_detail?no="+no;   
}

function bookContentUpdate(no) {
	$.ajax({
		url:"bookUpdate",
		data:{no:no},
		success:function(data) {
			$("#bookDetail").html(data);
		}
	});
}
		
function bookDelete(no){
	if (confirm("정말 삭제하시겠습니까?") == true){  
		
	 }else{  
		 return false;
	 }
	
	$.ajax({
		url:"bookDelete",
		data:{no:no},
		method:"post",
		success:function(data) {
			if(data.result == "success") {
				location.href = "content";
			}
		}
	});
}


function allPage(pageNo) {
	if(!pageNo){
		pageNo = 1;
	}
	$.ajax({
		url:"bookPageList",
		data: {pageNo:pageNo},
		success:function(data) {
			$("#book_result").html(data);
		}
	});
}

function PageList(pageNo) {
	if(!pageNo){
		pageNo = 1;
	}
	$.ajax({
		url:"bookPageList",
		data: {pageNo:pageNo},
		success:function(data) {
			$("#book_result").html(data);
		}
	});
}

 