<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%--
	[ form 태그 ]
	1) action 속성
	   - submit 동작 시 폼 태그 내의 입력값(= 폼 파라미터)를 모두 HTTP 요청 메세지에 저장 후
	     action 속성에 저장된 페이지(또는 파일)로 포워딩(이동) 작업 수행(= 해당 페이지로 요청 보냄)
	     => 이 때, HTTP 요청 메세지 형태로 전송
	2) method 속성
	   - 서버가 수행해야할 동작을 클라이언트측에서 지정
	   - GET 방식(method="get" => 기본값이므로 생략 가능)
	     => URL 에 파라미터가 함께 포함되어 전송되는 요청 방식
	        (POST 방식에 비해 빠르지만, 요청 데이터 길이 제한이 있으며, 데이터가 노출됨)
	     => ex) http://localhost:8080/StudyJSP/jsp02_request/request1_pro.jsp?name=홍길동&age=20
	   - POST 방식(method="post")
	     => URL 대신 BODY 에 파라미터를 포함하여 전송되는 요청 방식
	        (요청 데이터 길이 제한이 없으며, 데이터 노출이 최소화 되나, 상대적으로 느림)
	     => ex) http://localhost:8080/StudyJSP/jsp02_request/request1_pro.jsp
	--%>
	<h1>request1_form.jsp</h1>
<!-- 	<form action="request1_process.jsp" method="get"> -->
	<form action="request1_process.jsp" method="post">
		<table border="1">
			<tr>
				<th>이름</th>
				<td><input type="text" name="name"></td>
			</tr>
			<tr>
				<th>나이</th>
				<td><input type="text" name="age"></td>
			</tr>
			<tr>
				<th>성별</th>
				<td>
					<input type="radio" name="gender" value="M" id="gender_male"><label for="gender_male">남</label>
					<input type="radio" name="gender" value="F" id="gender_female"><label for="gender_female">여</label>
				</td>
			</tr>
			<tr>
				<th>취미</th>
				<td>
					<input type="checkbox" id="hobby1" name="hobby" value="여행"><label for="hobby1">여행</label>
					<input type="checkbox" id="hobby2" name="hobby" value="독서"><label for="hobby2">독서</label>
					<input type="checkbox" id="hobby3" name="hobby" value="게임"><label for="hobby3">게임</label>
					<input type="checkbox" id="check_all"><label for="check_all">전체선택</label>
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="submit" value="전송">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>













