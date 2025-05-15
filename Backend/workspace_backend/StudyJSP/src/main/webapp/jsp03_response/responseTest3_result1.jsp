<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>responseTest3_result1.jsp</h3>
	<h3>로그인 성공 시 응답 페이지</h3>
	
	<%
	String id = request.getParameter("id");
	String passwd = request.getParameter("passwd");
	String rememberId = request.getParameter("rememberId");
	%>
	<h3>아이디 : <%=id %></h3>
	<h3>패스워드 : <%=passwd %></h3>
	<h3>아이디 기억하기 : <%=rememberId %></h3>
	<%--
	responseTest3_form.jsp -> responseTest3_process.jsp 페이지로 요청이 발생했을 때
	서버측에서 request 객체를 생성하므로 요청 정보(파라미터(id, passwd 등) 포함)가 모두 저장되어 있음
	=> 따라서, responseTest3_process.jsp 페이지 처리 시 request 객체내의 파라미터 접근 가능함!
	   ex) request.getParameter("id") => 저장된 아이디가 리턴됨
	----------------------------------------------------------------------------------------
	responseTest3_process.jsp 페이지에서 리다이렉트(response.sendRedirect())에 의해 
	responseTest3_result1.jsp 페이지로 이동 시
	클라이언트측에서 "새로운 요청" 을 발생시키므로 서버측에 "새로운 request 객체가 생성"되고
	이전 request 객체에 저장되어 있는 정보들은 공유가 되지 않는다!
	=> 따라서, responseTest3_result1.jsp 페이지 처리 시 이전 요청에서 사용된
	   request 객체 내의 파라미터에 접근이 불가능하다!
	=> 만약, 리다이렉트 된 페이지에서도 이전 정보에 접근하고 싶을 경우
	   리다이렉트 주소(URL) 뒤에 파라미터 형식으로 다시 데이터를 전달해야한다!
	--%>
	<%
	// responseTest3_process.jsp 페이지에서 리다이렉트 시 전달한 파라미터(testId) 가져와서 출력
	out.print("testId : " + request.getParameter("testId") + "<br>");
	%>
	testId : <%=request.getParameter("testId") %>
</body>
</html>


















