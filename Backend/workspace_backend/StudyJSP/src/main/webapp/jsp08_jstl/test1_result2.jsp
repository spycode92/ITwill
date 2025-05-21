<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>
		<%-- EL 의 연산자 --%>
		${10 + 20} = ${10 + 20}<br> <%-- 30 = 30 형태로 출력됨 --%>
		<%-- 참고) EL 문장을 단순 텍스트로 취급하려면 $ 기호 앞에 \ 붙여서 이스케이프 문자로 표현 --%>
		\${10 + 20} = ${10 + 20}<br> <%-- ${10 + 20} = 30 형태로 출력됨 --%>
		
		<%-- 파라미터값 등을 사용하여 연산도 가능 --%>
		<%-- 또한, 수치 데이터의 경우 별도의 형변환 없이 연산 가능(자동 변환 지원됨) --%>
		request.getParameter("age") + 20 = <%=request.getParameter("age") + 20 %><br> <%-- 문자열 결합 --%>
		\${param.age + 20} = ${param.age + 20}<br> <%-- 수치 연산 가능 --%>
		<%-- 따라서, 수치데이터가 아닌 문자열을 연산할 경우 NumberFormatException 발생함 --%>
<%-- 		\${param.name + 20} = ${param.name + 20}<br> --%>
		
		<%-- 관계(비교)연산자는 기호 또는 기호에 대응하는 연산자 이름을 사용 --%>
		\${10 >= 20} = ${10 >= 20}<br> <%-- false --%>
		\${10 ge 20} = ${10 ge 20}<br> <%-- false --%>
		
		\${10 < 20} = ${10 < 20}<br> <%-- true --%>
		\${10 lt 20} = ${10 lt 20}<br> <%-- true --%>
		
		\${10 == 20} = ${10 == 20}<br> <%-- false --%>
		\${10 eq 20} = ${10 eq 20}<br> <%-- false --%>
		
		\${10 != 20} = ${10 != 20}<br> <%-- false --%>
		<%-- != 과 동일한 ne 연산자 사용 시 JSP 파일에서 오류로 표시되나 정상 동작됨 --%>
<%-- 		\${10 ne 20} = ${10 ne 20}<br> false --%>
	</h3>
	<hr>
	<h3>
		<%-- 비어있는 값에 대한 판별 방법 --%>
		<%-- 1) eq(ne) 연산자를 통한 판별(null 값과 널스트링 값을 각각 다른 값으로 취급) --%>
		\${param.name == null} = ${param.name == null}<br> <%-- 값이 null 이 아니므로 false --%>
		\${param.name eq null} = ${param.name eq null}<br> <%-- 값이 null 이 아니므로 false --%>
		
		\${param.name != null} = ${param.name != null}<br> <%-- 값이 null 이 아니므로 true --%>
		\${param.name ne null} = ${param.name ne null}<br> <%-- 값이 null 이 아니므로 true --%>
		<br>
		<%-- 파라미터 자체는 존재하지만, 파라미터값이 없을 경우 널스트링으로 취급 --%>
		\${param.email eq null} = ${param.email eq null}<br> <%-- 값이 null 이 아니므로 false --%>
		\${param.email eq ""} = ${param.email eq ""}<br> <%-- 값이 널스트링("") 이므로 true --%>
		
		<%-- 파라미터 자체가 존재하지 않을 경우 null 로 취급 --%>
		\${param.score} = ${param.score}<br> <%-- 아무런 값도 출력되지 않음(널스트링처럼 보임) --%>
		\${param.score eq null} = ${param.score eq null}<br> <%-- 실제로는 null 이므로 true --%>
		\${param.score eq ""} = ${param.score eq ""}<br> <%-- 실제로는 널스트링("")이 아니므로 false --%>
		<br>
		<%--
		2) empty 연산자(not empty) 사용 시 null, 널스트링, 배열 또는 컬렉션 사이즈 0 등
		   특정 대상의 "값이 비어있음" 을 통합 판별 가능
		   이 때, empty 연산자는 단항연산자이므로 피연산자의 앞에 기술
		--%>
		\${empty param.name} = ${empty param.name}<br>
		\${empty param.email} = ${empty param.email}<br>
		\${empty param.score} = ${empty param.score}<br>
		
		<%-- 논리연산자 활용 --%>
		<%-- not 연산자 : 현재 상태를 반전(true -> false, false -> true) --%>
		<%-- 논리연산자 중 not 연산자를 empty 연산자와 결합하여 "값이 비어있지 않음" 을 판별 가능 --%>
		\${not empty param.name} = ${not empty param.name}<br>
		\${not empty param.email} = ${not empty param.email}<br>
		\${not empty param.score} = ${not empty param.score}<br>
		
		<%-- and 연산자 : 두 피연산자가 모두 true 면 true, 하나라도 false 면 false --%>
		<%-- 파라미터 name 과 email 이 모두 비어있는지 판별 --%>
		\${empty param.name and empty param.email} = ${empty param.name and empty param.email}<br>
		<%-- name 은 데이터가 존재하고(false), email 은 데이터가 없으므로(true) false --%>
		
		<%-- or 연산자 : 두 피연산자가 모두 false 면 false, 하나라도 true 면 true --%>
		<%-- 파라미터 name 과 email 중 하나라도 비어있는지 판별 --%>
		\${empty param.name or empty param.email} = ${empty param.name or empty param.email}<br>
		<%-- name 은 데이터가 존재하고(false), email 은 데이터가 없으므로(true) true --%>
		
		
	</h3>
</body>
</html>
















