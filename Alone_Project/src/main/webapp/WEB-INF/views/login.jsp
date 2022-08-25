<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/mk/resources/css/login_form.css">
<script src="/mk/resources/js/login_form.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>
	var check = 0;
	var userId;
	function findId() {
		var data = {
			'userName' : $('#findId_Name').val(),
			'userBirth' : $('#findId_Birth').val()
		};
		var json = JSON.stringify(data);
		$.ajax({
			type : "POST",
			url : "/mk/restful/findId",
			data : json,
			contentType : 'application/json; charset=UTF-8',
			dataType : 'text',
			success : function(result) {
				if (result != "") {
					alert("회원님의 아이디는 " + result + "입니다.");
					closeFun();
					return false;
				} else {
					$('#checkMessage').text('존재하지 않는 아이디입니다.');
					$('#checkMessage').attr('color', 'red');
					return false;
				}
			},
			error : function(result) {
				console.log(result);
				alert("Error");
			}
		})
		return false;
	}

	function findPassword() {
		var data = {
			'userId' : $("#findPassword_Id").val(),
			'userName' : $('#findPassword_Name').val(),
			'userBirth' : $('#findPassword_Birth').val()
		};
		var json = JSON.stringify(data);
		$.ajax({
			type : "POST",
			url : "/mk/restful/findPassword",
			data : json,
			contentType : 'application/json; charset=UTF-8',
			dataType : 'json',
			success : function(result) {
				console.log(result);
				if (result == "0") {
					$('#checkMessage2').text('존재하지 않는 정보입니다.');
					$('#checkMessage2').attr('color', 'red');
					return false;
				} else {
					userId = result.userId;
					$.ajax({
						url : "/mk/resources/ajax/ChangePasswordForm.jsp",
						success : function(data) {
							$("#findPswDiv").html(data);
						}
					})
					return false;
				}
			},
			error : function(result) {
				console.log(result);
				alert("Error");
			}
		})
		return false;
	}

	function register() {
		var data = {
			'userId' : $('#userId').val(),
			'userPassword' : $('#userPassword').val(),
			'userName' : $('#userName').val(),
			'userBirth' : $('#userBirth').val()
		};
		var json = JSON.stringify(data);
		$.ajax({
			type : "POST",
			url : "/mk/restful/register",
			data : json,
			contentType : 'application/json; charset=UTF-8',
			dataType : 'text',
			success : function(result) {
				if (result == "SUCCESS") {
					alert("회원가입 되었습니다.");
					closeFun();
					return false;
					//지우기
				} else {
					check = 0;
					alert("회원가입 실패하였습니다.");
					return false;
				}

			},
			error : function(result) {
				alert("오류가 발생하였습니다.");
				console.log(result);
			}
		})
		return false;
	}

	function changePassword() {
		var userPassword = $('#password1').val();
		var userPassword2 = $('#password2').val();
		var data = {
			'userId' : userId,
			'userPassword' : userPassword
		}
		console.log(data);
		if (userPassword != "") {
			if (userPassword2 != "") {
				$.ajax({
					type : "put",
					url : "/mk/restful/changePassword/" + userId,
					data : JSON.stringify(data),
					contentType : 'application/json; charset=UTF-8',
					dataType : 'text',
					success : function(result) {
						if (result == "SUCCESS") {
							alert("변경 완료되었습니다.");
							closeFun();
							return false;
						} else {
							alert("Error");
							return false;
						}
					},
					error : function(result) {
						alert("에러");
						console.log(result);
					}
				})
				return false;
			} else {
				$('#editUserPasswordCheck').focus();
				return false;
			}
		} else {
			$('#editUserPassword').focus();
			$('#checkMessage').text("비밀번호를 입력하지 않았습니다.");
			$('#checkMessage').attr('color', 'red');
			return false;
		}

	}

	function clearMessage(id) {
		$(id).text(null);
	}

	function passwordCheck() {
		var password1 = $('#password1').val();
		var password2 = $('#password2').val();
		if (password1 != null && password2 != null) {
			if (password1 != password2) {
				$("#checkMessage3").text("비밀번호가 일치하지 않습니다.");
				$('#checkMessage3').attr('color', 'red');
			} else {
				$("#checkMessage3").text("");
				$("#changePswBtn").attr('disabled', false);
			}
		}
	}

	function registerId_check() {
		var special_pattern = /[`~!@#$%^&*|\\\'\";:\/?]/gi;
		var data = {
			'userId' : $('#userId').val()
		};
		if ($('#userId').val() == "") {
			$('#resultID').html('아이디를 입력해주세요');
			$('#resultID').attr('color', 'red');
		} else if ($('#userId').val().length < 3) {
			$('#resultID').html('3글자 이상으로 적어주세요.');
			$('#resultID').attr('color', 'red');
		} else if ($('#userId').val().search(/\s/) != -1) {
			$('#resultID').html('아이디에 공백이 있습니다.');
			$('#resultID').attr('color', 'red');
		} else if (special_pattern.test($('#userId').val()) == true) {
			$('#resultID').html('아이디에 특수문자가 있습니다.');
			$('#resultID').attr('color', 'red');
		} else {
			var json = JSON.stringify(data);
			$.ajax({
				type : "POST",
				url : "/mk/restful/checkid",
				data : json,
				dataType : 'json',
				contentType : 'application/json; charset=UTF-8',
				success : function(result) {
					if (result == 0) {
						$("#resultID").html('사용 할 수 있는 아이디입니다.');
						$("#resultID").attr('color', 'green');
						$("#registerbtn").attr('disabled', false);
						check = 1;
					} else {
						$("#resultID").html('사용 할 수 없는 아이디입니다.');
						$("#resultID").attr('color', 'red');
					}
				},
				error : function() {
					alert("오류");
				}
			})
		}
	}

	function view(page) {
		$.ajax({
			url : "/mk/resources/ajax/" + page + ".jsp",
			success : function(data) {
				$("#page").html(data);
			}
		})
	}

	//window.onload
	$(document).ready(function() {

	});
</script>
</head>
<body>
	<div class="header">
		HEADER to <a href="./main">Main Logo</a>
	</div>

	<div id="page">
		<div class="modal-content animate" id="login">
			<form name="frmLogin" action="<c:url value='/login'/>" method="post">
				<div class="imgcontainer">
					<img src="/mk/resources/img/login_img.png" alt="Avatar"
						class="avatar">
				</div>

				<div class="container">
					<p style="color: red;">${ERRORMSG }</p>
					<h3>아이디와 비밀번호를 입력해주세요.</h3>
					<label for="uname"> <b>아이디</b>
					</label> <input type="text" placeholder="Enter ID" name="id" value="${id }"
						required> <label for="psw"> <b>비밀번호</b>
					</label> <input type="password" placeholder="Enter Password"
						name="password" value="${password }" required>
					<button type="submit">로그인</button>
				</div>
			</form>

			<div class="container" style="background-color: #f1f1f1">
				<button class="blueButton" onclick="view('find');"
					style="width: auto;">Forgot ID or password?</button>
				<button class="orangeButton" onclick="view('register');"
					style="width: auto;">Register</button>
			</div>
		</div>
	</div>
	<div class="footer">Footer</div>
</body>
</html>