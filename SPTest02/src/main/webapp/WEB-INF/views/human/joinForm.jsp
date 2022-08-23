<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="false"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
</head>
<body>
	<form method="post">
		이름 : <input type="text" name="name"><br> 키 : <input
			type="number" min="0" max="250" step="0.1" name="height">cm<br>
		나이 : <input type="number" min="1" max="200" step="1" name="age"><br>
		생일 : <input type="date" name="birth"><br> 취미 : <input
			type="checkbox" name="hobbys" value="운동">운동 <input
			type="checkbox" name="hobbys" value="요리">요리 <input
			type="checkbox" name="hobbys" value="독서">독서 <input
			type="checkbox" name="hobbys" value="영화">영화 <input
			type="checkbox" name="hobbys" value="음악">음악 <br> <input
			type="submit" value="가입">
	</form>
</body>

</html>