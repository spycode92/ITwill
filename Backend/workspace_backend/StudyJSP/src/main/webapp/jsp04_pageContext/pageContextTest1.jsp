<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>pageContextTest1.jsp</h3>
	<%-- 자바스크립트 alert() 함수로 "확인" 메세지 출력 후 pageContextTest2.jsp 페이지로 이동하기 --%>
	<script type="text/javascript">
// 		alert("확인");
// 		location.href = "pageContextTest2.jsp";
	</script>
	
	<%
	// 내장객체 response 활용하여 pageContextTest2.jsp 페이지로 리다이렉트
// 	response.sendRedirect("pageContextTest2.jsp");
// 	System.out.println("pageContextTest2.jsp 페이지로 리다이렉트");
	// => 클라이언트측에서 pageContextTest1.jsp 페이지를 서버로 요청하면
	//    서버측에서 클라이언트로 전송하는 응답데이터에 리다이렉트 신호(302)를 포함하여 전송하고
	//    클라이언트가 다시 pageContextTest2.jsp 페이지로 새로운 요청을 수행한다.
	//    최종적으로 서버가 클라이언트에게 pageContextTest2.jsp 페이지를 응답으로 전송함
	// => 이 때, 최종 클라이언트(웹브라우저)의 주소표시줄은 다음과 같다.
	//    http://localhost:8080/StudyJSP/jsp04_pageContext/pageContextTest2.jsp (새 주소로 변경)
	// => 이처럼, 리다이렉트 신호로 인해 새로운 요청에 의해 새 페이지로 이동 시
	//    주소표시줄의 URL(주소)가 변경되는 방식을 리다이렉트(Redirect) 라고 한다.
	
	// ================================================================================
	// 또 다른 내장 객체인 pageContext 객체의 forward() 메서드 호출하여 페이지 이동 처리
	pageContext.forward("pageContextTest2.jsp");
	System.out.println("pageContextTest2.jsp 페이지로 포워딩!");
	// => pageContextTest1.jsp 페이지가 서버에 요청되면
	//    서버측에서 forward() 메서드 파라미터로 전달된 URL(주소)에 대한 페이지를 "처리"하여
	//    "처리 결과"를 클라이언트에게 "응답 데이터로 전송"한다.
	//    따라서, 클라이언트는 서버로부터 pageContextTest1.jsp 페이지가 아닌
	//    pageContextTest2.jsp 페이지의 처리 결과를 응답 데이터로 전달받게 된다!
	// => 이 때, 최종 클라이언트(웹브라우저)의 주소표시줄 주소는 다음과 같다.
	//    http://localhost:8080/StudyJSP/jsp04_pageContext/pageContextTest1.jsp (이전 요청 주소가 유지됨)
	//    대신, 주소는 유지되지만 표시되는 내용은 포워딩 된 새 페이지의 내용이 출력됨
	// => 개발자 도구의 Network 탭을 보면, 처음 요청을 수행한 pageContextTest1.jsp 요청만 보이고
	//    서버측에서 pageContextTest2.jsp 페이지를 처리하여 응답하므로
	//    pageContextTest2.jsp 요청은 발생한 적이 없다! 따라서, 개발자도구에서도 보이지 않음!
	//    단, pageContextTest2.jsp 페이지의 응답데이터를 클라이언트측에서 수신하게 된다!
	// => 이처럼, 새로운 주소 요청 시 기존 요청 주소가 그대로 유지(변경되지 않음)되고
	//    새로운 주소에 대한 내용만 응답 데이터로 전달받는 방식을 포워딩(Forwarding) 이라고 함
	//    (정확히는 디스패치(Dispatch) 방식의 포워딩(Forwarding) 이라고 함)
	%>
</body>
</html>
















