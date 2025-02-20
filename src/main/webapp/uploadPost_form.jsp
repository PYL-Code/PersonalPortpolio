<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="header">
	<a href="index.jsp">Instagram</a>
	<a href="login.jsp"><button>로그인</button></a>
	<a href="signup.jsp"><button>가입하기</button></a>
</div>
<div class="post">
	<form action="uploadPost.jsp">
	<div>
		<span>새 게시물 만들기</span>
		<input type="submit" value="공유하기" />
	</div>
		<input type="text" name="post_txt" />
		<input type="file" name="post_img" />
	</form>
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