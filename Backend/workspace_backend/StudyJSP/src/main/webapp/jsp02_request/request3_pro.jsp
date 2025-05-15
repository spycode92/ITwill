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
	<h3>request3_pro.jsp - 회원가입 처리</h3>
	<%
	// request3_form.jsp 페이지로부터 입력받은 회원 정보 가져와서 변수에 저장
	String strName = request.getParameter("name");
	String strId = request.getParameter("id");
	String strPasswd = request.getParameter("passwd");
	String strJumin1 = request.getParameter("jumin1");
	String strJumin2 = request.getParameter("jumin2");
	String strJumin = request.getParameter("jumin1") + "-" + request.getParameter("jumin2");
	String strPostcode = request.getParameter("postcode");
	String strAddress1 = request.getParameter("address1");
	String strAddress2 = request.getParameter("address2");
	String strEmail1 = request.getParameter("email1");
	String strEmail2 = request.getParameter("email2");
	String strEmail = request.getParameter("email1") + "@" + request.getParameter("email2");
	String strJob = request.getParameter("job");
// 	String strGender = request.getParameter("gender");
	String strGender = request.getParameter("gender").equals("M") ? "남" : "여";
	
	String strJoinReason = request.getParameter("joinReason");
	
	// 취미(hobby)는 하나라도 체크했을 경우에만 배열로 가져와서 변수에 저장
	String[] arrHobby = request.getParameterValues("hobby");
	// 배열에 저장된 값을 Array.toString() 메서드로 문자열로 리턴받아 출력하거나
	// 반복문을 통해 문자열 결합을 통해 출력도 가능
	String strHobby = ""; // 배열값을 결합하여 저장할 변수 선언
	if(arrHobby != null) { // 하나라도 체크했을 경우
		// for문 사용하여 arrHobby 배열에 저장된 취미를 차례대로 꺼내서 문자열 결합("/" 기호로 구분)
		for(String hobby : arrHobby) {
			strHobby += hobby + "/";
		}
	}
	%>
	
	<%-- 회원 정보 출력 --%>
	<table border="1">
		<tr>
			<th>이름</th>
			<td><%=strName %></td>
		</tr>
		<tr>
			<th>ID</th>
			<td><%=strId %></td>
		</tr>
		<tr>
			<th>비밀번호</th>
			<td><%=strPasswd %></td>
		</tr>
		<tr>
			<th>주민번호</th>
<%-- 			<td><%=strJumin1 %>-<%=strJumin2 %></td> --%>
			<td><%=strJumin %></td>
		</tr>
		<tr>
			<th>주소</th>
			<td>
				우편번호 : <%=strPostcode %><br>
				주소 : <%=strAddress1 %> <%=strAddress2 %>
			</td>
		</tr>
		<tr>
			<th>E-Mail</th>
<%-- 			<td><%=strEmail1 %>@<%=strEmail2 %></td> --%>
			<td><%=strEmail %></td>
		</tr>
		<tr>
			<th>직업</th>
			<td><%=strJob %></td>
		</tr>
		<tr>
			<th>성별</th>
			<td><%=strGender %></td>
		</tr>
		<tr>
			<th>취미</th>
<%-- 			<td><%=Arrays.toString(arrHobby) %></td> --%>
			<td><%=strHobby %></td>
		</tr>
		<tr>
			<th>가입동기</th>
			<td><%=strJoinReason %></td>
		</tr>
	</table>
	
</body>
</html>












