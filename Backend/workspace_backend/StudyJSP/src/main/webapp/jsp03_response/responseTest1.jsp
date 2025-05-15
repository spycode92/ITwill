<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>responseTest1.jsp</h3>
	<%
	// JSP 내장객체 중 response 객체(HttpServletResponse)는 HTTP 응답 정보를 관리하는 객체이며
	// response 객체의 sendRedirect() 메서드 호출하여 파라미터로 전달받은 페이지(URL)로 이동 처리
	// => 일반적인 페이지 이동(ex. 하이퍼링크 등)과 개념이 조금 다르지만
	//    결과적으로는 페이지 이동을 처리한다는 점에서는 동일함
	// => 기본 문법 : response.sendRedirect("이동할 URL 또는 파일명")
	// responseTest2.jsp 페이지로 이동 => 리다이렉트(Redirect)
	response.sendRedirect("responseTest2.jsp");
	System.out.println("리다이렉트 응답 전송!");
	
	/*
	클라이언트 요청(responseTest1.jsp)을 처리하는 과정에서 
	서버가 응답할 데이터에 리다이렉트가 포함될 경우(response.sendRedirect("responseTest2.jsp"))
	응답데이터에 HTTP 상태코드 "302" 를 포함하여 클라이언트측으로 응답데이터 전송함
	다만, response.sendRedirect() 메서드 호출 시점에 즉시 응답을 전송하는 것이 아니라
	서버 상에서 다른 작업까지 모두 처리한 후 응답 정보 전체를 클라이언트 측으로 전송함
	=> 응답 데이터(상태코드 302)를 수신한 클라이언트는 리다이렉트 URL 에 해당하는 주소를
	   요청 정보(HTTP 요청메세지)에 포함하여 다시 서버측으로 새로운 요청을 전송한다!
	   즉, 클라이언트가 새로운 주소로 새로운 요청을 발생시킨다!
	=> 따라서, 302 응답데이터를 클라이언트가 수신하는 즉시 새로운 요청을 발생시키므로
	   클라이언트측에서는 responseTest1.jsp 페이지의 내용을 확인할 수 없으며
	   리다이렉트 된 responseTest2.jsp 페이지의 내용이 최종적으로 보여지게 된다! 
	*/
	%>
</body>
</html>















