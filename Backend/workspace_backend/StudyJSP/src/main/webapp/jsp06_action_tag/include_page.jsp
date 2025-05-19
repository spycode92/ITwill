<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>include_page.jsp</h3>
	<%-- forwardTest2.jsp 페이지에서 jsp:param 태그로 저장한 속성값(num) 출력 --%>
	<h3>num 값 : <%=request.getParameter("num") %></h3>
</body>
</html>













