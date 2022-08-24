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
	function idCheck() {
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

	function register() {
		if (check == 0) {
			alert("아이디 중복확인을 해주세요.");
		} else {
			var data = {
				'userId' : $('#userId').val(),
				'userPassword' : $('#userPassword').val(),
				'userName' : $('#userName').val(),
				'userBirth' : $('#userBirth').val()
			};
			var json = JSON.stringify(data);
			alert(json);
			$.ajax({
				type : "POST",
				url : "/mk/restful/register	",
				data : json,
				dataType : 'text',
				contentType : 'application/json; charset=UTF-8',
				success : function(result) {
					console.log(result);
					if (result == "SUCCESS") {
						alert("회원가입이 완료되었습니다.");
						console.log(result);
						closeFun('register', 'login');
						$('#userId').val(null);
						$('#userPassword').val(null);
						$('#userName').val(null);
						$('#userBirth').val(null);
					} else {
						check = 0;
						alert("회원가입 실패하였습니다.");
					}

				},
				error : function(result) {
					alert("오류가 발생하였습니다.");
					console.log(result);
				}
			})
		}
	}

	$(document).ready(function() {
		// 		alert($('#userId').val().length);
	});
</script>
</head>
<body>
	<div class="header">
		HEADER to <a href="./main">Main Logo</a>
	</div>

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
				</label> <input type="password" placeholder="Enter Password" name="password"
					value="${password }" required>
				<button type="submit">로그인</button>
			</div>
		</form>

		<div class="container" style="background-color: #f1f1f1">
			<button class="blueButton"
				onclick="displayFun('forgetPassword', 'login', 'register');"
				style="width: auto;">Forgot ID or password?</button>
			<button class="orangeButton"
				onclick="displayFun('register', 'forgetPassword', 'login');"
				style="width: auto;">Register</button>
		</div>

	</div>

	<div id="forgetPassword" class="modal">
		<div class="imgcontainer">
			<span onclick="closeFun('forgetPassword', 'login');" class="close"
				title="Close Modal">&times;</span>
		</div>
		<div class="modal-content animate">
			<form name="frmLogin" action="<c:url value='/findId'/>" method="POST">
				<div class="container">
					<h3>아이디 찾기</h3>
					<label for="uname"> <b>이름</b>
					</label> <input type="text" placeholder="Enter Name" name="userName"
						required> <label for="ubirthday"> <b>생년월일</b>
					</label> <input type="date" placeholder="Enter Birthday" name="userBirth"
						required>
					<button type="submit">아이디 찾기</button>
				</div>
			</form>

			<form name="frmLogin" action="<c:url value='/findPassword'/>"
				method="POST">
				<div class="container">
					<h3>비밀번호 찾기</h3>
					<label for="uid"> <b>아이디</b>
					</label> <input type="text" placeholder="Enter ID" name="userId" required>
					<label for="uname"> <b>이름</b>
					</label> <input type="text" placeholder="Enter Name" name="userName"
						required><label for="psw"> <b>생년월일</b>
					</label> <input type="password" placeholder="Enter Birthday"
						name="userPassword" required>
					<button type="submit">비빌번호 찾기</button>
				</div>
			</form>

			<div class="container" style="background-color: #f1f1f1">
				<button type="button" onclick="closeFun('forgetPassword', 'login');"
					class="cancelbtn">Cancel</button>
			</div>
		</div>
	</div>

	<div id="register" class="modal">
		<form class="modal-content animate" name="frmLogin"
			action="/mk/restful/register" method="POST">
			<div class="imgcontainer">
				<span onclick="closeFun('register', 'login');" class="close"
					title="Close Modal">&times;</span>
			</div>
			<div class="container">
				<label for="uid"><b>아이디</b>&ensp;<font id="resultID"
					size="2"></font> </label> <input id="userId" type="text"
					placeholder="Enter ID" name="userId" required>
				<button type="button" onclick="idCheck();">아이디 중복확인</button>
				<label for="upw"> <b>비밀번호</b>
				</label> <input id="userPassword" type="password"
					placeholder="Enter Password" name="userPassword" required>
				<label for="uname"> <b>이름</b>
				</label> <input id="userName" type="text" placeholder="Enter Name"
					name="userName" required> <label for="ubirth"> <b>생년월일</b>
				</label> <input id="userBirth" type="date" name="userBirth" required>
				<button id="registerbtn" type="button" onclick="register()"
					disabled="disabled">등록</button>
				<br>
			</div>

			<div class="container" style="background-color: #f1f1f1">
				<button type="button" onclick="closeFun('register', 'login');"
					class="cancelbtn">Cancel</button>
			</div>
		</form>
	</div>
</body>
</html>