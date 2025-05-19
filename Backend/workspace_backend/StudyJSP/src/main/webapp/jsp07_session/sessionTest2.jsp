<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>sessionTest2.jsp</h3>
	<%--
	하이퍼링크와 버튼 활용하여 각 링크 생성
	1) "세션값 생성" 클릭 시 "sessionTest2_set.jsp" 페이지로 이동
	2) "세션값 확인" 클릭 시 "sessionTest2_get.jsp" 페이지로 이동
	3) "세션값 삭제" 클릭 시 "sessionTest2_remove.jsp" 페이지로 이동
	--%>
	<h3>
		<a href="sessionTest2_set.jsp">세션값 생성</a>
		<a href="sessionTest2_get.jsp">세션값 확인</a>
		<a href="sessionTest2_remove.jsp">세션값 삭제</a>
	</h3>
	
	<%-- 버튼과 자바스크립트 조합으로 동일한 작업 --%>
	<input type="button" value="세션값 생성" onclick="location.href='sessionTest2_set.jsp'">
	<input type="button" value="세션값 확인" onclick="location.href='sessionTest2_get.jsp'">
	<input type="button" value="세션값 삭제" onclick="location.href='sessionTest2_remove.jsp'">
	
</body>
</html>
















