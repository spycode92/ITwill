<%@page import="jsp08_jstl.Person"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>test1.jsp</h3>
	<form action="test1_result.jsp" method="post">
		<input type="text" name="name" placeholder="이름"><br>
		<input type="text" name="age" placeholder="나이"><br>
		<input type="text" name="email" placeholder="E-Mail"><br>
		<input type="submit" value="전송">
	</form>
	<form action="test1_result2.jsp" method="post">
		<input type="text" name="name" placeholder="이름"><br>
		<input type="text" name="age" placeholder="나이"><br>
		<input type="text" name="email" placeholder="E-Mail"><br>
		<input type="submit" value="전송">
	</form>
	<%
	// session 객체에 데이터 저장
	// 1) "testValue" 라는 속성명으로 "세션값" 문자열 저장
	session.setAttribute("testValue", "세션값");

	// 2) Person 클래스의 인스턴스 생성(생성자 파라미터로 임의의 값 전달) 후
	//    "person" 이라는 속성명으로 Person 인스턴스 저장
	Person person = new Person(1, "홍길동");
	session.setAttribute("person", person);
	%>
	
	
</body>
</html>













