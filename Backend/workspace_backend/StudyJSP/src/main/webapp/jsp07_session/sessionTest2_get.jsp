<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>sessionTest2_get.jsp</h3>
	<hr>
	<h3>세션 아이디 : <%=session.getId() %></h3>
	<h3>세션값1 : <%=session.getAttribute("sessionValue1") %></h3>
	<h3>세션값2 : <%=session.getAttribute("sessionValue2") %></h3>
	<hr>
	
	<%
	// 세션값을 리턴받아 각각의 변수(str1, str2)에 저장 후 출력하기
// 	String str1 = session.getAttribute("sessionValue1");
	// => 오류 메세지 : Type mismatch: cannot convert from Object to String
	// => 원인 : session.getAttribute() 메서드 리턴타입이 Object 타입이므로
	//           String 타입 등의 변수에 저장 시 해당 타입에 맞게 형변환 필요
	// => 해결방법 : Object -> X 타입으로 변환하기 위해 형변환 연산자로 X 타입 지정(다운캐스팅)
	//               ex) String 타입으로 변환할 경우 (String) 사용
	String str1 = (String)session.getAttribute("sessionValue1");
// 	String str2 = (String)session.getAttribute("sessionValue1");
	// 더 정확하게 다운캐스팅을 수행하려면 캐스팅이 가능한지 여부를 instanceof 연산자로 판별 후 캐스팅
	String str2 = null;
	if(session.getAttribute("sessionValue2") instanceof String) {
		str2 = (String)session.getAttribute("sessionValue2");
	}
	%>
	<h3>세션값1 : <%=str1 %></h3>
	<h3>세션값2 : <%=str2 %></h3>
	
	<input type="button" value="이전페이지" onclick="history.back()">
	<input type="button" value="처음으로" onclick="location.href='sessionTest2.jsp'">
</body>
</html>












