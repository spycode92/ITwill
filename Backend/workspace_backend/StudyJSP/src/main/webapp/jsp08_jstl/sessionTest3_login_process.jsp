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
	<%
	// DB 에 저장된 아이디, 패스워드 대신 2개의 변수에 임의로 아이디, 패스워드 값 저장
	String dbId = "admin";
	String dbPasswd = "1234";
	
	// 폼 파라미터로 전달된 id, passwd 값 가져오기
	String id = request.getParameter("id");
	String passwd = request.getParameter("passwd");
	
	// id & passwd 가 dbId & dbPasswd 모두와 동일(일치)할 경우 판별
	// 1) 둘 다 일치할 경우(= 로그인 성공)
	//    => 세션 객체에 "sId" 라는 속성명으로 로그인에 성공한 아이디값 저장하기
	//    => 메인페이지(sessionTest3.jsp)로 리다이렉트
	// 2) 하나라도 일치하지 않을 경우
	//    => 자바스크립트를 사용하여 alert 창을 통해 "로그인 실패!" 출력하고 이전페이지로 돌아가기
// 	if(id.equals(dbId) && passwd.equals(dbPasswd)) { // 로그인 성공
	if((id.equals(dbId) || id.equals("hong")) && passwd.equals(dbPasswd)) { // 로그인 성공
		// 세션 객체에 "sId" 라는 속성명으로 로그인에 성공한 아이디값 저장하기
		session.setAttribute("sId", id);
		
		// 메인페이지(sessionTest3.jsp)로 리다이렉트
		response.sendRedirect("sessionTest3.jsp");
	} else { // 로그인 실패
		// 자바스크립트를 사용하여 alert 창을 통해 "로그인 실패!" 출력하고 이전페이지로 돌아가기
		%>
		<script type="text/javascript">
			alert("로그인 실패!");
			history.back();
		</script>
		<%
	}
	%>	
</body>
</html>













