<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%-- top.jsp --%>
<%-- include(포함)될 페이지이므로 기본 HTML 태그들은 불필요(중복) --%>
<div align="right">
	<h4>
		<a href="sessionTest3.jsp">Home</a> |
		<%-- 로그인 여부에 따른 작업을 JSTL 로 처리 --%>
		<c:choose>
			<c:when test="${empty sessionScope.sId}">
				<a href="sessionTest3_login_form.jsp">Login</a> |
				<a href="sessionTest3_join_form.jsp">Join</a>
			</c:when>
			<c:otherwise>
				<%-- 로그인 했을 경우 --%>
				<a href="">${sessionScope.sId}</a> |
				<a href="javascript:logout()">Logout</a> |
				<a href="javascript:void(0)" onclick="logout()">Logout2</a>
				
				<%-- 만약, 세션 아이디가 "admin" 일 경우 [관리자페이지] 링크 추가 --%>
				<c:if test="${sessionScope.sId eq 'admin'}">
					| <a href="">관리자페이지</a>
				</c:if>
			</c:otherwise>
		</c:choose>
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









