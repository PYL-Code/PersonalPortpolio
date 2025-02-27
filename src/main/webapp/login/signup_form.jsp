<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>가입하기</title>
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
	
	/* 메인 컨테이너 스타일 */
.container {
    display: flex;
    flex-direction: column;
    align-items: center;
    width: 100%;
    max-width: 350px;
}

/* 회원가입 박스 스타일 */
.signup {
    display: flex;
    flex-direction: column;
    align-items: center;
    background-color: white;
    padding: 30px;
    border: 1px solid #dbdbdb;
    border-radius: 5px;
    text-align: center;
    width: 100%;
    margin-top: 50px;
}

.signup span {
    font-size: 32px;
    margin-bottom: 10px;
}

/* 입력 필드 스타일 */
.signup input[type="text"],
.signup input[type="password"] {
    width: 100%;
    padding: 10px;
    margin-bottom: 8px;
    border: 1px solid #dbdbdb;
    border-radius: 3px;
    background-color: #fafafa;
    font-size: 14px;
}

/* 가입 버튼 스타일 */
.signup input[type="submit"] {
    width: 100%;
    padding: 10px;
    background-color: #0095f6;
    color: white;
    border: none;
    border-radius: 5px;
    font-weight: bold;
    cursor: pointer;
    margin-top: 10px;
}

.signup input[type="submit"]:hover {
    background-color: #0077cc;
}

/* 로그인 안내 박스 스타일 */
.toLogin {
    margin-top: 15px;
    padding: 10px;
    text-align: center;
    border: 1px solid #dbdbdb;
    border-radius: 5px;
    background-color: white;
    width: 100%;
}

.toLogin a {
    color: #0095f6;
    text-decoration: none;
    font-weight: bold;
}

.toLogin a:hover {
    text-decoration: underline;
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
    <a class="logo" href="${pageContext.request.contextPath}/index.jsp">Instagram</a>
</div>
<div class="container">
	<div class="signup">
		<span>Instagram</span>
		<form action="signup.jsp">
			<input type="text" name="userid" placeholder="아이디" />
			<input type="text" name="nickname" placeholder="닉네임" />
			<input type="password" name="password" placeholder="비밀번호" />
			<input type="submit" value="가입" />
		</form>
	</div>
	<div class="toLogin">
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