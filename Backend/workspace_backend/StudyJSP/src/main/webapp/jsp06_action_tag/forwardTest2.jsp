<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>forwardTest2.jsp</h3>
	<%-- 하이퍼링크 또는 jsp:forward 액션태그를 통해 요청받은 URL 에 포함된 파라미터(name, age)값 출력하기 --%>
	<h3>이름 : <%=request.getParameter("name") %></h3>
	<h3>나이 : <%=request.getParameter("age") %></h3>
	<hr>
	<%-- ========================================= --%>
	<%-- [ <jsp:include> 액션태그 ] --%>
	<%-- pageContext.include() 메서드와 동일한 작업을 수행하는 액션 태그로 --%>
	<%-- 해당 페이지를 현재 페이지에 포함시킴 --%>
	<%-- 기본적인 문법과 jsp:param 액션태그(include 되는 페이지에서 사용 가능한 값 전달)까지 동일함 --%>
<%-- 	<jsp:include page="include_page.jsp"></jsp:include> --%>
	<jsp:include page="include_page.jsp">
		<jsp:param name="num" value="10"/>
	</jsp:include>
</body>
</html>

















