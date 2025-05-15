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
	<h3>request2_process.jsp - 로그인 처리</h3>
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
	/*
	[ 자바 코드를 사용하여 아이디와 패스워드 판별하여 로그인 성공 여부 판별 ]
	- 데이터베이스에 저장된 아이디를 "admin", 패스워드를 "1234" 라고 가정하고
	  데이터베이스로부터 읽어온 아이디와 패스워드를 변수에 미리 저장
	- 폼을 통해 입력받은 아이디와 패스워드를 각각의 DB 데이터와 비교하여
	  둘 다 일치할 경우 "로그인 성공", 아니면 "로그인 실패" 출력
	*/
	String dbId = "admin";
	String dbPasswd = "1234";
	
// 	out.print("[" + id + "] vs [" + dbId + "]<br>");
// 	out.print("[" + passwd + "] vs [" + dbPasswd + "]<br>");
	
	// 아이디와 패스워드 모두 일치하면 "로그인 성공", 아니면 "로그인 실패"
	if(id == dbId && passwd == dbPasswd) {
		out.print("<h3>로그인 성공!</h3>");
	} else {
		out.print("<h3>로그인 실패!</h3>");
	}
	/*
	주의! 자바에서 문자열(객체)에 대한 일치 여부를 비교할 때 동등 비교 연산자(==) 사용할 경우
	문자열의 "내용" 이 아닌 문자열이 저장된 위치의 "주소값" 을 비교하게 된다!
	따라서, 동일한 문자열 내용이더라도 주소가 다르면 비교 결과가 false 가 될 수 있다!
	=> 결론! 문자열 데이터 비교 시 동등비교연산자(==) 대신 
	   String 클래스의 equals() 메서드를 사용하여 문자열 비교 필수!!!
	   
	< 문자열 비교 기본 문법 >
	if(문자열.equals(비교할 문자열)) {
		// 문자열이 일치할 경우 수행할 작업...
	} else {
		// 문자열이 일치하지 않을 경우 수행할 작업...
	}
	*/
	if(id.equals(dbId) && passwd.equals(dbPasswd)) {
		out.print("<h3>로그인 성공!</h3>");
	} else {
// 		out.print("<h3>로그인 실패!</h3>");
		// -----------------------------------
		// 자바스크립트 활용하여 "로그인 실패!" alert 창 출력 후 이전페이지로 돌아가기 처리
		// 1) out.print() 메서드로 자바스크립트 코드를 출력하는 방법
// 		out.print("<script>");
// 		out.print("alert('로그인 실패!');");
// 		out.print("history.back();");
// 		out.print("</script>");
		// ------------------
		// 2) 자바스크립트 코드를 스크립틀릿 외부에 작성
		%>
		<%-- 이 영역은 HTML 태그 영역(자바 코드 외부)이므로 자바스크립트 작성 가능 --%>
		<script type="text/javascript">
			alert("로그인 실패222!");
			history.back();
		</script>
		<%
	}
	%>
	
	
	
</body>
</html>













