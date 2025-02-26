<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//세션 무효화
	session.invalidate();
	
	//이전 페이지 url 가져오기
	String pastUrl = request.getHeader("referer");
	//System.out.println(pastUrl);
	
	response.sendRedirect(pastUrl);
%>