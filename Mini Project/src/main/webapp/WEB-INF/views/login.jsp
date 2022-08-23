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
	function idCheck() {
		var data = {
			'userId' : $('#userId').val()
		};
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

	function register() {
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
			dataType : 'json',
			contentType : 'application/json; charset=UTF-8',
			success : function(result) {
				if (result == 0) {
					alert("처리 완료");
					closeFun('register', 'login');
				} else {
					alert("회원가입 실패");
				}
			},
			error : function() {
				alert("오류");
			}
		})
	}
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
				<button type="button" onclick="register()">등록</button>
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