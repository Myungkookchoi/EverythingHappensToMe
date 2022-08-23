<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="false"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	var result = '${msg}';
	if (result == 'success') {
		alert('입력 성공');
	}
</script>
</head>
<body>
	<button onclick="location.href='/sp/human/joinForm'">가입</button>
	<table style="border: 1px solid black">
		<thead>
			<tr>
				<th>이름</th>
				<th>키</th>
				<th>나이</th>
				<th>생년월일</th>
				<th>취미</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${list}" var="humanDto">
				<tr>
					<td><a href="read?name=${humanDto.name }">${humanDto.name }</a></td>
					<td>${humanDto.height }</td>
					<td>${humanDto.age }</td>
					<td><fmt:formatDate value="${humanDto.birth }"
							pattern="yyyy/MM/dd" /></td>
					<c:forEach items="${humanDto.hobby}" var="hobbyDto">
						<td>${hobbyDto.hobby}</td>
					</c:forEach>
				</tr>
			</c:forEach>

		</tbody>
	</table>

</body>
</html>