<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	admin page
	<a href="authority/userList">회원관리</a>
	<a href="${pageContext.request.contextPath}/logout">로그아웃</a>
</body>
</html>