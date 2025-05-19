<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>forwardTest1.jsp</h3>
	<%-- 하이퍼링크(a 태그) 사용하여 forwardTest2.jsp 페이지로 이동(파라미터 : name=hong, age=20) --%>
	<a href="forwardTest2.jsp?name=hong&age=20">이동</a>
	
	<%--
	[ 액션 태그(Action Tag) ]
	- 자바(JSP)에서 사용하는 코드들 중 자주 사용하는 코드를 HTML 태그 형식으로 제공
	- 기존 HTML 태그들과 어울려서 코드 가독성이 높아짐
	- 기본 문법 : <jsp:액션태그명></jsp:액션태그명> 또는 <jsp:액션태그명 />
	------------------------------------------------------------------------
	[ <jsp:forward> 액션태그 ]
	- pageContext.forward() 메서드와 동일한 작업(디스패치 방식 포워딩)을 수행하는 액션 태그
	- 기본 문법 : <jsp:forward page="이동할페이지URL">
	--%>
<%-- 	<jsp:forward page="forwardTest2.jsp"></jsp:forward> --%>
<%-- 	<jsp:forward page="forwardTest2.jsp" /> --%>
	
	<%-- 만약, 포워딩 할 페이지로 전송할 데이터가 있을 경우 --%>
	<%-- URL 뒤에 직접 파라미터 결합을 하거나 시작태그와 끝태그 사이에 <jsp:param> 태그 활용 --%>
	<%-- 단, 서버측에서 실행되는 명령이므로 파라미터를 웹브라우저 URL 이나 개발자도구에서 확인 불가 --%>
	<%-- 1) URL 뒤에 파라미터를 직접 연결할 경우(= 하이퍼링크 등과 동일한 방법) --%>
<%-- 	<jsp:forward page="forwardTest2.jsp?name=hong&age=20" /> --%>
	
	<%-- 2) <jsp:param> 태그를 활용하여 파라미터를 포함시켜 전송할 경우 --%>
	<jsp:forward page="forwardTest2.jsp">
		<jsp:param name="name" value="홍길동"/>
		<jsp:param name="age" value="20"/>
	</jsp:forward>
	
	
	
</body>
</html>












