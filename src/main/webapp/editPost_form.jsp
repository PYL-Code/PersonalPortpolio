<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
String userid = (String) session.getAttribute("userid");
String nickname = (String) session.getAttribute("nickname");

String post_no = request.getParameter("post_no");

String url = "jdbc:mysql://localhost:3306/spring5fs";
String sql_post = "select * from post where post_no=" + post_no;

String post_txt = "";

try{
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection conn = DriverManager.getConnection(url, "root", "1234");
	Statement stmt = conn.createStatement();
	ResultSet rset_post = stmt.executeQuery(sql_post);
	
	if(rset_post.next()){
		//img 파일 불러오기
		post_txt = rset_post.getString("post_txt");
	}
} catch(Exception e){
	e.printStackTrace();
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	body {
        font-family: Arial, sans-serif;
        margin: 0;
        padding: 0;
        background-color: #fafafa;
    }
    .header {
        display: flex;
        justify-content: space-between;
        align-items: center;
        background-color: #fff;
        padding: 15px 20px;
        border-bottom: 1px solid #dbdbdb;
    }
    .header .logo {
        font-size: 20px;
        font-weight: bold;
        text-decoration: none;
        color: #262626;
    }
    .header .logout {
    	font-weight: bold;
    	text-decoration: none;
    	color: #0095f6;
    }
    .header div {
        display: flex;
        gap: 10px;
    }
    .header button {
        background-color: #0095f6;
        color: white;
        border: none;
        padding: 5px 10px;
        cursor: pointer;
        border-radius: 5px;
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
    <div>
    <% 
    	if (userid == null) {
    %>
        <a href="login_form.jsp"><button>로그인</button></a>
        <a href="signup_form.jsp"><button>가입하기</button></a>
    <%
    	} else {
    %>
    	<span>안녕하세요, <%=nickname %>님</span>
    	<a class="logout" href="logout.jsp">로그아웃</a>
    <%	
    	}
    %>
    </div>
</div>
<div class="post">
	<form action="editPost.jsp">
	<div>
		<span>게시물 수정</span>
		<input type="submit" value="완료" />
	</div>
		<input type="text" name="post_txt" value="<%=post_txt %>" />
		<input type="hidden" name="post_no" value="<%=post_no %>" />
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