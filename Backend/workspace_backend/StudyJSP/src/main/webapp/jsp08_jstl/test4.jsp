<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>test4.jsp</h3>
	<form action="test4_result.jsp">
		<input type="text" name="name" placeholder="이름"><br>
		<input type="text" name="age" placeholder="나이"><br>
		취미 : 
		<input type="checkbox" name="hobby" value="여행">여행
		<input type="checkbox" name="hobby" value="게임">게임
		<input type="checkbox" name="hobby" value="야구">야구<br>
		<input type="submit" value="전송">
	</form>
</body>
</html>
















