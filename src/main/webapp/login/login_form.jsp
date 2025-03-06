<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String pastUrl = request.getHeader("referer");
	String userid = (String) session.getAttribute("userid");
	
	if(userid != null) {
		response.sendRedirect("../index.jsp");
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<link rel="stylesheet" href="../css/login_form.css" />
</head>
<body>
<div class="header">
    <a class="logo" href="${pageContext.request.contextPath}/index.jsp">Instagram</a>
</div>
<div class="login-container">
    <span>Instagram</span>
    <form action="login.jsp">
        <input type="text" name="userid" placeholder="아이디"/>
        <input type="password" name="password" placeholder="비밀번호" />
        <input type="hidden" name="pastUrl" value=<%=pastUrl%> />
        <input type="submit" value="로그인" />
    </form>
</div>

<div class="signup-container">
    <span>계정이 없으신가요?</span>
    <a href="signup_form.jsp">가입하기</a>
</div>

<div class="footer">
    <a href="#">소개</a>
    <a href="#">블로그</a>
    <a href="#">개인정보처리방침</a>
    <a href="#">약관</a>
    <p>ⓒ 2025. 박예림 All rights reserved</p>
</div>

</body>
</html>
