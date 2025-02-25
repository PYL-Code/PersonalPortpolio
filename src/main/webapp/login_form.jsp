<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String signupCheck = "";
	signupCheck = request.getParameter("signupCheck");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<style>
    * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
        font-family: Arial, sans-serif;
    }
    body {
        display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: center;
        height: 100vh;
        background-color: #fafafa;
    }
    .header {
	    display: flex;
	    justify-content: space-between;
	    align-items: center;
	    background-color: #fff;
	    padding: 15px 20px;
	    border-bottom: 1px solid #dbdbdb;
	    position: fixed;
	    top: 0;
	    left: 0;
	    width: 100%;
	    z-index: 1000;
	    box-sizing: border-box;
    	flex-wrap: nowrap; /* 요소가 줄 바꿈되지 않도록 설정 */
	}
	.header div {
	    display: flex;
	    gap: 10px; /* 버튼 사이 간격 추가 */
	}
	.header .logo {
	    font-size: 20px;
	    font-weight: bold;
	    text-decoration: none;
	    color: #262626;
	}
    .login-container {
        background-color: #fff;
        border: 1px solid #dbdbdb;
        padding: 40px;
        width: 350px;
        text-align: center;
        border-radius: 5px;
    }
    .login-container span {
        font-size: 24px;
        font-weight: bold;
        display: block;
        margin-bottom: 20px;
    }
    .login-container form input {
        width: 100%;
        padding: 10px;
        margin: 5px 0;
        border: 1px solid #dbdbdb;
        border-radius: 3px;
        font-size: 14px;
    }
    .login-container form input[type="submit"] {
        background-color: #0095f6;
        color: white;
        font-weight: bold;
        cursor: pointer;
        border: none;
    }
    .login-container form input[type="submit"]:hover {
        background-color: #0078d4;
    }
    .signup-container {
        margin-top: 10px;
        padding: 15px;
        background-color: #fff;
        border: 1px solid #dbdbdb;
        width: 350px;
        text-align: center;
        border-radius: 5px;
    }
    .signup-container a {
        color: #0095f6;
        text-decoration: none;
        font-weight: bold;
    }
    .footer {
    position: absolute;
    bottom: 10px;
    text-align: center;
    font-size: 12px;
    color: #8e8e8e;
    width: 100%;
    border-top: 1px solid #dbdbdb; /* 상단 border 추가 */
    padding-top: 10px; /* border와 내용 간격 */
	}
	
	.footer a {
	    text-decoration: none;
	    color: #8e8e8e;
	    margin: 0 5px;
	}
	
	.footer p {
	    margin-top: 10px; /* a 태그와 간격 추가 */
	}
</style>
</head>
<body>
<div class="header">
    <a class="logo" href="index.jsp">Instagram</a>
</div>
<div class="login-container">
    <span>Instagram</span>
    <form action="login.jsp">
        <input type="text" name="userid" placeholder="아이디"/>
        <input type="password" name="password" placeholder="비밀번호" />
        <input type="hidden" name="signupPage" value=<%=signupCheck %> />
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
