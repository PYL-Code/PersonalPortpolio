<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>


</head>
<body>
<div class="header">
	<a href="index.jsp">Instagram</a>
</div>
<div>
	<div>
		<span>Instagram</span>
		<form action="login.jsp">
			<input type="text" name="userid" placeholder="아이디"/>
			<input type="password" name="password" placeholder="비밀번호" />
			<input type="submit" value="로그인" />
		</form>
	</div>
	<div>
		<span>계정이 없으신가요?</span>
		<a href="signup_form.jsp">가입하기</a>
	</div>
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