<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ page isELIgnored="false" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>test4_result.jsp</h3>
	<h3>
		<%-- EL 활용하여 파라미터 name, age 값, 세션 객체의 id 속성값 출력 --%>
		이름 : ${param.name }<br>
		나이 : ${param.age }<br>
		<%-- 동일한 name 속성을 갖는 복수개의 파라미터는 param.파라미터명으로 접근 시 1개값만 출력 --%>
		<%-- request.getParameter() 메서드와 동일함 --%>
<%-- 		취미 : ${param.hobby } --%>

		<%--
		체크박스 등의 name 속성이 동일한 파라미터들은 배열 형태로 관리 가능
		(기존 자바 문법 : request.getParameterValue() 메서드 활용)
		EL 에서 접근 시 param.value 대신 paramValues 객체를 사용하면 배열처럼 접근 가능함
		=> 기본 문법 : ${paramValues.파라미터명[인덱스]} 
		   (${paramValues} 는 request.getParameterValues() 와 동일하게 배열 관리)
		--%>
<%-- 		취미 : ${paramValues.hobby[0]} / ${paramValues.hobby[1]} / ${paramValues.hobby[2]} --%>
		
		<%-- 만약, 취미를 하나도 체크하지 않았을 경우에는 "없음" 출력 --%>
		<%-- 배열이 비어있음도 empty 로 체크 가능 --%>
		취미 : 
		<c:choose>
			<c:when test="${empty paramValues.hobby}"> <%-- 하나도 체크하지 않았을 경우 --%>
				없음
			</c:when>
			<c:otherwise> <%-- 하나라도 체크했을 경우 --%>
				${paramValues.hobby[0]} / ${paramValues.hobby[1]} / ${paramValues.hobby[2]}
			</c:otherwise>
		</c:choose>
	</h3>
	<hr>
	<%
	// 자바 일반 for문 활용하여 제어변수 i값이 1 ~ 10 까지 1씩 증가하면서 i값 출력
// 	for(int i = 1; i <= 10; i++) {
// 		out.print(i + " ");
// 	}
	%>
	<%--
	[ JSTL - 반복문(<c:forEach></c:forEach> 태그) ]
	- 일반 for문과 향상된 for문을 모두 사용 가능한 for문(속성 조합에 따라 달라짐)
	--------------------------------------------------
	1) 일반 for문과 동일(시작값 ~ 종료값까지 증감값만큼 반복)한 문법
	<c:forEach var="제어변수명" begin="시작값" end="종료값" step="증가값">
		// 반복문 내에서 실행할 문장들...
		// var 속성으로 생성된 변수는 EL 을 통해 접근 가능(${변수명})
	</c:forEach>
	=> step 속성 생략 시 기본값 1씩 증가
	=> step 속성은 양수(0보다 큰 값)만 지정 가능
	--%>
	<%-- 1 ~ 10 까지 1씩 증가하는 i값 출력 --%>
	<c:forEach var="i" begin="1" end="10"> <%-- step 속성 생략 시 1씩 증가 --%>
		${i}
	</c:forEach>
	<br>
	<%-- 1 ~ 10 까지 2씩 증가하는 i값 출력 --%>
	<c:forEach var="i" begin="1" end="10" step="2">
		${i}
	</c:forEach>
	
	<br>
	<%-- 10 ~ 1 까지 1씩 감소하는 i값 출력(오류 발생 = 사용 불가) --%>
<%-- 	<c:forEach var="i" begin="10" end="1" step="-1"> --%>
<%-- 		${i} --%>
<%-- 	</c:forEach> --%>
	<hr>
	<%-- 파라미터 hobby(복수개)에 대한 배열을 통해 자바 일반 for문으로 배열 요소 차례대로 출력 --%>
	<%
	// 1) request.getParameterValues() 메서드 호출하여 복수개의 hobby 파라미터를 배열로 리턴받기
	String[] hobbies = request.getParameterValues("hobby");
	// 2) 배열 크기만큼 일반 for문으로 반복 접근하여 데이터 출력
	for(int i = 0; i < hobbies.length; i++) {
		out.print(hobbies[i] + " / ");
	}
	%>
	<br>
	<%-- <c:forEach> 태그로 동일한 작업 수행 --%>
	<%-- 0 ~ 2 까지 1씩 증가하면서 배열 인덱스값 직접 지정 --%>
	<c:forEach var="i" begin="0" end="2">
		${paramValues.hobby[i]}
	</c:forEach>
	
	
</body>
</html>















