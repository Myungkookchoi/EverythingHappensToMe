<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	var msg = "${msg}"
	if (msg == "success") {
		alert("처리되었습니다.");
	}
</script>
</head>
<body>
	<a href="../admin">Admin Page</a>
	<h3>All List</h3>
	<table>
		<thead>
			<tr>
				<td>이름</td>
				<td>아이디</td>
				<td>생년월일</td>
				<td>권한</td>
				<td>등급</td>
			</tr>
		</thead>
		<c:forEach items="${list}" var="UserDto">
			<tr>
				<td><a href="userDetail?userId=${UserDto.userId }">${UserDto.userName }</a></td>
				<td>${UserDto.userId }</td>
				<td><fmt:formatDate pattern="yyyy-MM-dd"
						value="${UserDto.userBirth}" /></td>
				<td>${UserDto.enabled }</td>
				<td>${UserDto.authority }</td>
			</tr>
		</c:forEach>
	</table>
	
	<h3>noEnabled List</h3>
	<table>
		<thead>
			<tr>
				<td>이름</td>
				<td>아이디</td>
				<td>생년월일</td>
				<td>권한</td>
				<td>등급</td>
			</tr>
		</thead>
		<c:forEach items="${noEnabled}" var="UserDto">
			<tr>
				<td><a href="userDetail?userId=${UserDto.userId }">${UserDto.userName }</a></td>
				<td>${UserDto.userId }</td>
				<td><fmt:formatDate pattern="yyyy-MM-dd"
						value="${UserDto.userBirth}" /></td>
				<td>${UserDto.enabled }</td>
				<td>${UserDto.authority }</td>
			</tr>
		</c:forEach>
	</table>
	
</body>
</html>