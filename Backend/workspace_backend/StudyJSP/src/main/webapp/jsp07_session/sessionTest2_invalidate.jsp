<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>sessionTest2_invalidate.jsp</h3>
	<%
	// session 객체 초기화 
	// => invalidate() 메서드 활용
	// => 특정 속성 1개가 아닌 해당 클라이언트에 대한 모든 세션 정보 제거
	//    단, 속성만 제거하는 것이 아니라 세션 객체 자체를 무효화(주의! null 이 아님!)하므로
	//    세션 객체의 대부분의 속성에 접근 자체가 불가능해진다!
	session.invalidate();
	out.print("세션 아이디 : " + session.getId());
	out.print("<br>세션 유지 시간 : " + session.getMaxInactiveInterval() + "초");
	
// 	out.print("세션값1 : " + session.getAttribute("sessionValue1")); // 예외 발생!
	// => 세션 초기화 후에는 동일 페이지 내에서 getId() 메서드를 통한 세션 아이디 확인 등은 가능하나
	//    그 외의 대부분의 세션 객체의 속성들에 대한 메서드 호출 시 예외(오류) 발생함!
	// => java.lang.IllegalStateException: getAttribute: 세션이 이미 무효화되었습니다.
	%>
	<h3>세션 초기화 완료</h3>
	<h3><a href="sessionTest2_get.jsp">세션값 확인</a></h3>
	<%-- 세션 초기화 후 새로운 요청(ex. 다른 페이지 이동) 시 서버에 의해 새로운 세션 생성됨 --%>
</body>
</html>















