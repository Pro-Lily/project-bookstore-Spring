$(function() {
	// updateform
	$("#update_form").submit(function() {
		if ($("#update_form [name='member_name']").val() == "") {
			alert("이름을 꼭 입력하세요!!!");
			$("#update_form [name='member_name']").focus();
			return false;
		}
		if ($("#update_form [name='member_email']").val() == "") {
			alert("이메일을 꼭 입력하세요!!!");
			$("#update_form [name='member_email']").focus();
			return false;
		}
		if ($("#update_form [name='member_postno']").val() == "") {
			alert("postno 꼭 입력하세요!!!");
			$("#update_form [name='member_postno']").focus();
			return false;
		}
		if ($("#update_form [name='member_address']").val() == "") {
			alert("주소를 꼭 입력하세요!!!");
			$("#update_form [name='member_address']").focus();
			return false;
		}
		if ($("#update_form [name='member_tel']").val() == "") {
			alert("전화번호를 꼭 입력하세요!!!");
			$("#update_form [name='member_tel']").focus();
			return false;
		}
		if ($("#update_form [name='member_pwd']").val() == "") {
			alert("비밀번호를 꼭 입력하세요!!!");
			$("#update_form [name='member_pwd']").focus();
			return false;
		}
	});


	// deleteform
	$("#delete_form").submit(function() {
		if ($("#delete_form [name='member_pwd']").val() == "") {
			alert("비밀번호를 꼭 입력하세요!!!");
			$("#delete_form [name='member_pwd']").focus();
			return false;
		}
		if ($("#delete_form [name='member_pwd_ck']").val() == "") {
			alert("비밀번호를 꼭 입력하세요!!!");
			$("#delete_form [name='member_pwd_ck']").focus();
			return false;
		}
		
	});
});