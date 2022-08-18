<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	Login page
	<%-- 	<c:if test="${param.noAuthority != null}"> --%>
	<!-- 		<p>권한이 없습니다.</p> -->
	<%-- 	</c:if> --%>
	<%-- 	<c:if test="${param.noID != null}"> --%>
	<!-- 		<p>로그인에 실패하였습니다.</p> -->
	<%-- 	</c:if> --%>
<%-- 	<c:if test="${param.logout != null}"> --%>
<!-- 		<p>로그아웃 하였습니다.</p> -->
<%-- 	</c:if> --%>
	<%-- 	<c:if test="${param.hi != null}"> --%>
	<!-- 		<p>로그인하였습니다.</p> -->
	<%-- 	</c:if> --%>
	<p>${ERRORMSG }</p>
	<h3>아이디와 비밀번호를 입력해주세요.</h3>
	<c:url value="/login" var="loginUrl" />
	<form name="frmLogin" action="<c:url value='/user/login'/>"
		method="POST">
		<!-- csrf가 있어야 된다. -->
		<input type="hidden" name="${_csrf.parameterName }"
			value="${_csrf.token }" />
		<p>
			<label for="id">아이디</label> <input type="text" id="id" name="id"
				value="${id }" />
		</p>
		<p>
			<label for="password">비밀번호</label> <input type="password"
				id="password" name="password" value="${password }" />
		</p>
		<button type="submit" class="btn">로그인</button>
	</form>
	<a href="register">회원가입</a>
</body>
</html>