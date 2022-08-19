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
</head>
<body>
		
	<button onclick="document.getElementById('id01').style.display='block'"
		style="width: auto;">Login</button>

	<div id="id01" class="modal">

		<form class="modal-content animate" name="frmLogin" action="<c:url value='/user/login'/>" method="POST">

			<div class="imgcontainer">
				<span onclick="document.getElementById('id01').style.display='none'"
					class="close" title="Close Modal">&times;</span> <img
					src="/mk/resources/img/login_img.png" alt="Avatar" class="avatar">
			</div>
			
			<div class="container">
			<p style="color: red;">${ERRORMSG }</p>
				<h3>아이디와 비밀번호를 입력해주세요.</h3>
				<label for="uname">
					<b>아이디</b>
				</label> 
				<input type="text" placeholder="Enter ID" name="id" value="${id }" required> 
				<label for="psw">
					<b>비밀번호</b>
				</label> 
				<input type="password" placeholder="Enter Password"  name="password" value="${password }" required>
				<button type="submit">로그인</button>
				<label>
					<input type="checkbox" checked="checked" name="remember"> Remember me
				</label>
			</div>

			<div class="container" style="background-color: #f1f1f1">
				<button type="button" onclick="document.getElementById('id01').style.display='none'"
					class="cancelbtn">Cancel</button>
				<span class="psw">Forgot <a href="#">password?</a></span>
			</div>
		</form>
	</div>
	
</body>
</html>