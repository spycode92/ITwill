<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
// 세션 객체 내에서 "sessionValue2" 속성 제거
session.removeAttribute("sessionValue2");

// sessionTest2_get.jsp 페이지로 리다이렉트
response.sendRedirect("sessionTest2_get.jsp");
%>