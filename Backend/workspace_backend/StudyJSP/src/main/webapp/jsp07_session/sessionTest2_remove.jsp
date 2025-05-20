<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>sessionTest2_remove.jsp</h3>
	
	<h3>
		<a href="sessionTest2_remove1.jsp">세션값1 삭제</a>
		<a href="sessionTest2_remove2.jsp">세션값2 삭제</a>
		<a href="sessionTest2_invalidate.jsp">세션값 초기화</a>
	</h3>

	<input type="button" value="이전페이지" onclick="history.back()">
	<input type="button" value="처음으로" onclick="location.href='sessionTest2.jsp'">
</body>
</html>












