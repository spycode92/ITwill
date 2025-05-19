<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>attributeTest1.jsp</h3>
	<%
	/*
	JSP 의 4대 영역 : page, request, session, application
	4대 영역 객체 : pageContext, request, session, application(page 영역의 객체명만 다르다!)
	----------------------------------------------------------------------------------
	[ 영역 객체의 유효 범위(= 속성(데이터) 저장 시 전달(공유) 가능한 범위) ]
	1) page 영역(pageContext 객체) : 현재 페이지에서만 유효(= 페이지 이동 시 객체 제거됨)
	2) request 영역(객체) : 클라이언트 요청에 대한 응답까지 유효(= 새로운 요청 발생 시 객체 제거됨)
	3) session 영역(객체) : 세션 유지 조건까지 유효(= 세션 제거 조건 충족 시 객체 제거됨)
                            => 웹브라우저 완전히 종료 후 다시 실행하여 요청 시 
                               새로운 세션이 생성되므로 기존 세션은 제거됨
	4) application 영역(객체) : 서버 동작 시까지 유효(= 서버 중지 시 객체 제거됨)
	----------------------------------------------------------------------------------
	각 영역 객체에 속성값(데이터) 저장하는 공통 메서드 : setAttribute(String name, Object value)
	=> name 이라는 이름(속성명)으로 value 라는 데이터(속성값)를 저장
	
	각 영역 객체의 속성값 접근하는 공통 메서드 : Object getAttribute(String name)
	=> name 이라는 이름에 해당하는 속성을 찾아 해당 속성의 속성값을 Object 타입으로 리턴
	=> 주의! 만약, name 에 해당하는 속성이 존재하지 않을 경우 null 값 리턴됨
	*/
	
	// 각 영역 객체에 속성값(= 데이터) 저장하기 
	// => setAttribute(String name, Object value) 메서드 활용
	pageContext.setAttribute("pageScope", "pageContext 객체의 속성값");
	request.setAttribute("requestScope", "requestContext 객체의 속성값");
	session.setAttribute("sessionScope", "session 객체의 속성값");
	application.setAttribute("applicationScope", "application 객체의 속성값");
	%>
	
	<%-- 각 영역 객체에 저장된 속성값(= 데이터)을 현재 페이지(속성 저장한 페이지)에서 확인하기 --%>
	<%-- => Object getAttribute(String name) 메서드 활용 --%>
	<h3>pageContext 객체 속성값 : <%=pageContext.getAttribute("pageScope") %></h3>
	<h3>request 객체 속성값 : <%=request.getAttribute("requestScope") %></h3>
	<h3>session 객체 속성값 : <%=session.getAttribute("sessionScope") %></h3>
	<h3>application 객체 속성값 : <%=application.getAttribute("applicationScope") %></h3>
	<%-- 속성값을 저장한 페이지에서 모든 영역 객체의 속성값 확인 가능함(모든 값이 유지됨) --%>
	
	<%-- 단, 지정한 속성명에 해당하는 속성이 존재하지 않을 경우 null 값 리턴됨 --%>
	<h3>application 객체 속성값(잘못된 이름) : <%=application.getAttribute("applicationScope222") %></h3>
	
	<%
	// attributeTest2.jsp 페이지로 이동 처리
	// ---------------------------------------------------------------------------------
	// 1) 디스패치(Dispatch) 방식 포워딩 : pageContext 객체의 forward() 메서드 활용
	// => 클라이언트에서 attributeTest1.jsp 페이지 요청 시 기존 요청(attributeTest1.jsp)이 유지된 채
	//    서버측에서 새 페이지 정보(attributeTest2.jsp)를 처리한 후
	//    새 요청 처리 결과만 응답 데이터로 클라이언트측으로 전송하므로
	//    이 과정이 하나의 요청/응답으로 처리되어 기존 request 객체가 그대로 유지됨(새로 생성X)
	//    따라서, 디스패치 방식으로 포워딩 된 페이지에서 기존 request 객체의 속성에 접근 가능하다!
	// => 또한, 새로운 요청이 아니므로 브라우저 주소표시줄의 주소(URL)가 그대로 유지됨
	//    (http://localhost:8080/StudyJSP/jsp05_attribute/attributeTest1.jsp)
// 	pageContext.forward("attributeTest2.jsp");
	/*
	pageContext 객체의 속성값 : null
	=> pageContext 객체의 속성값은 현재 페이지를 벗어난 새 페이지에서 유지되지 않아 null 출력
	
	request 객체의 속성값 : request 객체의 속성값
	=> request 객체의 속성값은 이전 요청이 그대로 유지되므로 저장된 속성값도 유지됨(출력됨)
	*/
	
	// ==========================================================================================
	// 2) 리다이렉트(Redirect) 방식의 포워딩 : response 객체의 sendRedirect() 메서드 활용
	response.sendRedirect("attributeTest2.jsp");
	/*
	pageContext 객체의 속성값 : null
	=> pageContext 객체의 속성값은 현재 페이지를 벗어난 새 페이지에서 유지되지 않아 null 출력
	
	request 객체의 속성값 : null
	=> request 객체의 속성값은 새로운 요청이 발생함에 따라 새 request 객체가 생성되어
	   이전 request 객체의 속성에 접근이 불가능하므로 null 값 출력됨
	*/
	
	%>
</body>
</html>













