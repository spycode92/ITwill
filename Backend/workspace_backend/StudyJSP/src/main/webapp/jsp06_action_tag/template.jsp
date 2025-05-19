<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
// 현재 페이지 요청 시 전달받은 page 파라미터 변수 pageFile 에 저장
String pageFile = request.getParameter("page");

// 단, page 파라미터값이 null 일 경우 pageFile 변수값을 "new" 로 설정
if(pageFile == null) {
	pageFile = "new";
}

pageFile += "Item.jsp";
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>template.jsp</title>
</head>
<body>
	<h3><%=pageFile %></h3>
	<table border="1">
		<tr>
			<td height="50" colspan="2">
				<jsp:include page="top.jsp"></jsp:include>
			</td>
		</tr>
		<tr>
			<td height="300" width="20%">
				<jsp:include page="left.jsp"></jsp:include>
			</td>
			<td>
<%-- 				<jsp:include page="newItem.jsp"></jsp:include> --%>
				<%-- pageFile 변수값을 활용하여 newItem.jsp 또는 bestItem.jsp 페이지 표시하기 --%>
				<%-- 표현식 <%= %> 을 활용하여 파일명을 "출력" 하여 include 대상 페이지 변경 가능 --%>
				<jsp:include page="<%=pageFile%>"></jsp:include>
			</td>
		</tr>
		<tr>
			<td height="40" colspan="2">
				<jsp:include page="bottom.jsp"></jsp:include>
			</td>
		</tr>
	</table>
</body>
</html>


















