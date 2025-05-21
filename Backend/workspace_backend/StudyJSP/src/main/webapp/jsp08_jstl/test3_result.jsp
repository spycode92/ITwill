<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>      
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>test3_result.jsp</h3>
	<h3>
		<%-- EL 활용하여 파라미터 name, age 값, 세션 객체의 id 속성값 출력 --%>
		파라미터 name : ${param.name }<br>
		파라미터 age : ${param.age }<br>
		세션 객체 id 속성값 : ${sessionScope.id}<br>
	</h3>
	<hr>
	
	<%--
	[ 자바에서 가장 많이 사용하는 문장(조건문, 반복문)을 표현하는 JSTL 문법 ]
	-------------------------------------------------------------------------------
	[ 조건문 - if(단일 if문) ]
	- <c:if></c:if> 태그 : if 문에 해당하는 커스텀 태그(단일 if 문이므로 else 문 없음)
	- if 문의 조건식에 해당하는 문장을 test="" 속성 내에 EL 을 사용하여 표기
	< 기본 문법 >
	<c:if test="${조건식}">
		// 조건식 판별 결과가 true 일 때 실행할 문장들...
	</c:if>
	--%>
	<c:set var="num" value="-10" />
<%-- 	${num } --%>
	<%-- num 값이 0보다 큰지 판별 --%>
	<c:if test="${num > 0}">
		\${num}(${num}) 값이 0보다 크다!<br>
	</c:if>
	
	<%-- 파라미터 age 값이 10 이상이고 20 미만일 경우 "10대입니다!" 출력 --%>
	<c:if test="${param.age >= 10 and param.age < 20}">
		나이(${param.age}) : 10대입니다!<br>
	</c:if>
	
	<%-- 파라미터 name 값이 비어있는지 판별 --%>
	<%-- 비어있을 경우 자바스크립트로 "이름 입력 필수!" 경고창 출력 후 이전페이지로 돌아가기 --%>
	<c:if test="${empty param.name}">
		<script type="text/javascript">
			alert("이름 입력 필수!");
			history.back();
		</script>
	</c:if>
	<hr>
	
	<%--
	[ <c:choose><c:when><c:otherwise> 태그 ]
	- 단일 if 문 대신 if ~ else 또는 다중 else if 문에 해당하는 커스텀 태그
	- <c:choose> 태그를 사용하여 조건문이라는 표시를 하고
	  <c:when> 태그의 test="" 속성을 통해 조건식을 지정(복수개의 조건은 <c:when> 태그 복수개 사용)
	- 또한, 조건식의 판별 결과가 모두 false 일 때 <c:otherwise> 태그에 수행할 문장 기술
	  (= else 문과 동일한 역할을 수행하며, 생략 가능)
	- 주의! if 문과 동일하게 <c:otherwise> 태그는 가장 마지막에 기술되어야 함
	  순서가 잘못됐을 경우 컴파일 에러는 발생하지 않지만 실행 시점에 예외 발생함
	  => org.apache.jasper.JasperException: <h3>[/jsp08_jstl/test3_result.jsp] 내의 [c]을(를) 위한 TagLibraryValidator로부터 Validation 오류 메시지들</h3><p>90: Illegal "c:when" after "c:otherwise" tag in "c:choose" tag.</p><p>96: Illegal "c:when" after "c:otherwise" tag in "c:choose" tag.</p><p>101: Illegal "c:when" after "c:otherwise" tag in "c:choose" tag.</p>
	
	< 기본 문법 >
	<c:choose>
		<c:when test="${조건식1}">
			// 조건식1 이 true 일 때 실행할 문장들...
		</c:when>  
		<c:when test="${조건식n}">
			// 조건식n 이 true 일 때 실행할 문장들...
		</c:when>  
		<c:otherwise>
			// 위의 조건식이 모두 false 일 때 실행할 문장들...
		</c:otherwise>
	</c:choose>  
	--%>
	<%-- 파라미터 age 값이 10 이상이고 20 미만이면 "10대!" --%>
	<%-- 20 이상이면 "20대 이상!", 10보다 작으면 "오류!" 출력 --%>
	<c:choose>
		<c:when test="${param.age >= 10 and param.age < 20}">
			나이(${param.age}) : 10대입니다!<br>
		</c:when>
		<c:when test="${param.age >= 20}">
			나이(${param.age}) : 20대 이상입니다!<br>
		</c:when>
<%-- 		<c:when test="${param.age < 10}"> --%>
<%-- 			나이(${param.age}) : 오류!<br> --%>
<%-- 		</c:when> --%>
		<%-- 10대와 20대 이상을 제외한 나머지 경우의 수를 모두 묶어서 <c:otherwise> 태그로 처리 --%>
		<c:otherwise>
			나이(${param.age}) : 오류!<br>
		</c:otherwise>
	</c:choose>
	<hr>
	
	<%-- 세션 영역에 "id" 라는 속성명으로 id 파라미터값 저장 --%>
	<c:set var="id" value="${param.id}" scope="session" />
<%-- 	아이디 : ${sessionScope.id}  --%>

	<%-- 세션 속성 중 id 속성값 판별 --%>
	<%-- "admin" 일 경우 "관리자 모드!" 출력, "hong" 일 경우 "홍길동 님!" 출력 --%>
	<%-- 속성값이 없을 경우(empty) 자바스크립트로 "로그인 필수!" 출력 후 이전페이지로 돌아가기 --%>
	<%-- 아니면, "접근 권한이 없습니다!" 출력 => <c:otherwise> --%>
	<c:choose>
		<c:when test="${empty sessionScope.id}">
			<script type="text/javascript">
				alert("로그인 필수!");
				history.back();
			</script>
		</c:when>
		<c:when test="${sessionScope.id eq 'admin'}">
			아이디(${sessionScope.id}) : 관리자 모드!<br>
		</c:when>
		<c:when test="${sessionScope.id eq 'hong'}">
			아이디(${sessionScope.id}) : 홍길동 님!<br>
		</c:when>
		<c:otherwise>
			아이디(${sessionScope.id}) : 접근 권한이 없습니다!<br>
		</c:otherwise>
	</c:choose>
</body>
</html>















