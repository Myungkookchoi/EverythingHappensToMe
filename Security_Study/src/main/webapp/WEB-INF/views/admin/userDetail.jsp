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
	window.onload = function() {
		var enabled = "${detail.enabled}";
		if (enabled == 1) {
			document.getElementById("target").options[1].selected = true;
		} else {
			document.getElementById("target").options[0].selected = true;
		}
	}
</script>
</head>
<body>
	<form action="userDetail" method="post">
		<table>

			<tr>
				<td>이름</td>
				<td><input type="text" name="userName" value="${detail.userName }"></td>
			</tr>
			<tr>
				<td>아이디</td>
				<td><input type="text" name="userId" value="${detail.userId }"></td>
			</tr>
			<tr>
				<td>생년월일</td>
				<td><input type="date" name="userBirth"
					value='<fmt:formatDate pattern="yyyy-MM-dd"
						value="${detail.userBirth}" />'></td>
			</tr>
			<tr>
				<td>권한</td>
				<td><select id="target" name="enabled">
						<option value="0">권한 없음</option>
						<option value="1">권한 있음</option>
				</select></td>
			</tr>
			<tr>
				<td>등급</td>
				<td><select id="target" name="authority">
						<option value="ROLE_MEMBER">맴버</option>
						<option value="ROLE_ADMIN">어드민</option>
				</select></td>
			</tr>
			<tr>
				<td><input type="submit" value="수정"></td>
			</tr>
		</table>
	</form>
</body>
</html>