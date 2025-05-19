<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>attributeTest2.jsp</h3>
	<%-- 각 영역 객체에 저장된 속성값(= 데이터)을 현재 페이지(속성 저장한 페이지)에서 확인하기 --%>
	<%-- => Object getAttribute(String name) 메서드 활용 --%>
	<h3>pageContext 객체 속성값 : <%=pageContext.getAttribute("pageScope") %></h3>
	<h3>request 객체 속성값 : <%=request.getAttribute("requestScope") %></h3>
	<h3>session 객체 속성값 : <%=session.getAttribute("sessionScope") %></h3>
	<h3>application 객체 속성값 : <%=application.getAttribute("applicationScope") %></h3>
	<%--
	[ 1) 디스패치 방식 포워딩으로 attributeTest1.jsp -> attributeTest2.jsp 로 포워딩했을 경우 ]
	- pageContext 객체의 속성값만 null 이고, 나머지 속성값은 정상적으로 출력됨
	- page 영역(pageContext 객체)에 저장된 속성은 해당 데이터가 저장된 페이지에서만 유효하므로
	  다른 페이지(attributeTest2.jsp)로 이동하게 되면 해당 속성은 접근 불가
	  (= 새로운 페이지에서 새로운 pageContext 객체가 생성되므로 이전 pageContext 객체는 제거됨)  
	- 그러나, request 영역(request 객체)에 저장된 속성은 해당 데이터가 저장된 페이지에서
	  요청을 발생시켜 응답하는 페이지까지 그대로 유지됨.
	  따라서, 디스패치 방식 포워딩을 수행할 경우 request 객체가 응답 페이지(attributeTest2.jsp)까지
	  계속 유지되기 때문에 해당 request 객체에 저장된 속성도 그대로 유지됨  
	
	[ 2) 리다이렉트 방식으로 attributeTest1.jsp -> attributeTest2.jsp 로 포워딩했을 경우 ]
	- pageContext, request 객체의 속성값만 null 이고, 나머지 속성값은 정상적으로 출력됨
	- page 영역(pageContext 객체)는 위와 동일
	- request 객체의 속성값은 새로운 요청이 발생함에 따라 새 request 객체가 생성되어
	  이전 request 객체의 속성에 접근이 불가능하므로 null 값 출력됨
	--------------------------------------------------------------------------------------
	- session 객체의 속성값 : session 객체의 속성값
	=> session 객체의 속성값은 세션이 그대로 유지되므로 저장된 속성값도 유지됨(출력됨)
	=> 세션 제거 조건이 충족되지 않아 그대로 유지됨
	
	- application 객체의 속성값 : application 객체의 속성값
	=> application 객체의 속성값은 서버가 동작중이므로 저장된 속성값도 유지됨(출력됨)
	--%>
	
	<%--
	[ 웹브라우저의 새로운 탭(창)을 열어서 attributeTest2.jsp 페이지를 요청했을 경우 ]
	- pageContext 객체의 속성값 : null
	=> pageContext 객체의 속성값은 현재 페이지를 벗어난 새 페이지에서 유지되지 않아 null 출력
	
	- request 객체의 속성값 : null
	=> request 객체의 속성값은 새로운 요청이 발생함에 따라 새 request 객체가 생성되어
	   이전 request 객체의 속성에 접근이 불가능하므로 null 값 출력됨
	   
	- session 객체의 속성값 : session 객체의 속성값
	=> session 객체의 속성값은 세션이 그대로 유지되므로 저장된 속성값도 유지됨(출력됨)
	=> 세션 제거 조건이 충족되지 않아 그대로 유지됨
	
	- application 객체의 속성값 : application 객체의 속성값
	=> application 객체의 속성값은 서버가 동작중이므로 저장된 속성값도 유지됨(출력됨)
	===================================================================================
	[ 웹브라우저를 완전히 종료하고 새로 실행하여  attributeTest2.jsp 페이지를 요청했을 경우 ]
	- pageContext 객체의 속성값 : null
	=> pageContext 객체의 속성값은 현재 페이지를 벗어난 새 페이지에서 유지되지 않아 null 출력
	
	- request 객체의 속성값 : null
	=> request 객체의 속성값은 새로운 요청이 발생함에 따라 새 request 객체가 생성되어
	   이전 request 객체의 속성에 접근이 불가능하므로 null 값 출력됨
	   
	- session 객체의 속성값 : null
	=> 웹브라우저를 완전히 종료함으로 인해 세션 제거 조건이 충족되어 session 객체 제거됨
	   따라서, 기존 세션에 저장된 속성값도 접근이 불가능하여 null 값 출력됨
	
	- application 객체의 속성값 : application 객체의 속성값
	=> application 객체의 속성값은 서버가 동작중이므로 저장된 속성값도 유지됨(출력됨)
	=> 서버를 재시작(또는 STOP -> START) 할 경우 새로운 application 객체가 생성되어
	   기존 속성값에 접근이 불가능하게 되므로 null 값 출력됨
	--%>
	
</body>
</html>














