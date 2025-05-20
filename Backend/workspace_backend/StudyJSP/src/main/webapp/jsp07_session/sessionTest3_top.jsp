<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- top.jsp --%>
<%-- include(포함)될 페이지이므로 기본 HTML 태그들은 불필요(중복) --%>
<div align="right">
	<h4>
		<a href="sessionTest3.jsp">Home</a> |
		<%--
		로그인 유무에 따라 서로 다른 메뉴(하이퍼링크) 표시
		=> 로그인 하지 않았을 경우(= 세션에 저장된 sId 속성값이 null)
		   [Login] & [Join] 링크 표시
		   ex) Home | Login | Join
		=> 로그인 했을 경우(= 세션에 저장된 sId 속성값이 null 이 아님)
		   [로그인 한 사용자의 아이디] & [Logout] 링크 표시
		   ex) Home | hong | Logout
		--%>
		<%
		String id = (String)session.getAttribute("sId");
		
		if(id == null) { // 미 로그인 상태
			%>
			<a href="sessionTest3_login_form.jsp">Login</a> |
			<a href="sessionTest3_join_form.jsp">Join</a>
			<%
		} else { // 로그인 상태
			%>
			<a href=""><%=id %></a> |
<!-- 			<a href="sessionTest3_logout.jsp">Logout</a> -->
			<%--
			만약, 하이퍼링크 클릭 시 자바스크립트 함수를 통해 작업을 수행해야할 경우
			href 속성값으로 "javascript:함수명()" 형태로 자바스크립트 함수 호출 가능
			또는, href 속성값으로 "javascript:void(0)" 로 설정하고 onclick 속성으로 함수 호출도 가능
			--%>
			<a href="javascript:logout()">Logout</a> |
			<a href="javascript:void(0)" onclick="logout()">Logout2</a> |
			<%
		}
		%>
	</h4>
	<script type="text/javascript">
		// logout() 함수 정의
		// => "로그아웃하시겠습니까?" 질문에 확인 버튼 클릭 시 sessionTest3_logout.jsp 페이지로 이동
		function logout() {
			if(confirm("로그아웃하시겠습니까?")) {
				location.href = "sessionTest3_logout.jsp";
			}
		}
	</script>
</div>









