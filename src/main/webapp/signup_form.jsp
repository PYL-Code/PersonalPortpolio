<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>가입하기</title>
</head>
<body>
<div class="header">
	<a href="index.jsp">Instagram</a>
</div>
<div>
	<div>
		<span>Instagram</span>
		<form action="signup.jsp">
			<input type="text" name="userid" placeholder="아이디" />
			<input type="text" name="nickname" placeholder="닉네임" />
			<input type="password" name="password" placeholder="비밀번호" />
			<input type="submit" value="가입" />
		</form>
	</div>
	<div>
		<span>기존에 사용 중이거나 사용 예정인 아이디나 비밀번호를 절대 사용하지 마세요.</span>
		<span>계정이 있으신가요?</span>
		<a href="login_form.jsp">로그인</a>
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