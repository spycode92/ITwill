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
		\${10 ne 20} = ${10 ne 20}<br> <%-- false --%>
		
		
		
		
	</h3>
</body>
</html>
















