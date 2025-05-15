<%@page import="java.util.Arrays"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>request3_process.jsp - 로그인 처리</h3>
	<%-- 폼 파라미터(id, passwd, rememberId) 값 가져와서 변수에 저장 후 출력 --%>
	<%
	String id = request.getParameter("id");
	String passwd = request.getParameter("passwd");
	// 체크박스 name 속성값이 동일한 파라미터가 없을 경우 getParameter() 메서드도 사용 가능함
	String rememberId = request.getParameter("rememberId");
// 	out.print("<h3>아이디 : " + id + "</h3>");
// 	out.print("<h3>패스워드 : " + passwd + "</h3>");
// 	out.print("<h3>아이디 기억하기 : " + rememberId + "</h3>");
	%>
	<h3>아이디 : <%=id %></h3>
	<h3>패스워드 : <%=passwd %></h3>
	<h3>아이디 기억하기 : <%=rememberId %></h3>
	
	<%
	String dbId = "admin";
	String dbPasswd = "1234";
	
	// 아이디와 패스워드 모두 일치(로그인 성공) 시 responseTest3_result1.jsp 페이지로 이동하고
	// 아니면, responseTest3_result2.jsp 페이지로 이동
	// 1) 페이지 이동 처리를 자바스크립트 코드로 수행하기
	if(id.equals(dbId) && passwd.equals(dbPasswd)) {
		%>
		<script type="text/javascript">
// 			location.href = "responseTest3_result1.jsp";
		</script>
		<%
	} else {
		%>
		<script type="text/javascript">
// 			location.href = "responseTest3_result2.jsp";
		</script>
		<%
	}
	
	// 2) 페이지 이동 처리를 response.sendRedirect() 메서드로 수행하기
	if(id.equals(dbId) && passwd.equals(dbPasswd)) {
		System.out.println("로그인 성공!");
		// 만약, 리다이렉트 페이지에서 사용해야할 데이터가 있을 경우
		// 리다이렉트 주소(URL) 뒤에 파라미터 형식으로 결합하여 전달해야한다!
		response.sendRedirect("responseTest3_result1.jsp?testId=" + id);
	} else {
		System.out.println("로그인 실패!");
		response.sendRedirect("responseTest3_result2.jsp");
	}
	%>
	
	
	
</body>
</html>













