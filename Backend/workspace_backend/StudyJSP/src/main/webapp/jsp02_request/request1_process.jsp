<%@page import="java.util.Arrays"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>request1_process.jsp - 요청처리</h3>
	<%-- 요청 파라미터들을 처리하기 위해 자바 코드들을 기술하려면 스크립틀릿 영역내에 코드 기술 --%>
	<%
	/*
	request1_form.jsp 페이지에서 submit 버튼 클릭 시
	form 태그 내의 데이터(= 폼 파라미터)가 HTTP 요청 메세지에 포함되고
	action 속성에 지정된 페이지로 이동(= 페이지를 요청)하면서 HTTP 요청 메세지 전달함
	=> 요청 관련 모든 정보는 톰캣을 통해 request 객체가 관리(= JSP 가 자동으로 생성하는 객체 = 내장 객체)
	   따라서, request.메서드명() 형태로 request 객체의 메서드 호출하여 객체 다루기 가능
	=> 요청받은 request 객체에 저장된 폼 파라미터 데이터를 가져오는(접근하는) 방법
	   1) request.getParameter("파라미터명"); // 단일 파라미터 데이터 가져오기 = String 리턴
	   2) request.getParameterValues("파라미터명"); // 복수 항목 파라미터 가져오기 
	      = String[] 리턴(주로, checkbox 처럼 하나의 이름으로 복수개의 파라미터 전달할 경우 사용)
	   => "파라미터명" 부분에는 폼 태그에서 입력 항목의 name 속성에 지정된 속성값 사용
	=> 주의! 지정된 파라미터 자체가 존재하지 않을 경우(지정한 이름이 없을 경우) null 값이 리턴되고,
	   파라미터는 있으나 데이터가 없는 경우에는 널스트링("") 값이 리턴됨
	*/
	
	// 1. 파라미터 중 파라미터명(name 속성값이 "name" => name="name") 인 파라미터값 가져와서
	//    String 타입 변수 strName 에 저장 후 웹브라우저에 출력
	String strName = request.getParameter("name");
	out.print("이름 : " + strName + "<br>");
	%>
	<%-- 스크립틀릿 내부의 out.print() 메서드와 동일한 역할을 수행하는 표현식으로 출력 --%>
	이름 : <%=strName %><br>
	
	<%
	// 2. 파라미터 중 파라미터명(name 속성값이 "age" => name="age") 인 파라미터값 가져와서
	//    String 타입 변수 strAge 에 저장 후 웹브라우저에 출력
	String strAge = request.getParameter("age");
	out.print("나이 : " + strAge + "<br>");
	
	// 3. 파라미터 중 파라미터명(name 속성값이 "gender" => name="gender") 인 파라미터값 가져와서
	//    String 타입 변수 strGender 에 저장 후 웹브라우저에 출력
	String strGender = request.getParameter("gender");
	out.print("성별 : " + strGender + "<br>");
	
	// 4. 파라미터 중 파라미터명(name 속성값이 "email" => name="email") 인 파라미터값 가져와서
	//    String 타입 변수 strEmail 에 저장 후 웹브라우저에 출력
	String strEmail = request.getParameter("email");
	// => email 파라미터가 존재하지 않으므로 null 값 리턴됨
	out.print("E-Mail : " + strEmail + "<br>"); // null
	
	// 5. 파라미터 중 파라미터명(name 속성값이 "hobby" => name="hobby") 인 파라미터값 가져와서
	//    String 타입 변수 strHobby 에 저장 후 웹브라우저에 출력
// 	String strHobby = request.getParameter("hobby"); // 복수개의 파라미터 중 첫번째 파라미터값이 리턴됨
// 	out.print("취미 : " + strHobby + "<br>");
	// => 주의! 복수개의 데이터가 동일한 파라미터명으로 전달되는 경우(ex. 체크박스)
	//    getParameter() 메서드 사용 시 하나의 데이터(첫번째 파라미터)만 리턴됨
	// => 따라서, getParameter() 메서드 대신 getParameterValues() 메서드를 호출하여
	//    복수개의 동일한 이름을 갖는 파라미터를 String[](배열) 타입으로 리턴받아 처리 가능함
	String[] arrHobby = request.getParameterValues("hobby");
// 	System.out.println("arrHobby : " + arrHobby);
	out.print("취미 : " + arrHobby + "<br>"); // 취미 : [Ljava.lang.String;@230ccb7a
	// => 자바에서 배열명만 출력문에 지정 시 배열 내의 실제 데이터가 아닌 객체 참조값 출력됨
	// => 반복문을 통해 출력하거나 java.util.Arrays 클래스의 toString() 메서드 호출하여
	//    파라미터로 배열 전달 시 배열 내의 요소들을 문자열 하나로 묶어서 리턴해주므로 출력 가능해짐
	out.print("취미 : " + Arrays.toString(arrHobby) + "<br>"); // 취미 : [Ljava.lang.String;@230ccb7a
	
	// 체크박스가 저장된 배열을 직접 접근하여(반복 없이) 출력해보기
	// => 배열 인덱스로 직접 접근 시 존재하지 않는 인덱스로 인한 오류(예외) 발생할 수 있음
	// ex) java.lang.ArrayIndexOutOfBoundsException: Index 2 out of bounds for length 2
	//     => 배열 크기(length)가 2 인 배열에 인덱스 2번을 지정하여 배열 범위를 벗어남
// 	out.print("취미[0] : " + arrHobby[0] + "<br>");
// 	out.print("취미[1] : " + arrHobby[1] + "<br>");
// 	out.print("취미[2] : " + arrHobby[2] + "<br>");
	// 결론! 배열 접근 시 인덱스 범위 내에서 for문을 통해 크기만큼만 접근하는 것이 안전!
	
	// arrHobby 배열을 for문을 통해 차례대로 접근하여 데이터 출력하기
// 	for(int i = 0; i < arrHobby.length; i++) {
// 		out.print("취미[" + i + "] : " + arrHobby[i] + "<br>");
// 	}
	
	// 향상된 for문으로 동일한 작업 수행
	// => 기본 문법 : for(변수선언 : 객체) {}
// 	for(String hobby : arrHobby) {
// 		out.print("취미 : " + hobby + "<br>");
// 	}

	// 주의! 체크박스를 하나도 체크하지 않았을 경우 "hobby" 파라미터 자체가 존재하지 않으므로
	// request.getParameterValues() 메서드 리턴값이 null 이 되고(= 배열 저장 변수값 null)
	// 이 배열의 length 속성에 접근하는 등 배열을 접근할 때 null 값으로 인해 오류 발생함!
	// => NullPointerException 이라는 예외가 발생
	// => 따라서, null 값에 대한 오류까지 방지할 수 있도록 대응하려면
	//    객체(배열)이 null 이 아닐 경우에만 접근할 수 있도록 if 문을 추가해야한다!
	if(arrHobby != null) {
		for(String hobby : arrHobby) {
			out.print("취미 : " + hobby + "<br>");
		}
	} else { // 배열이 null 일 경우 처리할 코드(생략 가능)
		out.print("취미 : 없음<br>");
	}
	%>
</body>
</html>













