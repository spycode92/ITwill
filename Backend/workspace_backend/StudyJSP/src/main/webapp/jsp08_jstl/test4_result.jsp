<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%-- JSTL 에서 제공하는 다양한 함수 사용을 위해 functions 라이브러리 추가 => ${fn:함수명()} 형태로 활용 --%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  
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
	<br>
	<%-- 
	단, 기본적인 반복문으로는 배열의 크기에 맞게 반복하지 못하므로 불필요한 반복 발생함
	따라서, 배열 크기를 알아내기 위해서는 JSTL - functions 라는 특수한 라이브러리 필요
	=> 자바의 배열명.length 속성을 대신하기 위해 ${fn:length(배열명)} 으로 대체
	--%>
	<%-- 취미(hobby) 배열 크기 : ${fn:length(paramValues.hobby)} --%>
	<h3>hobby 배열 크기 : ${fn:length(paramValues.hobby)}</h3>
	<%-- end 속성값에 배열 크기를 알아내는 length() 함수를 EL 로 표현(-1 필요) --%>
<%-- 	<c:forEach var="i" begin="0" end="${fn:length(paramValues.hobby) - 1}"> --%>
<%-- 		${paramValues.hobby[i]} --%>
<%-- 	</c:forEach> --%>
	<%-- 반복되는 인덱스 값을 확인하려면 varStatus 속성을 통해 count 또는 index 값 확인 가능 --%>
<%-- 	<c:forEach var="i" begin="0" end="${fn:length(paramValues.hobby) - 1}" varStatus="status"> --%>
<%-- 		index : ${status.index}, count : ${status.count}, 값 : ${paramValues.hobby[i]}<br> --%>
<%-- 	</c:forEach> --%>
	<%-- <c:set> 태그를 통해 함수 처리 결과값을 저장한 뒤 사용도 가능함 --%>
	<c:set var="endIndex" value="${fn:length(paramValues.hobby) - 1}" />
	<c:forEach var="i" begin="0" end="${endIndex}">
		${paramValues.hobby[i]}
	</c:forEach>
	<hr>
	<%
	// 자바의 향상된 for문으로 취미 배열 반복 접근(윗쪽에 hobbies 배열에 저장되어 있음)
	for(String hobby : hobbies) {
		out.println(hobby);
	}
	%>
	<br>
	<%--
	2) 인덱스 없이 객체 내의 데이터를 차례대로 접근하는 forEach 문(= 향상된 for문) 문법
	<c:forEach var="변수명" items="${데이터 저장된 객체}" varStatus="상태변수명">
		// 반복문 내에서 실행할 문장들...
		// var 속성으로 설정된 변수에 items 속성에서 지정한 객체 데이터가 자동으로 저장됨(필수)
		// varStatus 속성을 활용하여 반복되는 객체의 인덱스 등 상태값을 알아낼 수 있음(forEach 공통)
		// (ex. varStatus변수명.index : 인덱스값(0부터 시작), 변수명.count : 1부터 시작)
	</c:forEach>
	--%>
	<c:forEach var="hobby" items="${paramValues.hobby}" varStatus="status">
		index : ${status.index}, count : ${status.count}, 값 : ${hobby}<br>
	</c:forEach>
	<hr>
	<%-- ============================================================== --%>
	<%
	// 연습문제)
	// 1) 배열 names 에 이름 5개 문자열로 저장(1개의 문자열은 널스트링 저장)
	String[] names = {"박민경", "이정민", "", "배수현", "아이작"};
	
	// 2) for문 활용하여 names 배열값 출력
	//    단, 이름이 비어있을 경우(= 널스트링) "이름 없음" 출력
	for(String name : names) {
		if(name.equals("")) {
			out.println("이름없음");
		} else {
			out.println(name);
		}
	}
	
	// page 영역에 "names" 라는 속성명으로 names 배열 저장
	pageContext.setAttribute("names", names);
	%>
	<br>
	<%-- <c:forEach> 태그로 동일한 작업 수행 --%>
	<c:forEach var="name" items="${names}">
<%-- 		<c:choose> --%>
<%-- 			<c:when test="${empty name}"> --%>
<!-- 				이름없음 -->
<%-- 			</c:when> --%>
<%-- 			<c:otherwise> --%>
<%-- 				${name} --%>
<%-- 			</c:otherwise> --%>
<%-- 		</c:choose> --%>
		<%-- 삼항연산자로 표현 시 일반 데이터(문자열 등)는 '' 또는 "" 기호로 감싸야함 --%>
		${empty name ? "이름없음22" : name}
	</c:forEach>
</body>
</html>















