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
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script>
	$(document).ready(function() {

		var exercise = '${exercise}';
		var cooking = '${cooking}';
		var read = '${read}';
		var movie = '${movie}';
		var music = '${music}';

		if (exercise == "운동") {
			$("input:checkbox[id='exercise']").prop("checked", true);
		}
		if (cooking == "요리") {
			$("input:checkbox[id='cooking']").prop("checked", true);
		}
		if (read == "독서") {
			$("input:checkbox[id='read']").prop("checked", true);
		}
		if (movie == "영화") {
			$("input:checkbox[id='movie']").prop("checked", true);
		}
		if (music == "음악") {
			$("input:checkbox[id='music']").prop("checked", true);
		}

		const target = document.getElementById('target_btn');

		var formObj = $("form[role='form']");
		$(".edit").on("click", function() {
			formObj.attr("action", "/sp/human/editForm");
			formObj.submit();
		});

		$(".delete").on("click", function() {
			formObj.attr("action", "/sp/human/deleteForm");
			formObj.submit();
		});

		$(".list").on("click", function() {
			self.location = "/sp/human/information";
		});
	});
</script>
</head>
<body>
	<form id="target" role="form" method="post">
		<table style="border: 1px solid black">
			<tr>
				<td>이름</td>
				<td><input type="text" name="name" value="${humanDto.name }"></td>
			</tr>
			<tr>
				<td>키</td>
				<td><input type="number" min="0" max="250	" step="0.1"
					name="height" value="${humanDto.height }">cm<br></td>
			</tr>
			<tr>
				<td>나이</td>
				<td><input type="number" min="1" max="200" step="1" name="age"
					value="${humanDto.age }"><br></td>
			</tr>
			<tr>
				<td>생일</td>
				<td><input type="date" name="birth"
					value='<fmt:formatDate value="${humanDto.birth }"
					pattern="yyyy-MM-dd" />'></td>
			</tr>
			<tr>
				<td>취미</td>
				<td><input id="exercise" type="checkbox" name="hobbys"
					value="운동">운동 <input id="cooking" type="checkbox"
					name="hobbys" value="요리">요리 <input id="read"
					type="checkbox" name="hobbys" value="독서">독서 <input
					id="movie" type="checkbox" name="hobbys" value="영화">영화 <input
					id="music" type="checkbox" name="hobbys" value="음악">음악</td>
			</tr>
		</table>
		<div>
			<button type="button" class="list">목록 보기</button>
			<button type="button" class="edit">수정 하기</button>
			<button type="button" class="delete">삭제 하기</button>
		</div>
	</form>
</body>
</html>
