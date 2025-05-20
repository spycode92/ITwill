<%@page import="jsp08_jstl.Person"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>test1_result.jsp</h1>
	<%-- 폼 파라미터로 전달받은 name, age, email 값을 변수에 저장 후 출력 --%>
	<%
	String name = request.getParameter("name");
	String age = request.getParameter("age");
	String email = request.getParameter("email");
	%>
	<h3>
		이름 : <%=name %><br>
		나이 : <%=age %><br>
		이메일 : <%=email %>
	</h3>
	
	<%-- session 객체에 저장된 "testValue" 속성값을 변수에 저장 후 출력 --%>
	<%-- session 객체에 저장된 "person" 속성값에 해당하는 Person 객체의 필드값을 변수에 저장 후 출력 --%>
	<%
	String testValue = (String)session.getAttribute("testValue");
	
	Person person = (Person)session.getAttribute("person");
	// Person 객체의 Getter 메서드 호출하여 객체 내에 저장된 필드(멤버변수)값 가져오기
// 	int pIdx = person.getIdx();
	int pIdx = 1; // 임시(EL 값 테스트용)
	String pName = person.getName();
	%>
	<h3>
		testValue 값 : <%=testValue %><br>
		Person - idx : <%=pIdx %><br>
		Person - name : <%=pName %>
	</h3>
	<hr>
	<%-- ========================================================= --%>
	<%-- 파라미터 및 세션 속성값을 변수에 저장하지 않고 직접 출력 --%>
	<h3>
		이름 : <%=request.getParameter("name") %><br>
		나이 : <%=request.getParameter("age") %><br>
		<%-- 파라미터 자체는 존재하지만 파라미터값이 없을 경우 널스트링("") 값 리턴됨 --%>
		이메일 : <%=request.getParameter("email") %><br>
		
		<%-- 존재하지 않는 파라미터 접근 시 null 값 리턴됨 --%>
		점수(존재하지 않음) : <%=request.getParameter("score") %><br>
	</h3>
	<h3>
		testValue 값 : <%=session.getAttribute("testValue") %><br>
		<%-- Person 객체는 이미 존재하므로 참조변수명으로 접근하여 값 출력 --%>
		Person - idx : <%=person.getIdx() %><br>
		Person - name : <%=person.getName() %><br>
		
		<%-- 존재하지 않는 세션의 속성값에 접근 시 null 값 리턴됨 --%>
		점수(존재하지 않음) : <%=session.getAttribute("score") %><br>
	</h3>
	<hr>
	<%-- ================================================================ --%>
	<%-- EL 사용하여 request 객체의 파라미터 처리(EL 내장객체 param 활용) --%>
	<%-- 기본 문법 : ${param.파라미터명} --%>
	<h3>
		이름 : ${param.name}<br> <%-- <%=request.getParameter("name") 코드 대체 %> --%>
		나이 : ${param.age}<br>
		<%-- 파라미터 자체는 존재하지만 파라미터값이 없을 경우 널스트링("") 값 리턴됨 --%>
		이메일 : ${param.email}<br>
		
		<%-- 존재하지 않는 파라미터 접근 시 null 값 대신 널스트링("") 출력됨 --%>
		점수(존재하지 않음) : ${param.score}<br>
	</h3>
	
	<%-- EL 사용하여 session 객체의 속성값 처리(EL 내장객체 sessionScope 활용) --%>
	<%-- 기본 문법 : ${sessionScope.속성명} --%>
	<h3>
		세션 testValue 값 : ${sessionScope.testValue}<br> <%-- session.getAttribute("testValue") 대체 --%>
		<%-- 세션에 존재하지 않는 속성 지정 시에도 null 대신 널스트링("") 출력됨 --%>
		세션 testValue22 값 : ${sessionScope.testValue22}<br>
		
		<%-- 내장객체 중 영역객체명을 생략하더라도 영역객체 내의 속성에 접근 가능함 --%>
		<%-- 단, 범위가 좁은 영역부터 차례대로 탐색 --%>
		<%-- 영역 범위 : <좁음> page -> request -> session -> application <넓음> --%>
		세션 testValue 값(영역객체 생략) : ${testValue}<br> <%-- session 객체의 testValue 속성값 --%>
		
		<%-- 주의! 만약, request 와 session 객체에 동일한 속성명이 존재할 경우 --%>
		<%-- 영역 객체명 생략 시 더 좁은 범위인 request 객체의 속성값이 탐색됨 --%>
		<%request.setAttribute("testValue", "request value"); %>
		세션 testValue 값(영역객체 생략) : ${testValue}<br> <%-- request 객체의 testValue 속성값 --%>
		
		<%-- ============================================================= --%>
		<%-- 세션에 저장된 속성값이 객체일 경우 해당 객체를 통해 멤버변수(필드)에 바로 접근 가능 --%>
		<%-- 기본 문법 : ${sessionScope.속성명.필드명} --%>
		<%-- 주의! 멤버변수(필드)에 직접 접근하는것이 아니라, 내부적으로 Getter 메서드가 호출됨 --%>
		세션 Person - idx : ${sessionScope.person.idx }<br> <%-- Person - getIdx() 호출됨 --%>
		세션 Person - name : ${sessionScope.person.name }<br> <%-- Person - getName() 호출됨 --%>
	</h3>
	<h3>
		<%-- 스크립틀릿 영역 내에서 선언한 변수를 EL 을 통해 접근이 가능할까? --%>
		로컬변수 name : ${name}<br> <%-- 널스트링 출력됨 --%>
		<%-- ${이름} 의 경우 영역객체를 탐색하는데, 이 때 영역에 저장되지 않은 속성이면 널스트링 --%>
		<%
		// 영역 객체 내에 저장하면 접근 가능해진다!
		request.setAttribute("name", name);
		%>
		request 영역의 name : ${name}
	</h3>
</body>
</html>















