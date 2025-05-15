<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>pageContextTest2.jsp</h3>
	<hr>
	<%
	// 내장객체 pageContext 의 include() 메서드는 파라미터로 지정된 페이지의 내용을 처리한 후
	// 해당 처리 결과를 현재 페이지의 응답 데이터로 함께 포함시켜 클라이언트측으로 전송함!
	// => 즉, 지정된 페이지를 현재 페이지에 포함시키는 기능을 수행한다!
	pageContext.include("pageContextTest3.jsp");
	
	// ====================================================
	// 파라미터 id 값 출력하기
	out.print("아이디 : " + request.getParameter("id"));
	// => pageContext.forward() 메서드로 포워딩했을 경우 이전 요청 정보가 남아있으므로
	//    파라미터 정보도 그대로 유지되어 포워딩 된 페이지에서도 접근이 가능하다!
	
	%>
</body>
</html>














