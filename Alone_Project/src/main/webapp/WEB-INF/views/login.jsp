<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/mk/resources/css/login_form.css">
<script src="/mk/resources/js/login_form.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<body>
	<div class="header">
		HEADER to <a href="./main">Main Logo</a>
	</div>

	<div id="page">
		<div class="modal-content animate" id="login">
			<form name="frmLogin" action="<c:url value='/login'/>" method="post">
				<div class="imgcontainer">
					<img src="/mk/resources/img/login_img.png" alt="Avatar" class="avatar">
				</div>

				<div class="container">
					<p style="color: red;">${ERRORMSG }</p>
					<h3>아이디와 비밀번호를 입력해주세요.</h3>
					<label for="uname"> <b>아이디</b>
					</label> <input type="text" placeholder="Enter ID" name="id" value="${id }" required> <label for="psw"> <b>비밀번호</b>
					</label> <input type="password" placeholder="Enter Password" name="password" value="${password }" required>
					<button type="submit">로그인</button>
				</div>
			</form>

			<div class="container" style="background-color: #f1f1f1">
				<button class="blueButton" onclick="view('find');" style="width: auto;">Forgot ID or password?</button>
				<button class="orangeButton" onclick="view('register');" style="width: auto;">Register</button>
			</div>
		</div>
	</div>
	<div class="footer">Footer</div>
</body>
</html>