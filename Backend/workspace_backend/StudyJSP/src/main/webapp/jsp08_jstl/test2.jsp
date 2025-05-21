<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
JSTL(JSP Standard Tag Library)
- JSP 에서 사용 가능한 커스텀 태그 라이브러리
  => JSP 에서 사용하는 문장을 태그 형식으로 제공
  => JSTL Core 라이브러리 : JSTL 의 기본 핵심 기능 제공(조건문, 반복문, 변수 설정 및 출력 등)
- JSTL 기능을 사용하려면 해당 라이브러리 다운로드(tomcat.apache.org - Taglibs) 후 Build path 추가 필요
  => 주의! Tomcat 10.x 부터는 기본 JSTL 라이브러리(1.x) 대신 최소 2.x 버전 이상을 사용해야함
     (jakarta.servlet.jsp.jstl-2.0.0.jar, jakarta.servlet.jsp.jstl-api-2.0.0.jar 필요)
     => 해당 파일을 프로젝트 내의 src/main/webapp/WEB-INF/lib 폴더에 넣고
        파일 선택 후 우클릭 - Build Path - Add to build path 클릭
- 또한, 등록된 JSTL 라이브러리를 실제로 적용하려면 반드시 <%@taglib %> 디렉티브를 사용하여
  현재 문서에 등록 필수(prefix 값과 uri 정보 설정)
  => prefix : 태그에서 사용할 문구(접두어) 를 지정하며, Core 라이브러리는 주로 Core 의 약자 c 를 사용
              (JSTL 태그 사용 시 접두어 c 를 활용하여 <c:xxx> 형식의 태그 사용 가능)
  => uri : 태그 라이브러리 문법이 존재하는 위치를 지정
           (이클립스 content assist 기능을 활용하여 자동 완성 가능)
           (uri="이부분에서 Ctrl + Spacebar")
--%>   
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>test2.jsp - JSTL</h3>
	<%--
	<c:set> 태그 사용하여 변수 생성 및 값 설정
	- var 속성에 변수명, value 속성에 변수값 지정
	- 실제로 변수는 아니고 각 영역의 속성값이지만 변수처럼 활용 가능
	- scope 속성에 변수의 유효범위 지정 가능하며, 생략 시 기본값 page
	  (page 속성 : 현재 페이지에서만 유효)
	- 생성(선언)된 변수는 EL 을 통해 접근 가능(자바 코드로 접근 불가 = 별도의 작업 필요)
	  (JSP 영역 객체에 저장되어 있으므로 getAttribute() 메서드를 통해 리턴받아 사용해야함)
	
	<c:set var="변수명" value="값"></c:set>
	--%>
	<%-- str 변수 선언 및 "Hello, World!" 문자열 저장 --%>
	<%-- 기존 자바 코드 : String str = "Hello, World!" --%>
<%-- 	<c:set var="str" value="Hello, World!"></c:set> --%>
	<%-- 시작태그(<c:set>)와 끝태그(</c:set>) 사이에 아무것도 포함되지 않을 경우 --%>
	<%-- 끝태그 생략하고 시작 태그 마지막에 / 기호로 끝태그 대체 --%>
	<%-- scope 속성 생략 시 기본값은 page(현재 페이지에서만 유효) --%>
	<c:set var="str" value="Hello, World!" /> 
	<%-- scope 속성값을 영역명으로 지정 시 해당 영역의 속성으로 관리됨 --%>
<%-- 	<c:set var="str" value="Hello, World!" scope="session" /> 세션 영역의 속성으로 저장됨 --%>
	
	<%-- 위에서 선언한 값을 EL 을 통해 출력 => ${속성명} --%>
	<h3>
		\${str} = ${str}<br>
		\${str} 값이 비어있는가? = ${empty str}<br>
		<%-- 주의! <c:set> 태그로 설정한 값은 JSP 스크립트 요소에서 변수처럼 접근 불가 --%>
<%-- 		\${str} = <%=str %><br> --%>
		<%-- 각 영역 객체를 통해 getAttribute() 메서드로 접근 가능함 --%>
		session.getAttribute("str") = <%=session.getAttribute("str") %><br>
		<%-- 기본적으로 c:set 을 통해 생성된 값의 scope 는 page 영역이다! --%>
		\${pageScope.str} = ${pageScope.str}<br>
		\${sessionScope.str} = ${sessionScope.str}<br>
	</h3>
	
	<%-- request 영역에 str2 변수(속성) 생성 및 임의의 값 저장 --%>
	<c:set var="str2" value="Hello, World! - request" scope="request" />
	<%-- application 영역에 str2 변수(속성) 생성 및 임의의 값 저장 --%>
	<c:set var="str2" value="Hello, World! - application" scope="application" />
	<h3>
		\${requestScope.str2} = ${requestScope.str2}<br>
		\${applicationScope.str2} = ${applicationScope.str2}<br>
	</h3>
	<hr>
	
	<%-- <c:remove> 태그 사용하여 변수(영역객체 내의 속성) 삭제 --%>
	<%-- 기본 문법 : <c:remove var="속성명" scope="영역명" /> --%>
	<%-- 영역객체명.removeAttribute("속성명") 와 동일함 --%>
<%-- 	<c:remove var="str2" scope="request"/> request 영역의 str2 속성 제거 --%>
	<%-- 단, scope 속성 생략 시 모든 영역에서 해당 속성 제거 --%>
	<c:remove var="str2"/> <%-- 모든 영역의 str2 속성 제거 --%>
	<h3>
		\${requestScope.str2} = ${requestScope.str2}<br>
		\${applicationScope.str2} = ${applicationScope.str2}<br>
	</h3>
	
</body>
</html>





















