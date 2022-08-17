<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="register" method="post">
		<table>
			<tr>
				<td>이름 :</td>
				<td><input type="text" name="userName"></td>
			</tr>
			<tr>
				<td>아이디 :</td>
				<td><input type="text" name="userId"></td>
			</tr>
			<tr>
				<td>비밀번호 :</td>
				<td><input type="password" name="userPassword"></td>
			</tr>
			<tr>
				<td>생년월일 :</td>
				<td><input type="date" name="userBirth"></td>
			</tr>
		</table>
		<input type="submit" value="등록"><br>
	</form>
</body>
</html>