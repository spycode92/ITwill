<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
// session 객체에 저장된 속성들 중에서 특정 속성 1개(속성값 포함) 제거(삭제)
// => session.removeAttribute("속성명") 활용
// ------------------------------------------------------
// 세션 객체 내에서 "sessionValue1" 속성 제거
session.removeAttribute("sessionValue1");

// sessionTest2_get.jsp 페이지로 리다이렉트
response.sendRedirect("sessionTest2_get.jsp");
%>