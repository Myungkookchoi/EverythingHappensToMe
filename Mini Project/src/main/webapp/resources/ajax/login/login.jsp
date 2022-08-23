<%@ page language="java" contentType="text/xml; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page trimDirectiveWhitespaces="true"%>

<%
	request.setCharacterEncoding("utf-8");
	response.setContentType("text/html; charset=utf-8");
	response.setCharacterEncoding("utf-8");

	String username = request.getParameter("id");
	String password = request.getParameter("password");

	boolean result = true;
	String message = username;
	out.print(message);
%>
<?xml version='1.0' encoding='UTF-8'?>
<login> <result><%=result%></result> <message><%=message%></message>
</login>