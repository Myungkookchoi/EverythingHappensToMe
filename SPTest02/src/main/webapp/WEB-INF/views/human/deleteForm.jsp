<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	var result = '${msg}';
	var name = '${name}';
	if (result == 'success') {
		alert(name + '님의 정보가 삭제가 완료되었습니다.');
		location.href = '/sp/human/information';
	}
</script>
</head>
<body>
name = ${name } / msg=${msg}
</body>
</html>